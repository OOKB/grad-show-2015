React = require 'react'
{header, h1, div} = require 'reactionary'

Logo = require './logo'
Nav = require './nav'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    header
      className: 'header-art-1',
        Logo null
        h1
          style: {display: 'none'},
            @props.title
        div
          className: 'down-arrow',
            "\\/"
        Nav @props
