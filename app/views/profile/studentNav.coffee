React = require 'react'
{ul, li} = require 'reactionary'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    ul
      className: 'student-nav',
        li
          className: 'previous',
            '<-'
        li
          className: 'random',
            '~'
        li
          className: 'next',
            '->'
