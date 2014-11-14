React = require 'react'
{article, h2} = require 'reactionary'

ReactMap = require './map'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    article
      id: 'galleries',
        h2 'Participating Galleries'
        ReactMap
          latitude: @props.map.latitude
          longitude: @props.map.longitude
          zoom: @props.map.zoom
          width: @props.map.width
          height: @props.map.height
