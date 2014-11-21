React = require 'react'
{div, input} = require 'reactionary'
{Navigation} = require 'react-router'

module.exports = React.createClass
  # getInitialState: ->
  mixins: [Navigation]

  handleChange: (e) ->
    searchTxt = @refs.searchTxt.getDOMNode().value
    @replaceWith '/', {}, {search: searchTxt}

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
          placeholder: 'Enter search text'#'Search...'
