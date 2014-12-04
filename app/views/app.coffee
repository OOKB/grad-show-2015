React = require 'react'
{h1, div, p, script} = require 'reactionary'
{Navigation, CurrentPath} = require 'react-router'

Header = require './header/header'
Intro = require './intro/intro'
Schedule = require './schedule/schedule'
Galleries = require './galleries/galleries'
Students = require './students/students'
Footer = require './footer/footer'

module.exports = React.createClass
  #getInitialState: ->
  #mixins: [Navigation, CurrentPath]
  render: ->
    data = @props.data
    if @props.activeRouteHandler
      innerads = @props.activeRouteHandler(null)
    else
      innerads = false
    div
      id: 'react-app',
        Header @props
        Intro null
        Schedule null
        Galleries data
        innerads
        Students data
        Footer data
