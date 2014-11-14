React = require 'react'
{article, h2, h3, ul, li, div} = require 'reactionary'

data = require '../../data/schedule.json'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    article
      id: 'schedule',
        div
          className: 'container',
            h2 'Schedule of Events'
            div
              className: 'scheduleGroup',
                h3 'DATE TK'
                ul null,
                  li 'schedule'
