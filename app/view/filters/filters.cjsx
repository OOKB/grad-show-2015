React = require 'react'
{Link} = require 'react-router'

Programs = require './programs'
Galleries = require './galleries'
Dates = require './dates'

module.exports = React.createClass
  #mixins: [Navigation]

  getInitialState: ->
    activeFilterSet: null

  handleCategoryClick: (filterSetId) ->
    if filterSetId == @state.activeFilterSet
      @setState activeFilterSet: null
    else
      @setState activeFilterSet: filterSetId

  render: ->
    {activeFilterSet} = @state
    programSets = [
      {id: 'programs', El: Programs, name: 'Program'}
      {id: 'galleries', El: Galleries, name: 'Gallery'}
      {id: 'dates', El: Dates, name: 'Show Date'}
    ]
    <ul className="student-filters">
      {programSets.map (set) =>
        {id, name, El} = set
        <li key={id} className={id}>
          <button onClick={=> @handleCategoryClick id} className="filter">
            <span>{name}</span>
          </button>
          {<El onClick={@handleCategoryClick} /> if activeFilterSet is id}
        </li>
      }
    </ul>
