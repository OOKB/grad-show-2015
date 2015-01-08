React = require 'react'
{Link, Navigation} = require 'react-router'

module.exports = React.createClass
  mixins: [Navigation]
  # getInitialState: ->
  peerEl: (model) ->
    {uid, fullName} = model
    onClick = (e) =>
      e.preventDefault()
      @replaceWith 'usrProfile', {uid: uid}
      return false

    <li key={uid} className="peer">
      <Link onClick={onClick} params={uid:uid} to="usrProfile">
        {fullName}
      </Link>
    </li>


  render: ->
    {programName, peers} = @props.usr
    <aside className="program-list">
      <h3>{programName}</h3>
      <ul className="program-peers">
        {peers.map @peerEl}
      </ul>
    </aside>
