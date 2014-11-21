React = require 'react'
{div} = require 'reactionary'

ProgramList = require './programList'
Slideshow = require './slideshow'
NoImages = require './noImages'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    usr = @props.usr
    div
      className: 'student-main',
        if usr.files.length then Slideshow @props else NoImages(null)
        ProgramList @props
