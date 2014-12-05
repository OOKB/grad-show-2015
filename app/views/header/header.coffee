React = require 'react'
{header, h1, div} = require 'reactionary'
_ = require 'lodash'

Logo = require './logo'
Nav = require './nav'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    imgNum = _.random 1, @props.data.headerImgQty
    header
      className: 'header-art-'+imgNum,
        Logo null
        h1
          style: {display: 'none'},
            @props.data.title
        div
          className: 'down-arrow',
            "\\/"
        Nav @props
