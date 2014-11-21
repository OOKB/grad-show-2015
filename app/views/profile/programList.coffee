React = require 'react'
{aside, h3, ul, li, a} = require 'reactionary'
{Link} = require 'react-router'

module.exports = React.createClass
  # getInitialState: ->
  peerEl: (model) ->
    li
      key: model.uid
      className: 'peer',
        Link
          params:
            uid: model.uid
          to: 'usrProfile',
            model.fullName

  render: ->
    usr = @props.usr
    aside
      className: 'program-list',
        h3 usr.programName
        ul
          className: 'program-peers',
            usr.peers.map @peerEl
