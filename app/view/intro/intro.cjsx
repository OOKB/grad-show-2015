React = require 'react'

Logo = require './logo'

{body} = require '../../data/intro.json'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    <article id="intro">
      <Logo />
      <div className="container" dangerouslySetInnerHTML={__html: body} />
    </article>
