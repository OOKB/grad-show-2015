React = require 'react'
{nav, ul, li, a} = require 'reactionary'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    nav
      className: 'main-nav',
        ul
          className: 'nav',
            li
              className: 'nav-item intro',
                a
                  href: '#/intro',
                    'Welcome'
