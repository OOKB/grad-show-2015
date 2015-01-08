{exec} = require('child_process')
async = require 'async'
_ = require 'queries'

data = require '../app/data'

render = (pg) ->
  (cb) ->
    exec 'coffee ./scripts/renderMarkup.coffee --pg='+pg, (err, stdout, stderr) ->
      if stdout
        console.log stdout
      cb err

usrPgs = _.map data.students, (student) ->
  render "/students/#{student.uid}"

async.parallelLimit usrPgs, 5, (done) ->
  console.log 'done'
  return
