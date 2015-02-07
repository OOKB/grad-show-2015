React = require 'react'

# Get the data for the gallery info.
locations = require('../../data/').galleries.locations

ListingItem = require './listingItem'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    <aside id="gallerylisting">
      <h3>Gallery Listing</h3>
      <ul>
        {
          locations.map (location) ->
            <ListingItem key={location.value} location={location} />
        }
      </ul>
    </aside>
