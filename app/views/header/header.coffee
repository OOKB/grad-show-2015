React = require 'react'
{header, h1, div, img} = require 'reactionary'

Logo = require './logo'
Nav = require './nav'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    header null,
      img
        className: 'backgroundfill'
        src: 'images/id0513690.jpg'
        alt: 'Header Art'
      Logo null
      h1
        style: {display: 'none'},
          @props.title
      div
        className: 'down-arrow',
          "\\/"
      Nav @props
