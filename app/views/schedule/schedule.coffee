React = require 'react'
{article, h2, ul, li, div} = require 'reactionary'

data = require '../../data/schedule.json'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    article
      id: 'schedule',
        div
          classname: 'container',
            h2 'Schedule of Events'
            ul null,
              li 'schedule'
