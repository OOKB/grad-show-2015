React = require 'react'
{div, h3, ul, li, a, span} = require 'reactionary'

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
        # li
        #   className: 'year',
        #     img.year
        # li
        #   className: 'size',
        #     img.sizeDisplay
        li
          className: 'size-year',
            span
              className: 'size',
                img.sizeDisplay
            if img.sizeDisplay and img.year then ', ' else false
            span
              className: 'year',
                if img.year then img.year else false
