r = require 'request'
_ = require 'queries'
async = require 'async'
fs = require 'fs-extra'
imgix = require './imgix'

makeReq = (url, handleData) ->
  (cb) ->
    console.log 'requesting', url
    r url, (err, resp, body) ->
      unless err
        body = JSON.parse body
        if _.isFunction handleData
          console.log 'process data', url
          body = handleData body
      cb err, body


module.exports = (callback) ->
  data = fs.readJsonSync 'app/data/data.json'
  unless data
    callback()
    return

  getData = {}

  url = 'https://mica.ezle.io/users.json'
  getData.students = makeReq url

  save = (err, serverData) ->
    throw err if err

    data = _.extend data, serverData

    fs.outputJsonSync 'app/data/index.json', data
    if _.isFunction callback
      callback()

  async.parallel getData, save
