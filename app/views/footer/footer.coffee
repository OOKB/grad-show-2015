React = require 'react'
{footer, div, img, ul, li, a} = require 'reactionary'

Credits = require './credits'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    footer null,
      div
        className: 'container',
          a
            href: 'http://www.mica.edu/'
            target: '_blank',
            className: 'micalogo',
              img
                src: 'images/mica_lockup_transp.png'
                alt: 'MICA Logo'
          ul
            className: 'author address',
              li @props.author
              li @props.street
              li @props.city, ', ', @props.state, ' ', @props.zip
              li @props.phone
          Credits @props
