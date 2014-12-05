React = require 'react'
{ul, li} = require 'reactionary'
{Link} = require 'react-router'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    usr = @props.usr
    ul
      className: 'student-nav',
        li
          className: 'previous',
            Link
              params:
                uid: usr.prevPeer.uid
                img: '0'
              to: 'usrProfile',
                "\u2190"
        li
          className: 'next',
            Link
              params:
                uid: usr.nextPeer.uid
                img: '0'
              to: 'usrProfile',
                "\u2192"
