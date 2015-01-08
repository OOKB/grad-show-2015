React = require 'react'
_ = require 'lodash'

Programs = require '../../models/programs'

filerSets =
  showDate: 'Show Date: '
  location: 'Location: '
  program: 'Program: '

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    {name, blurb} = Programs.get @props.program

    <div className="program-info">
      <h3>{name}</h3>
      <p>{blurb}</p>
    </div>
