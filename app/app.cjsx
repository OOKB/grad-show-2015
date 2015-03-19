React = require 'react'
_ = require 'lodash'
Router = require 'react-router'
{Route, DefaultRoute} = Router
http = require 'superagent'

Routes = require './routes'

inBrowser = typeof window isnt "undefined"

App = (data, render) ->
  if not data.path then data.path = '/'
  {students, schema, programs, locations} = data
  data.programs = require('./models/programs')(programs)
  data.imgNum = 1
  StudentCollection = require('./models/students')(schema, locations, data.programs)
  data.students = new StudentCollection students, parse: true
  data.data.locationSettings.points = []
  _.each locations, (loc) ->
    if loc.geoData
      data.data.locationSettings.points.push {
        latitude: loc.geoData.location.lat
        longitude: loc.geoData.location.lng
        label: loc.name
      }
  console.log 'process data'
  Render = (Handler) ->
    # This is the default props sent to the Index view.
    render Handler, data

  if inBrowser
    data.windowInnerWidth = window.innerWidth
    Router.run Routes, Router.HistoryLocation, Render
  else
    Router.run Routes, data.path, Render

if inBrowser
  window.onload = -> # Attach event handlers.
    render = (Handler, props) ->
      React.render React.createElement(Handler, props), document
    console.log 'Client js loaded. Fetch data.'
    http.get('/index.json').accept('json').end (err, res) =>
      if err
        return console.error err
      if res and res.body
        # Attach app to global window var as app.
        window.app = data = res.body
        # Trigger render.
        App data, render
        console.log 'Init react with data.'
      else
        console.error err or res

module.exports = App
