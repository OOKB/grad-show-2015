React = require 'react'
{div, input} = require 'reactionary'
{Navigation, ActiveState} = require 'react-router'

module.exports = React.createClass

  mixins: [Navigation, ActiveState]

  handleChange: (e) ->
    searchTxt = @refs.searchTxt.getDOMNode().value
    q = @getActiveQuery()
    q.search = searchTxt.toLowerCase()
      # console.log q
    @replaceWith '/students', {}, q

  render: ->
    q = @getActiveQuery() or {}
    div
      role: 'form'
      id: 'search'
      className: 'form-group',
        input
          type: 'text'
          ref: 'searchTxt'
          value: q.search
          onChange: @handleChange
          onKeyDown: @keyDown
          className: 'form-control'
          name: 'item-search'
          placeholder: 'Search by name'#'Search...'
