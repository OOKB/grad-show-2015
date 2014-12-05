React = require 'react'
cx = require '../cx'
{nav, ul, li, a, div} = require 'reactionary'

Search = require './search'
Toggle = require './toggle'
ProgramList = require '../filters/programs'

module.exports = React.createClass
  getInitialState: ->
    snap: false
    activeSection: null
    menuOpen: @props.data.windowInnerWidth > 767
    innerWidth: @props.data.windowInnerWidth
    programsActive: false

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
      if item.link == false or item.link.substring(0, 6) == 'filter'
        return false
      link: item.link
      offset: document.getElementById(item.link).getBoundingClientRect().top + window.pageYOffset + offset
    menuOpen = window.innerWidth > 767
    if @state.menuOpen != menuOpen
      @setState
        innerWidth: window.innerWidth
        menuOpen: menuOpen
  sectionCoords: []

  handleToggle: ->
    @setState menuOpen: !@state.menuOpen

  componentDidMount: ->
    window.onscroll = @handleScroll
    window.addEventListener 'resize', @handleResize
    @handleResize()

  componentWillUnmount: ->
    window.onscroll = undefined
    window.removeEventListener 'resize', @handleResize

  handleProgramsClick: ->
    @setState programsActive: !@state.programsActive

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
          href: '#'+props.linka
          onClick: if props.link then @handleProgramsClick
          title: props.title,
            props.title
        if @state.programsActive and props.link == 'filter-programs' then ProgramList()

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
      'show-menu': @state.menuOpen

    if @state.activeSection
      navClasses[@state.activeSection] = true

    nav
      className: cx(navClasses),
        div
          className: 'nav-logo'
        Toggle
          handleToggle: @handleToggle
          menuOpen: @state.menuOpen
          windowInnerWidth: @state.innerWidth
        ul
          className: 'nav',
            links
