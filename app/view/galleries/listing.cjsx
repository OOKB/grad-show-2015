React = require 'react'

# Get the data for the gallery info.
locationData = require('../../data/').galleries

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    <aside id="gallerylisting">
      <ul>
        <li className="gallery">
          <div>
            <h3>Gallery Name</h3>
            <ul>
              <li>Address and such?</li>
            </ul>
          </div>
        </li>
      </ul>
    </aside>
