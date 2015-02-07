React = require 'react'

# Get the data for the gallery info.
locations = require('../../data/').galleries.locations

ListingItem = require './listingItem'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    <aside id="gallerylisting">
      <ul>
        <li className="gallery">
          <div>
            <h3>Gallery Name</h3>
            <ul>
              {
                locations.map (location) ->
                  <ListingItem key={location.value} location={location} />
              }
            </ul>
          </div>
        </li>
      </ul>
    </aside>
