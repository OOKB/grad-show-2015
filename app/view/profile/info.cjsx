React = require 'react'

Details = require './details'
StudentNav = require './studentNav'
ProgramList = require './programList'

# We need file and user models.

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    {usr} = @props
    <div className="student-info">
      <StudentNav usr={usr} />
      <Details usr={usr} />
      <ProgramList usr={usr} />
    </div>
