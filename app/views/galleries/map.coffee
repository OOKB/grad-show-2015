React = require 'react'
{article, h2, div} = require 'reactionary'


module.exports = React.createClass
  displayName: "Gmap"

  # initialize local variables
  getInitialState: ->
    map: null
    markers: []

  # set some default values
  getDefaultProps: ->
    latitude: 0
    longitude: 0
    zoom: 4
    width: 500
    height: 500
    points: []
    gmaps_api_key: ""
    gmaps_sensor: false

  # update geo-encoded markers
  updateMarkers: (points) ->
    markers = @state.markers
    map = @state.map

    # map may not be loaded when parent component re-renders
    return false  if map is null

    # remove everything
    markers.forEach (marker) ->
      marker.setMap null
      return

    @state.markers = []

    # add new markers
    points.forEach ((point) ->
      location = new google.maps.LatLng(point.latitude, point.longitude)
      marker = new google.maps.Marker(
        position: location
        map: map
        title: point.label
      )
      markers.push marker
      return
    )
    @setState markers: markers
    return

  componentDidMount: ->

    window.mapLoaded = =>
      mapOptions =
        zoom: @props.zoom
        center: new google.maps.LatLng(@props.latitude, @props.longitude)
        mapTypeId: google.maps.MapTypeId.ROADMAP

      map = new google.maps.Map(@getDOMNode(), mapOptions)
      @setState map: map
      @updateMarkers @props.points
      return

    s = document.createElement("script")
    s.src = "https://maps.googleapis.com/maps/api/js?sensor=true&callback=mapLoaded"
    document.head.appendChild s
    return


  # update markers if needed
  componentWillReceiveProps: (props) ->
    #@updateMarkers props.points  if props.points
    return

  render: ->
    style =
      width: @props.width
      height: @props.height

    div
      style: style
