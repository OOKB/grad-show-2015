React = require 'react'
{footer, div, img, ul, li, a, h3} = require 'reactionary'

Credits   = require './credits'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    footer null,
      div
        className: 'container',
          div
            className: 'group',
              div
                className: 'column span1',
                  a
                    href: 'http://www.mica.edu/'
                    target: '_blank',
                    className: 'micalogo',
                      img
                        src: 'images/mica_lockup_transp.png'
                        alt: 'MICA Logo'
              div
                className: 'column span1',
                  ul
                    className: 'author address',
                      li @props.author
                      li @props.street
                      li @props.city, ', ', @props.state, ' ', @props.zip
                      li @props.phone
              div
                className: 'column span1',
                  Credits @props
              div
                className: 'column span1',
                  ul
                    className: 'footer-nav',
                      h3 'Menu'
                      li null,
                        a
                          href: '#intro',
                            'Welcome'
                      li null,
                        a
                          href: '#schedule',
                            'Schedule'
                      li null,
                        a
                          href: '#galleries',
                            'Galleries'
                      li null,
                        a
                          href: '#students',
                            'Students'
                      li null,
                        a
                          href: 'http://micagradstudies.tumblr.com/',
                            'Updates'
              div
                className: 'column span1',
                  ul
                    className: 'archive',
                      h3 'Archive'
                      li null,
                        a
                          href: 'http://graduate.mica.edu/gradshow/2014/',
                            '2014'
                      li null,
                        a
                          href: 'http://graduate.mica.edu/thesis/',
                            '2013'
