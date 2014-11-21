React = require 'react'
{div, h2, h3, ul, li, a} = require 'reactionary'

Contact = require './contact'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    usr = @props.usr
    div
      className: 'student-details',
        h2 usr.firstName, ' ', usr.lastName
        ul
          className: 'show-details',
            li
              className: 'program',
                h3 usr.program
            li
              className: 'location',
                usr.location
            li
              className: 'show-dates',
                usr.showDates or 'Mar 28-Apr 06, 2015'
        Contact @props
