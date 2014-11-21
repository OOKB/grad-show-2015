React = require 'react'
{aside, h3, ul, li, a} = require 'reactionary'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    aside
      className: 'program-list',
        h3 @props.programName
        ul
          className: 'program-peers',
            li 'name 1'
            li 'name 2'
