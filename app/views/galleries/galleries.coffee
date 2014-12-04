React = require 'react'
{article, h2} = require 'reactionary'

ReactMap = require './map'

locationData = require '../../data/locations.json'
locationData.settings.points = locationData.locations.map (loc) ->
  latitude: loc.geoData.location.lat
  longitude: loc.geoData.location.lng
  label: loc.name

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    article
      id: 'galleries',
        h2 'Participating Galleries'
        ReactMap locationData.settings
