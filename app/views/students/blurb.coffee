React = require 'react'
{div, h3, p} = require 'reactionary'
_ = require 'lodash'

programsData = require '../../data/programs.json'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    unless @props.program
      return false
    program = _.find programsData.programs, {value: @props.program}
    div
      className: 'program-info',
        h3 program.program
        p program.blurb
