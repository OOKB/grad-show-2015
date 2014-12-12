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
    # Filter Students
    # Default to something
    q = @props.query or {}
    unless q.program or q.location or q.showDate
      q.program = 'teaching-ma'
    if data.students and data.students.where
      studentData = data.students.where q
    else
      studentData = data.students
    div
      id: 'react-app',
        Header @props
        Intro null
        Schedule null
        Galleries data
        innerads
        Students
          query: q
          students: studentData
        Footer data
