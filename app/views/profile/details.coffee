React = require 'react'
{div, h2, h3, ul, li, a} = require 'reactionary'

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
                usr.showDates
        ul
          className: 'contact-info',
            li
              className: 'website',
                a
                  href: usr.website
            li
              className: 'email',
                a
                  href: usr.email
