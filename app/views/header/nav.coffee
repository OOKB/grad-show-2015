React = require 'react/addons'
cx = React.addons.classSet
{nav, ul, li, a, div} = require 'reactionary'

Search = require './search'

module.exports = React.createClass
  getInitialState: ->
    snap: false
    activeSection: null

  handleScroll: ->
    y = window.pageYOffset
    # Only worry about changing things every 5 px.
    unless y % 5 == 0
      return
    h = window.innerHeight
    activeSection = null
    # What section are we in?
    @sectionCoords.forEach (section) ->
      if y > section.offset
        activeSection = section.link
    # Change the active section.
    if activeSection != @state.activeSection
      @setState
        activeSection: activeSection
    # When to show the menu.
    # Window height -200 px.
    if y > (h-120) and not @state.snap
      @setState
        snap: true
        activeSection: activeSection
      return
    # When to hide menu after it's been shown.
    if y < (h-120) and @state.snap
      @setState
        snap: false
        activeSection: activeSection
      return

  handleResize: ->
    defaultOffset = @props.data.navOffsetDefault
    @sectionCoords = @props.data.nav.map (item) ->
      offset = parseInt(item.offset or defaultOffset)
      unless item.link
        return false
      link: item.link
      offset: document.getElementById(item.link).getBoundingClientRect().top + window.pageYOffset + offset

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
    navInfo = @props.data.nav
    last_i = navInfo.length - 1
    links = navInfo.map (link, i) =>
      if i == 0
        link.first = true
      else if i == last_i
        link.last = true
      @linkEl link
    links.push li
      key: 'search'
      className: 'student-search',
        Search null


    navClasses =
      'main-nav': true
      fixed: @state.snap

    if @state.activeSection
      navClasses[@state.activeSection] = true

    nav
      className: cx(navClasses),
        div
          className: 'nav-logo'
        ul
          className: 'nav',
            links
