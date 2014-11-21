React = require 'react'
{li, img} = require 'reactionary'
{Navigation} = require 'react-router'

module.exports = React.createClass
  mixins: [Navigation]
  # getInitialState: ->
  handleClick: ->
    @transitionTo 'usrProfile', {uid: @props.uid, img: @props.i}

  render: ->
    if @props.first
      thumbClassName = 'thumb first'
    else if @props.last
      thumbClassName = 'thumb last'
    else
      thumbClassName = 'thumb'

    li
      className: thumbClassName,
        img
          onClick: @handleClick
          src: @props.src
          alt: @props.title
