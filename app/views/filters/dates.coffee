React = require 'react'
{ul, li} = require 'reactionary'
{Link} = require 'react-router'
_ = require 'lodash'

programsData = require '../../data/programs.json'
programsArray = programsData.programs
shows = _.pluck programsArray, 'shows'
shows = _.flatten(shows)
showDates = _.map shows, (show) ->
  unless show and show.start and show.end
    return 'TBD'
  show.start + '-' + show.end + ', 2015'
showDates = _.uniq showDates

module.exports = React.createClass
  # getInitialState: ->
  #mixins: [Navigation]

  programEl: (progInfo) ->
    li
      key: progInfo
      onClick: =>
        @props.onClick()
        document.querySelector('#students').scrollIntoView(true)
      className: 'dates',
        Link
          query:
            showDate: progInfo
          to: '/students',
            progInfo

  render: ->

    ul
      className: 'dropdown-menu'
      id: 'program-filter',
        showDates.map @programEl
