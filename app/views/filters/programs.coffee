React = require 'react'
{ul, li} = require 'reactionary'
{Link} = require 'react-router'

programs = require '../../models/programs'

module.exports = React.createClass
  # getInitialState: ->
  #mixins: [Navigation]

  programEl: (progInfo) ->
    li
      key: progInfo.id
      onClick: =>
        @props.onClick()
        document.querySelector('#students').scrollIntoView(true)
      className: 'program',
        Link
          query:
            programId: progInfo.id
          to: '/students',
            progInfo.name

  render: ->
    ul
      className: 'dropdown-menu'
      id: 'program-filter',
        programs.map @programEl
