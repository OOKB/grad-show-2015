React = require 'react'
{ul, li} = require 'reactionary'

programsData = require '../../data/programs.json'
programsArray = programsData.programs

module.exports = React.createClass
  # getInitialState: ->

  programEl: (progInfo) ->
    li
      key: progInfo.value
      className: 'program',
        progInfo.program

  render: ->
    ul
      className: 'dropdown-menu'
      id: 'program-filter',
        programsArray.map @programEl
