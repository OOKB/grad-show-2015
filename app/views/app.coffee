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
    program = (@props.query and @props.query.program) or 'teaching-ma'
    if data.students and data.students.where
      studentData = data.students.where program: program
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
          program: program
          students: studentData
        Footer data
