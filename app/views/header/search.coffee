React = require 'react'
{div, input} = require 'reactionary'
{Navigation, State} = require 'react-router'

module.exports = React.createClass
  # getInitialState: ->
  mixins: [Navigation, State]

  handleChange: (e) ->
    searchTxt = @refs.searchTxt.getDOMNode().value
    q = @getQuery()
    q.search = searchTxt
    console.log q
    @replaceWith '/students', {}, q

  render: ->
    div
      role: 'form'
      id: 'search'
      className: 'form-group',
        input
          type: 'text'
          ref: 'searchTxt'
          value: @props.searchTxt
          onChange: @handleChange
          onKeyDown: @keyDown
          className: 'form-control'
          name: 'item-search'
          placeholder: 'Search by name'#'Search...'
