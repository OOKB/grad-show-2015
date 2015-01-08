React = require 'react'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    {value, name} = @props
    <li className="filter-option" id={value}>
      <a href="#">{name}</a>
    </li>
