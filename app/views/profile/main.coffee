React = require 'react'
{div} = require 'reactionary'

ProgramList = require './programList'
Slideshow = require './slideshow'
NoImages = require './noImages'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    usr = @props.usr
    img = @props.img
    div
      className: 'student-main',
        if img then Slideshow @props else NoImages(null)
        div
          className: 'statement',
            dangerouslySetInnerHTML:
              __html: usr.statement
        ProgramList @props
