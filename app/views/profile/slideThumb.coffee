React = require 'react'
{li, img} = require 'reactionary'
{Navigation} = require 'react-router'
cx = require '../cx'

module.exports = React.createClass
  mixins: [Navigation]
  # getInitialState: ->
  handleClick: ->
    @replaceWith 'usrProfile', {uid: @props.uid, img: @props.i}

  render: ->
    thumbClassName = @props.classNames or {}
    thumbClassName.thumb = true

    li
      className: cx(thumbClassName),
        img
          onClick: @handleClick
          src: @props.src
          alt: @props.title
