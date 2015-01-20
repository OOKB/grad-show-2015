React = require 'react'

ReactMap = require './map'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    <article id="galleries">
      <h2>Participating Galleries</h2>
      <ReactMap />
    </article>
