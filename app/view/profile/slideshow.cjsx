React = require 'react'
{Navigation} = require 'react-router'

SlideThumb    = require './slideThumb'
ImageCaption  = require './imageCaption'

module.exports = React.createClass
  mixins: [Navigation]
  # getInitialState: ->
  handleActiveClick: ->
    {img_i, usr} = @props
    img_i = img_i or 0
    console.log img_i
    next_i = img_i+1
    if next_i == usr.files.length
      next_i = '0'
    console.log next_i
    @replaceWith 'usrProfile', {uid: usr.uid, img: next_i}

  render: ->
    {usr, img, img_i} = @props
    {files, uid} = usr
    activeFile = img
    last_i = files.length-1
    console.log 'render ', img_i

    <div id="slideshow">
      <div className="active-image">
        <img src={activeFile.largeSrc} onClick={@handleActiveClick} alt="art" />
        <ImageCaption img={activeFile} />
      </div>
      <ul className="thumbs">
        {files.map (img, i) ->
          {fileName, thumbSrc, metadata} = img
          <SlideThumb key={fileName} src={thumbSrc} title={metadata.title} i={i} uid={uid}
            classNames={first:i is 0, last: i is last_i, active: i is img_i} />
        }
      </ul>
    </div>
