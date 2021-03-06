React = require 'react'
_ = require 'lodash'

filerSets =
  showDate: 'Show Date: '
  location: 'Location: '
  program: 'Program: '

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    {name, blurb} = @props

    <div className="program-info">
      <h3>{name}</h3>
      <p>{blurb}</p>
      <p><a href="http://www.mica.edu/Admission_and_Financial_Aid/Graduate_Admission_and_Financial_Aid.html?utm_source=mica%20grad%20show">To request information about this or any other of MICA’s graduate programs, visit MICA Graduate Admission</a></p>
    </div>
