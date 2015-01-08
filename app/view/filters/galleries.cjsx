React = require 'react'
{Link} = require 'react-router'

data = require '../../data/locations.json'
filterItems = data.locations

module.exports = React.createClass
  # getInitialState: ->
  #mixins: [Navigation]

  render: ->
    {onClick} = @props
    clickFunc = ->
      onClick()
      document.querySelector('#students').scrollIntoView(true)

    <ul className="dropdown-menu" id="location-filter">
      {filterItems.map (item) ->
        {value, name} = item
        <li key={value} onClick={clickFunc} className="gallery">
          <Link query={location: value} to="app">{name}</Link>
        </li>
      }
    </ul>
