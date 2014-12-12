React = require 'react'
{ul, li, button} = require 'reactionary'
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
    programSets = [
      {id: 'programs', el: Programs, name: 'Program'}
      {id: 'galleries', el: Galleries, name: 'Gallery'}
      {id: 'dates', el: Dates, name: 'Show Date'}
    ]
    ul
      className: 'student-filters',
        programSets.map (set) =>
          li
            key: set.id
            className: set.id,
              button
                onClick: => @handleCategoryClick(set.id)
                className: 'filter',
                  id: set.name
              if @state.activeFilterSet == set.id then set.el(onClick: @handleCategoryClick)
