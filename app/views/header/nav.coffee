React = require 'react/addons'
cx = React.addons.classSet
{nav, ul, li, a} = require 'reactionary'

module.exports = React.createClass
  # getInitialState: ->

  linkEl: (props) ->
    classNames = 'nav-item': true, first: props.first, last: props.last
    classNames[props.link] = true
    li
      key: props.link
      className: cx(classNames),
        a
          href: '#/'+props.link
          title: props.title,
            props.title

  render: ->
    last = @props.nav.splice(-1, 1)[0]
    last.last = true
    last = @linkEl last
    links = @props.nav.map (link, i) =>
      if i == 0
        link.first = true
      @linkEl link

    nav
      className: 'main-nav',
        ul
          className: 'nav',
            links
