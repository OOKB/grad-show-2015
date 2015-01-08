# Core node modules.
fs = require 'fs-extra'
path = require 'path'
_ = require 'queries'

# Contrib.
nodejsx = require 'coffee-react/register'
React = require 'react'
{Router} = require 'react-router'

data = require '../app/data'

# Custom.
App = require '../app/app'

# Run Code.
# app = App
render = (Handler, props) ->
  filePath = path.join 'public', props.vars.path, 'index.html'
  markup = React.renderToString React.createElement(Handler, props)
  fs.mkdirsSync path.dirname(filePath)
  fs.writeFileSync(filePath, "<!doctype html>\n" + markup)

processPg = (path) ->
  vars = {path: path}
  App vars, render

pages = ['/']
usrPgs = _.map data.students, (student) ->
  "/students/#{student.uid}"
# pages = pages.concat usrPgs
_.each pages, (pg) ->
  processPg pg
