React = require 'react'
{div, ul, li, img, h4} = require 'reactionary'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    li
      id: @props.uid
      className: 'student',
        img
          src: @props.pic
        ul
          className: 'info',
            li
              className: 'name',
                h4
                  @props.fullName
            li
              className: 'program',
                @props.programName
            li
              className: 'location',
                @props.locationName
            li
              className: 'show-date',
                @props.showDate
