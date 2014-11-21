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
    div
      id: 'react-app',
        Header @props
        Intro null
        Schedule null
        Galleries data
        Students data
        Footer data
