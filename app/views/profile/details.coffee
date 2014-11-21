React = require 'react'
{div, h2, h3, ul, li, a} = require 'reactionary'

Contact = require './contact'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    usr = @props.usr
    div
      className: 'student-details',
        h2 usr.fullName
        ul
          className: 'show-details',
            li
              className: 'program',
                h3 usr.programName
            li
              className: 'location',
                usr.locationName
            li
              className: 'show-dates',
                usr.showDates or 'Mar 28-Apr 06, 2015'
        Contact @props
