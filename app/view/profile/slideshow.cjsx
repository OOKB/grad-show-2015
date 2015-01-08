React = require 'react'
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
    {files, uid} = @props.usr
    activeFile = @props.img
    last_i = files.length-1
    img_i = @props.img_i

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
