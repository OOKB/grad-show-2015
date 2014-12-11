React = require 'react'
crypto = require 'crypto'
{h1, div, fieldset, p, a, img} = require 'reactionary'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    gravImgs = []
    @props.students.forEach (user) ->
      if user.pic
        gravImgs.push img
          key: user.uid
          src: user.pic
    div null,
      gravImgs
