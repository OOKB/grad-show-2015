React = require 'react'
{article, h2} = require 'reactionary'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    article
      id: 'galleries',
        h2 'Participating Galleries'
        'galleries fancy map'
