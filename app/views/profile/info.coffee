React = require 'react'
{div} = require 'reactionary'

Details = require './details'
StudentNav = require './studentNav'

# We need file and user models.

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    div
      className: 'student-info',
        Details @props
        StudentNav @props
