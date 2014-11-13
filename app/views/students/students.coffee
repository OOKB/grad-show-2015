React = require 'react'
{article, h2} = require 'reactionary'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    article
      id: 'students',
        h2 'Students'
        'students li'
