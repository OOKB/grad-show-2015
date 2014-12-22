React = require 'react'
{ul, li} = require 'reactionary'
{Link} = require 'react-router'
_ = require 'lodash'

programsData = require '../../models/programs'

showDates = programsData.allShows

module.exports = React.createClass
  # getInitialState: ->
  #mixins: [Navigation]

  filterEl: (show) ->
    li
      key: show.id
      onClick: =>
        @props.onClick()
        document.querySelector('#students').scrollIntoView(true)
      className: 'dates',
        Link
          query:
            showId: show.id
          to: '/students',
            show.shortDate

  render: ->

    ul
      className: 'dropdown-menu'
      id: 'program-filter',
        showDates.map @filterEl
