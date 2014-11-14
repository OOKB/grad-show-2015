React = require 'react/addons'
cx = React.addons.classSet
{nav, ul, li, a, div} = require 'reactionary'

module.exports = React.createClass
  getInitialState: ->
    snap: false
    activeSection: null

  handleScroll: ->
    y = window.pageYOffset
    unless y % 5 == 0
      return
    h = window.innerHeight
    activeSection = null
    @sectionCoords.forEach (section) ->
      if y > section.offset
        activeSection = section.link
    if y > h and not @state.snap
      @setState
        snap: true
        activeSection: activeSection
      return
    if y < h+1 and @state.snap
      @setState
        snap: false
        activeSection: activeSection
      return
    if activeSection != @state.activeSection
      @setState
        activeSection: activeSection

  handleResize: ->
    @sectionCoords = @props.nav.map (item) ->
      unless item.link
        return false
      link: item.link
      offset: document.getElementById(item.link).getBoundingClientRect().top + window.pageYOffset - 200

  sectionCoords: []

  componentDidMount: ->
    window.onscroll = @handleScroll
    window.addEventListener 'resize', @handleResize
    @handleResize()

  componentWillUnmount: ->
    window.onscroll = undefined
    window.removeEventListener 'resize', @handleResize


  linkEl: (props) ->
    classNames =
      'nav-item': true
      first: props.first
      last: props.last
      active: @state.activeSection == props.link
    classNames[props.link] = true
    li
      key: props.link
      className: cx(classNames),
        a
          href: '#'+props.link
          title: props.title,
            props.title

  render: ->
    last_i = @props.nav.length - 1
    links = @props.nav.map (link, i) =>
      if i == 0
        link.first = true
      else if i == last_i
        link.last = true
      @linkEl link

    navClasses =
      'main-nav': true
      fixed: @state.snap
    if @state.activeSection then navClasses[@state.activeSection] = true

    nav
      className: cx(navClasses),
        div
          className: 'nav-logo'
        ul
          className: 'nav',
            links
