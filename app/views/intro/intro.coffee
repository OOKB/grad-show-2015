React = require 'react'
{article, div} = require 'reactionary'

data = require '../../data/intro.json'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    article
      id: 'intro'
      div
        className: 'container'
        dangerouslySetInnerHTML:
          __html: data.body
