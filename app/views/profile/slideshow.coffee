React = require 'react'
{div, h2, ul, li, a, img} = require 'reactionary'

SlideThumb = require './slideThumb'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    usr = @props.usr
    activeFile = @props.usr.files.models[0]
    activeImage =
      img
        src: activeFile.largeSrc
    last_i = usr.files.length-1

    div
      id: 'slideshow',
        div
          className: 'active-image',
            activeImage
        ul
          className: 'thumbs',
            usr.files.map (img, i) ->
              file =
                key: img.fileName
                src: img.thumbSrc
                first: i == 0
                last: i == last_i
                title: img.metadata.title
              SlideThumb file
