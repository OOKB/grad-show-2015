React = require 'react'
{Navigation} = require 'react-router'

SlideThumb    = require './slideThumb'
ImageCaption  = require './imageCaption'

module.exports = React.createClass
  mixins: [Navigation]
  # getInitialState: ->
  handleActiveClick: ->
    {pos, usr} = @props
    pos = pos or 0
    # console.log pos
    nextPos = pos+1
    if nextPos == usr.files.length
      nextPos = 0
    @replaceWith 'usrProfile', {uid: usr.uid}, {type: 'img', pos: nextPos}


  render: ->
    {usr, file, pos, type} = @props
    {files, uid, embeds} = usr

    thumbEl = []
    if files and files.length
      lastPos = files.length-1
      files.forEach (file, i) ->
        {fileName, thumbSrc, metadata} = file
        thumbEl.push <SlideThumb key={fileName} src={thumbSrc} title={metadata.title} pos={i} uid={uid} type='img'
          classNames={
            first: i is 0
            last: i is lastPos
            active: i is pos and type is 'img'} />
    # This and the above should be combined into one process.
    if embeds and embeds.length
      lastPos = embeds.length-1
      embeds.forEach (embed, i) ->
        {thumbnail_url, title} = embed.oembed
        thumbEl.push <SlideThumb key={i} src={thumbnail_url} title={title} pos={i} uid={uid} type='embed'
          classNames={
            first: i is 0
            last: i is lastPos
            active: i is pos and type is 'embed'} />

    # embeds.forEach (embed, i) ->
    if type is 'img'
      imgSrc = file.largeSrc.replace('#', '%23')
      activeFileEl = <div className="grouped">
        <div className="active-image">
          <img src={imgSrc} onClick={@handleActiveClick} alt="art" />
        </div>
        <ImageCaption img={file} />
      </div>
    else if type is 'embed'
      {html, title, description} = file.oembed
      activeFileEl = <div className="active-embed">
        <div className="slideshow-iframe" dangerouslySetInnerHTML={__html: html} />
        <ul className="caption">
          <li className="title"><h3>{title}</h3></li>
          <li className="description">{description}</li>
        </ul>
      </div>

    <div id="slideshow">
      {activeFileEl}
      <ul className="thumbs">
        {thumbEl}
      </ul>
    </div>
