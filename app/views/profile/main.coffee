React = require 'react'
{div} = require 'reactionary'

ProgramList = require './programList'
Slideshow = require './slideshow'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    div
      className: 'student-main',
        Slideshow @props
        ProgramList @props
