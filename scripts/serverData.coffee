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
        unless _.isObject body
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

  url = 'https://mica.ezle.io/sheetData.json'
  getData.sheetData = makeReq url

  r_ops =
    uri: "https://api.github.com/repos/#{data.github}/branches/master"
    json: true
    headers:
      'user-agent': 'request.js'

  getData.github = makeReq r_ops

  save = (err, serverData) ->
    throw err if err

    data.sha = serverData.github.commit.sha
    data.students = serverData.sheetData.students
    data.galleries = serverData.sheetData.galleries

    fs.outputJsonSync 'app/data/index.json', data
    if _.isFunction callback
      callback()

  async.parallel getData, save
