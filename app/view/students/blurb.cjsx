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
      <p><a href="http://www.mica.edu/Admission_and_Financial_Aid/Graduate_Admission_and_Financial_Aid.html">Request more information about MICA’s graduate programs</a></p>
    </div>
