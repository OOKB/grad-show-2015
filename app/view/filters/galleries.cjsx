React = require 'react'
_ = require 'lodash'

{Link} = require 'react-router'

{locations} = require('../../data/').galleries

locationFilters = _.where locations, {offCampus: false}
locationFilters = _.sortBy locationFilters, 'name'
locationFilters.unshift {value: 'offcampus', name: '- Off Campus -'}

module.exports = React.createClass
  # getInitialState: ->
  #mixins: [Navigation]

  render: ->
    {onClick} = @props

    clickFunc = ->
      onClick()
      document.querySelector('#students').scrollIntoView(true)

    <ul className="dropdown-menu" id="location-filter">
      {locationFilters.map (item) ->
        {value, name} = item
        <li key={value} onClick={clickFunc} className="gallery">
          <Link query={locationId: value} to="app">{name}</Link>
        </li>
      }
    </ul>
