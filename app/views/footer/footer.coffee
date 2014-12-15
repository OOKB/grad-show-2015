React = require 'react'
{footer, div, img, ul, li, a, h3} = require 'reactionary'

Credits = require './credits'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    footer null,
      div
        className: 'container',
          div
            className: 'group',
              div
                className: 'column span2',
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
                className: 'column span2',
                  Credits @props
              div
                className: 'column span1',
                  ul
                    className: 'archive',
                      h3 'Archive'
                      li
                        a
                          href: 'http://graduate.mica.edu/gradshow/2014/',
                            '2014'
                      li
                        a
                          href: 'http://graduate.mica.edu/thesis/',
                            '2013'
