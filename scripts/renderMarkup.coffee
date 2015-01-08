# Core node modules.
fs = require 'fs-extra'
path = require 'path'
_ = require 'queries'

# Contrib.
nodejsx = require 'coffee-react/register'
React = require 'react'
{Router} = require 'react-router'

production = process.env.NODE_ENV is "production"

data = require '../app/data'
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

pages = ['/']
usrPgs = _.map data.students, (student) ->
  "/students/#{student.uid}"

if production
  pages = pages.concat usrPgs

_.each pages, (pg) ->
  processPg pg
