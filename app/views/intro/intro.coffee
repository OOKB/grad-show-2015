React = require 'react'
{article} = require 'reactionary'

data = require '../../data/intro.json'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    article
      id: 'intro'
      dangerouslySetInnerHTML:
        __html: data.body
