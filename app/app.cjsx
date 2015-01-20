React = require 'react'
_ = require 'queries'
Router = require 'react-router'
{Route, DefaultRoute} = Router

Routes = require './routes'

data = require './data'
data.imgNum = 1
delete data.students
delete data.schema

inBrowser = typeof window isnt "undefined"

App = (vars, render) ->
  path = vars.path or '/'

  Render = (Handler) ->
    # This is the default props sent to the Index view.
    render Handler, {data: data, vars: vars, kai:'ppo'}

  if inBrowser
    data.windowInnerWidth = window.innerWidth
    Router.run Routes(data), Router.HistoryLocation, Render
  else
    Router.run Routes(data), path, Render

if inBrowser
  window.onload = -> # Attach event handlers.
    # Attach app to global window var as app.
    window.app =
      db: data # Our database.
    render = (Handler, props) ->
      React.render React.createElement(Handler, props), document
    App {}, render

module.exports = App
