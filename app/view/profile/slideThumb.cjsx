React = require 'react'
{Navigation} = require 'react-router'
cx = require '../cx'

module.exports = React.createClass
  mixins: [Navigation]
  # getInitialState: ->
  handleClick: ->
    {uid, pos, type} = @props
    @replaceWith 'usrProfile', {uid: uid}, {type: type, pos: pos}

  render: ->
    {classNames, src, title, onMouseOver} = @props
    thumbClassName = classNames or {}
    thumbClassName.thumb = true

    inlineStyle = height: '76px'
    imgSrc = src.replace('#', '%23')
    <li className={cx(thumbClassName)} style={inlineStyle}>
      <img onMouseOver={onMouseOver} onClick={@handleClick} src={imgSrc}
        alt={title} />
    </li>
