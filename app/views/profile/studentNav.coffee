React = require 'react'
{ul, li} = require 'reactionary'
{Link, Navigation} = require 'react-router'

module.exports = React.createClass
  # getInitialState: ->
  mixins: [Navigation]
  render: ->
    usr = @props.usr
    ul
      className: 'student-nav',
        li
          className: 'previous',
            Link
              onClick: (e) =>
                e.preventDefault()
                @replaceWith 'usrProfile', {uid: usr.prevPeer.uid}
                return false
              params:
                uid: usr.prevPeer.uid
              to: 'usrProfile',
                "\u2190"
        li
          className: 'next',
            Link
              onClick: (e) =>
                e.preventDefault()
                @replaceWith 'usrProfile', {uid: usr.nextPeer.uid}
                return false
              params:
                uid: usr.nextPeer.uid
                img: '0'
              to: 'usrProfile',
                "\u2192"
