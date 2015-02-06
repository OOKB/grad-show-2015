React = require 'react'

Logo = require './logo'

{body} = require '../../data/intro.json'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    <article id="intro">
      <div className="container">
        <Logo />
        <div className="intro-text" dangerouslySetInnerHTML={__html: body} />
      </div>
    </article>
