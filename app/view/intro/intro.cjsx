React = require 'react'

Logo = require './logo'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    {body} = @props
    <article id="intro">
      <div className="container">
        <Logo />
        <div className="intro-text" dangerouslySetInnerHTML={__html: body} />
      </div>
    </article>
