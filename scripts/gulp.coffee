path = require 'path'
#fs = require 'fs-extra'
exec = require('child_process').exec
fs = require 'fs-extra'
gulp = require 'gulp'
r = require 'request'

browserSync = require 'browser-sync'

browserify = require 'browserify'
exorcist = require 'exorcist'
watchify = require 'watchify'
#bd = require 'browserify-data'

buffer = require 'vinyl-buffer'
source = require 'vinyl-source-stream'
transform = require 'vinyl-transform'

less = require 'gulp-less'
gutil = require 'gulp-util'
clean = require 'gulp-clean'
#zopfli = require 'gulp-zopfli'
rename = require 'gulp-rename'
uglify = require 'gulp-uglify'
gdata = require 'gulp-data'
debug = require 'gulp-debug'
deploy = require 'gulp-gh-pages'
runSequence = require 'run-sequence'
markdown = require 'gulp-markdown-to-json'
yaml = require 'gulp-yaml'
sourcemaps = require 'gulp-sourcemaps'

serverData = require './serverData'
content = require './content'

# Default gulp tasks watches files for changes
gulp.task "default", ['browser-sync'], ->
  gulp.watch "styles/*.less", ["styles", browserSync.reload]
  gulp.watch 'static/**', ['static', browserSync.reload]
  return

# For development.
gulp.task "browser-sync", ['compile-watch', 'styles', 'static'], ->
  browserSync
    proxy: 'l.micagradshow.com'#"localhost:8088"
    logConnections: true
    injectChanges: true
    #logLevel: 'debug'
  return

# This generate js app file.
gulp.task 'compile', ->
  {sha} = fs.readJsonSync './app/data/index.json'
  fs.mkdirsSync './public/assets'
  browserified = transform (filename) ->
    b = browserify {debug: true, extensions: ['.cjsx', '.coffee']}
    b.add filename
    #b.transform 'coffee-reactify'
    b.bundle()
  gulp.src 'app/app.cjsx'
    .pipe browserified
    # Rename the file.
    .pipe rename("#{sha}.js")
    # Extract the map.
    .pipe transform(-> exorcist("./public/assets/#{sha}.js.map"))
    # Shrink the codebase.
    .pipe uglify()
    .pipe gulp.dest('./public/assets')

# WATCHIFY
opts = watchify.args
opts.extensions = ['.coffee', '.cjsx']
opts.debug = true
w = watchify browserify('./app/app.cjsx', opts)
gulp.task 'bundle', ->
  w.bundle()
    .on 'error', gutil.log.bind gutil, 'Browserify Error'
    .pipe source('app.js')
      .pipe buffer()
      .pipe(sourcemaps.init({loadMaps: true}))
      .pipe(sourcemaps.write('./'))
    .pipe gulp.dest('./public/assets')
    .pipe browserSync.reload({stream:true})

w.on 'update', () ->
  # Remove the sorted set (from Redis) that contains all valid compiled routes.
  runSequence 'bundle'

gulp.task 'compile-watch', (cb) ->
  runSequence 'bundle', cb
  return
# /WATCHIFY

# Process LESS to CSS.
gulp.task 'less', ->
  gulp.src(["styles/app.less", 'styles/print.less', 'styles/iefix.less'])
    .pipe less()
    .pipe gulp.dest("./public/assets")

gulp.task 'styles', ['less'], ->
  {sha} = fs.readJsonSync './app/data/index.json'
  gulp.src('./public/assets/app.css')
    .pipe(rename(sha+'.css'))
    .pipe(gulp.dest('./public/assets'))

# Copy static files.
gulp.task 'static', ->
  gulp.src('./static/**')
    .pipe gulp.dest('./public/')

# - - - - prod - - - -
gulp.task 'prod', ['prod_clean'], (cb) ->
  runSequence ['static', 'serverData'], ['templates_all', 'compile', 'styles'], cb

# Remove contents from public directory.
gulp.task 'prod_clean', ->
  gulp.src('./public', read: false)
    .pipe(clean())


gulp.task 'deploy', ['prod'], ->
  gulp.src './public/**/*'
    .pipe deploy cacheDir: './tmp'

# gulp.task 'templatesProd', ->
#   exec('coffee gulp/compileProd.coffee')

gulp.task 'set_sha', (cb) ->
  r_ops =
    uri: 'https://api.github.com/repos/cape-io/mica.ezle.io/branches/master'
    json: true
    headers:
      'user-agent': 'request.js'
  r r_ops, (err, response, body) ->
    if err then throw err
    global.sha = body.commit.sha
    fs.outputJsonSync 'app/data/commit.json', body.commit
    cb()
  return


gulp.task 'prod_static', ->
  gulp.src('./static/**')
    .pipe gulp.dest('./prod/')

gulp.task 'cssProd', ->
  runSequence 'set_sha', ['copy_css', 'templatesProd']
  return


gulp.task 'compress', ->
  gulp.src("./prod/*.{js,css,html,json}")
    .pipe(zopfli())
    .pipe(gulp.dest("./prod"))
