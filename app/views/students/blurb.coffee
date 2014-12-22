React = require 'react'
{div, h3, p} = require 'reactionary'
_ = require 'lodash'

Programs = require '../../models/programs'

filerSets =
  showDate: 'Show Date: '
  location: 'Location: '
  program: 'Program: '

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    unless @props.program
      return false
    program = Programs.get @props.program

    filterName =
    div
      className: 'program-info',
        h3 program.name
        p program.blurb
