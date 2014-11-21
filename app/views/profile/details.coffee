React = require 'react'
{div, h2, ul, li, a} = require 'reactionary'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    div
      className: 'student-details',
        h2 @props.firstName, ' ', @props.lastName
        ul
          className: 'show-details',
            li
              className: 'program',
                h3 @props.program
            li
              className: 'location',
                @props.location
            li
              className: 'show-dates',
                @props.showDates
        ul
          className: 'contact-info',
            li
              className: 'website',
                a
                  href: @props.website
            li
              className: 'email',
                a
                  href: @props.email
