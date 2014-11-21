React = require 'react'
{article, div, button} = require 'reactionary'
{Navigation} = require 'react-router'

Info = require './info'
Main = require './main'

module.exports = React.createClass
  mixins: [Navigation]
  # getInitialState: ->
  #/students
  handleClose: ->
    @transitionTo '/students'

  render: ->
    article
      id: 'student-overlay'
      className: 'student-',
        button
          role: 'button'
          onClick: @handleClose
          className: 'close',
            'x'
        div
          className: 'container row',
            Info @props
            Main @props
