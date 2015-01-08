React = require 'react'
{Link, Navigation} = require 'react-router'

module.exports = React.createClass
  # getInitialState: ->
  mixins: [Navigation]
  render: ->
    {prevPeer, nextPeer, uid} = @props.usr

    if prevPeer and prevPeer.uid
      prevClick = (e) =>
        e.preventDefault()
        @replaceWith 'usrProfile', {uid: prevPeer.uid}
      Prev = <li className="previous">
        <Link onClick={prevClick} params={uid:prevPeer.uid} to="usrProfile">
          {"\u2190"}
        </Link>
      </li>
    else
      console.log 'no prev peer', uid

    if nextPeer and nextPeer.uid
      nextClick = (e) =>
        e.preventDefault()
        @replaceWith 'usrProfile', {uid: nextPeer.uid}
      Next = <li className="next">
        <Link onClick={nextClick} params={uid:nextPeer.uid} to="usrProfile">
          {"\u2192"}
        </Link>
      </li>
    else
      console.log 'no next peer', uid

    <ul className="student-nav">
      {Prev}
      {Next}
    </ul>
