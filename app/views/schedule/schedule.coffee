React = require 'react'
{article, h2, ul, li} = require 'reactionary'

data = require '../../data/schedule.json'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    article
      id: 'schedule',
        h2 'Schedule of Events'
        ul null,
          li 'schedule'
