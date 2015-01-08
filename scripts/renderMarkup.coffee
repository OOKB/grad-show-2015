# Core node modules.
fs = require 'fs-extra'
path = require 'path'
_ = require 'queries'
argv = require('minimist')(process.argv.slice(2))
production = process.env.NODE_ENV is "production"

nodejsx = require 'coffee-react/register'

React = require 'react'
{Router} = require 'react-router'

App = require '../app/app'

# Run Code.
# app = App
render = (Handler, props) ->
  filePath = path.join 'public', props.vars.path, 'index.html'
  markup = React.renderToString React.createElement(Handler, props)
  fs.mkdirsSync path.dirname(filePath)
  fs.writeFileSync(filePath, "<!doctype html>\n" + markup)

processPg = (path) ->
  console.log path
  vars = {path: path}
  App vars, render
  return

pg = argv.pg or '/'

processPg pg

return
