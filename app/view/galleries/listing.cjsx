React = require 'react'
_ = require 'lodash'
# Get the data for the gallery info.

ListingItem = require './listingItem'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    {locations} = @props
    <aside id="gallerylisting">
      <h3>Gallery Listing</h3>
      <ul>
        {
          _.map locations, (location) ->
            <ListingItem key={location.value} location={location} />
        }
      </ul>
    </aside>
