React = require 'react'
{div, h3, ul, li, a} = require 'reactionary'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    ul
      className: 'image-caption',
        li
          className: 'title',
            h3 @props.program
        li
          className: 'medium',
            @props.location
        li
          className: 'year',
            @props.showDates
        li
          className: 'size',
            @props.showDates
