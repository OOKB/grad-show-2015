React = require 'react'

ReactMap = require './map'
Gallerylisting = require './listing'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    {locations, settings} = @props
    <article id="galleries">
      <h2>Participating Galleries</h2>
      <section className="map-wrapper">
        <ReactMap settings={settings} />
        <Gallerylisting locations={locations} />
      </section>
    </article>
