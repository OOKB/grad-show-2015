React = require 'react'
{div, h2, ul, li, a, img} = require 'reactionary'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    div
      id: 'slideshow',
        div
          className: 'active-image',
            img
              src: 'http://mfa.cape.io/img/slides/385503/02.jpg'
        ul
          className: 'thumbs',
            li
              className: 'first',
                img
                  src: 'http://mfa.cape.io/img/slides/385503/01.jpg'
