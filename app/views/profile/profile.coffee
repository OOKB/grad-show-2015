React = require 'react'
{article, div, button} = require 'reactionary'

Info = require './info'
Main = require './main'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    article
      id: 'student-overlay'
      className: 'student-',
        button
          role: 'button'
          className: 'close',
            'x'
        div
          className: 'container row',
            Info @props
            Main @props
