React = require 'react'
{div, h2, ul, li, a, img} = require 'reactionary'
{Navigation} = require 'react-router'

SlideThumb    = require './slideThumb'
ImageCaption  = require './imageCaption'

module.exports = React.createClass
  mixins: [Navigation]
  # getInitialState: ->
  handleActiveClick: ->
    next_i = @props.img_i+1
    usr = @props.usr
    if next_i == usr.files.length then next_i = 0
    @replaceWith 'usrProfile', {uid: usr.uid, img: next_i}

  render: ->
    usr = @props.usr
    activeFile = @props.img
    last_i = usr.files.length-1
    img_i = @props.img_i
    div
      id: 'slideshow',
        div # LARGE ACTIVE IMAGE
          className: 'active-image',
            img
              onClick: @handleActiveClick
              src: activeFile.largeSrc
            if @props.img then ImageCaption @props else false
            ImageCaption @props
        ul
          className: 'thumbs',
            usr.files.map (img, i) ->
              file =
                key: img.fileName
                src: img.thumbSrc
                classNames:
                  first: i == 0
                  last: i == last_i
                  active: i == img_i
                title: img.metadata.title
                i: i
                uid: usr.uid
              SlideThumb file
