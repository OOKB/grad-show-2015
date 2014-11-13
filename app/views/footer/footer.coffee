React = require 'react'
{footer, div, img, ul, li} = require 'reactionary'

Credits = require './credits'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    footer null,
      div
        className: 'container',
          img
            src: 'images/mica_lockup_transp.png'
            alt: 'MICA Logo'
          Credits @props
          ul
            className: 'author',
              li @props.author
              li @props.address
              li @props.city, ', ', @props.state, @props.zip
              li @props.phone
