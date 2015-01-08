React = require 'react'

Details = require './details'
StudentNav = require './studentNav'

# We need file and user models.

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    {usr} = @props
    <div className="student-info">
      <StudentNav usr={usr} />
      <Details usr={usr} />
    </div>
