React = require 'react'
{div, h2, ul, li, a, img} = require 'reactionary'

SlideThumb = require './slideThumb'
ImageCaption = require './imageCaption'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    usr = @props.usr
    activeFile = @props.img
    last_i = usr.files.length-1
    img_i = @props.img_i
    div
      id: 'slideshow',
        div
          className: 'active-image',
            img
              src: activeFile.largeSrc
            ImageCaption @props
        ul
          className: 'thumbs',
            usr.files.map (img, i) ->
              file =
                key: img.fileName
                src: img.thumbSrc
                first: i == 0
                last: i == last_i
                title: img.metadata.title
                i: i
                uid: usr.uid
                active: i == img_i
              SlideThumb file
