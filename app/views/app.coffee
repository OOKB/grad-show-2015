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
    #console.log RouteContext
    data = @props
    div
      id: 'react',
        Header data
        Intro null
        Schedule null
        Galleries data
        Students null
        Footer data
