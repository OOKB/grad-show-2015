React = require 'react'
{li, a} = require 'reactionary'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    li
      className: 'filter-option'
      id: @props.value,
        a
          href: '#',
            @props.name
