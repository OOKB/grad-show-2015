React = require 'react'

ReactMap = require './map'
Gallerylisting = require './listing'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    <article id="galleries">
      <h2>Participating Galleries</h2>
      <section className="map-wrapper">
        <ReactMap />
        <Gallerylisting />
      </section>
    </article>
