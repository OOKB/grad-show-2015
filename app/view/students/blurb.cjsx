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
      <p><a href="http://www.mica.edu/Admission_and_Financial_Aid/Graduate_Admission_and_Financial_Aid.html">To request information about this or any other of MICA’s graduate programs, visit MICA Graduate Admission</a></p>
    </div>
