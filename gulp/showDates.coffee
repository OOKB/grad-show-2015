fs = require 'fs'
yaml = require 'js-yaml'
_ = require 'lodash'
r = require 'request'

txt = fs.readFileSync './content/schedule.yaml', 'utf8'
data = yaml.safeLoad txt
unless _.isArray data then return

update = []
data.forEach (showArr, i) ->
  showArr.forEach (uid) ->
    update.push uid: uid, showNum: i+1

console.log update
