React = require 'react'
{Navigation} = require 'react-router'

module.exports = React.createClass
  mixins: [Navigation]
  # getInitialState: ->

  handleClick: ->
    @transitionTo 'usrProfile', {uid: @props.model.uid}

  render: ->
    {pic, uid, fullName, programName, locationName, showDate} = @props.model

    <li id={uid} onClick={@handleClick} className="student">
      <img src={pic} alt={fullName} />
      <ul>
        <li className="name"><h4>{fullName}</h4></li>
        <li className="program">{programName}</li>
        <li className="location">{locationName}</li>
        <li className="show-date">{showDate}</li>
      </ul>
    </li>
