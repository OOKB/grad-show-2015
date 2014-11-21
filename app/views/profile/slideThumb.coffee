React = require 'react'
{li, img} = require 'reactionary'

module.exports = React.createClass
  # getInitialState: ->

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
          src: @props.src
          alt: @props.title
