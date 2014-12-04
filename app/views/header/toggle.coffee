React = require 'react'
{button} = require 'reactionary'
cx = require '../cx'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    # No need for button on larger display.
    if @props.windowInnerWidth > 767
      console.log @props.windowInnerWidth
      return false
    # Show button when width is < 768
    button
      onClick: @props.handleToggle
      className: cx
        toggle: true
      type: 'button',
        'Reveal Menu'
