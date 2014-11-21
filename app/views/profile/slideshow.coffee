React = require 'react'
{div, h2, ul, li, a, img} = require 'reactionary'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    usr = @props.usr
    activeFile = @props.usr.files.models[0]
    activeImage =
      img
        src: activeFile.largeSrc
    div
      id: 'slideshow',
        div
          className: 'active-image',
            activeImage
        ul
          className: 'thumbs',
            li
              className: 'first',
                img
                  src: 'http://mfa.cape.io/img/slides/385503/01.jpg'
