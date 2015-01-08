React = require 'react'
{Navigation} = require 'react-router'
cx = require '../cx'

module.exports = React.createClass
  mixins: [Navigation]
  # getInitialState: ->
  handleClick: ->
    {uid, i} = @props
    @replaceWith 'usrProfile', {uid: uid, img: i}

  render: ->
    {classNames, src, title} = @props
    thumbClassName = classNames or {}
    thumbClassName.thumb = true

    <li className={cx(thumbClassName)}>
      <img onClick={@handleClick} src={src} alt={title} />
    </li>
