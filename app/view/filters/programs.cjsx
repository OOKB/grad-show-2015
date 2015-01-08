React = require 'react'
{Link} = require 'react-router'

programs = require '../../models/programs'

module.exports = React.createClass

  render: ->
    {onClick} = @props
    clickFunc = ->
      onClick()
      document.querySelector('#students').scrollIntoView(true)

    <ul className="dropdown-menu" id="program-filter">
      {programs.map (item) ->
        {id, name} = item
        <li key={id} onClick={clickFunc} className="program">
          <Link query={programId: id} to="app">{name}</Link>
        </li>
      }
    </ul>
