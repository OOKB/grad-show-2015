React = require 'react'
{Link} = require 'react-router'

programsData = require '../../models/programs'

filterItems = programsData.allShows

module.exports = React.createClass
  # getInitialState: ->
  #mixins: [Navigation]

  render: ->
    {onClick} = @props
    clickFunc = ->
      onClick()
      document.querySelector('#students').scrollIntoView(true)

    <ul className="dropdown-menu" id="program-filter">
      {filterItems.map (item) ->
        {id, shortDate} = item
        <li key={id} onClick={clickFunc} className="dates">
          <Link query={showId: id} to="app">{shortDate}</Link>
        </li>
      }
    </ul>
