React = require 'react'
{div, ul, li, img, h4} = require 'reactionary'
{Navigation} = require 'react-router'

module.exports = React.createClass
  mixins: [Navigation]
  # getInitialState: ->

  handleClick: ->
    @transitionTo 'usrProfile', {uid: @props.model.uid}

  render: ->
    li
      id: @props.model.uid
      onClick: @handleClick
      className: 'student',
        img
          src: @props.model.pic
        ul
          className: 'info',
            li
              className: 'name',
                h4
                  @props.model.fullName
            li
              className: 'program',
                @props.model.programName
            li
              className: 'location',
                @props.model.locationName
            li
              className: 'show-date',
                @props.model.showDate
