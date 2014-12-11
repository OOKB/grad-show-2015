React = require 'react'
{ul, li} = require 'reactionary'
{Link} = require 'react-router'

data = require '../../data/locations.json'
filterItems = data.locations

module.exports = React.createClass
  # getInitialState: ->
  #mixins: [Navigation]

  filterItemEl: (itemInfo) ->
    li
      key: itemInfo.value
      onClick: =>
        @props.onClick()
        document.querySelector('#students').scrollIntoView(true)
      className: 'gallery',
        Link
          query:
            gallery: itemInfo.value
          to: '/students',
            itemInfo.name

  render: ->
    ul
      className: 'location-menu'
      id: 'location-filter',
        filterItems.map @filterItemEl
