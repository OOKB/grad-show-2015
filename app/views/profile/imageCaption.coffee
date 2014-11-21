React = require 'react'
{div, h3, ul, li, a} = require 'reactionary'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    img = @props.img.metadata
    ul
      className: 'image-caption',
        li
          className: 'title',
            h3 img.title
        li
          className: 'medium',
            img.medium
        li
          className: 'year',
            img.year
        li
          className: 'size',
            img.size
