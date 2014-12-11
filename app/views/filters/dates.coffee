React = require 'react'
{ul, li} = require 'reactionary'
{Link} = require 'react-router'

programsData = require '../../data/programs.json'
programsArray = programsData.programs

module.exports = React.createClass
  # getInitialState: ->
  #mixins: [Navigation]

  programEl: (progInfo) ->
    li
      key: progInfo.value
      onClick: =>
        @props.onClick()
        document.querySelector('#students').scrollIntoView(true)
      className: 'program',
        Link
          query:
            program: progInfo.value
          to: '/students',
            progInfo.program

  render: ->
    ul
      className: 'dropdown-menu'
      id: 'program-filter',
        programsArray.map @programEl
