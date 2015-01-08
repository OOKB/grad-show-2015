React = require 'react'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    {title, medium, sizeDisplay, year} = @props.img.metadata
    <ul className="image-caption">
      <li className="title"><h3>{title}</h3></li>
      <li className="medium">{medium}</li>
      <li className="size-year">
        <span className="size">{sizeDisplay}</span>
        {if sizeDisplay and year then ', ' else undefined}
        {if year then <span className="year">{year}</span> else undefined}
      </li>
    </ul>
