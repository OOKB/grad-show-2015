React = require 'react'
{Link, Navigation} = require 'react-router'

module.exports = React.createClass
  # getInitialState: ->
  mixins: [Navigation]
  render: ->
    {prevPeer, nextPeer} = @props.usr
    prevClick = (e) =>
      e.preventDefault()
      @replaceWith 'usrProfile', {uid: prevPeer.uid}
    nextClick = (e) =>
      e.preventDefault()
      @replaceWith 'usrProfile', {uid: nextPeer.uid}

    <ul className="student-nav">
      <li className="previous">
        <Link onClick={prevClick} params={uid:prevPeer.uid} to="usrProfile">
          {"\u2190"}
        </Link>
      </li>
      <li className="next">
        <Link onClick={nextClick} params={uid:nextPeer.uid} to="usrProfile">
          {"\u2192"}
        </Link>
      </li>
    </ul>
