React = require 'react'

Contact = require './contact'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    {fullName, programName, locationName, showDates} = @props.usr
    <div className="student-details">
      <h2>{fullName}</h2>
      <ul className="show-details">
        <li className="program"><h3>{programName}</h3></li>
        <li className="location">{locationName}</li>
        <li className="show-dates">{showDates}</li>
      </ul>
      <Contact usr={@props.usr} />
    </div>
