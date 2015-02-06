React = require 'react'
cx = require '../cx'
_ = require 'lodash'

Search = require './search'
Toggle = require './toggle'
ProgramList = require '../filters/programs'

module.exports = React.createClass
  getInitialState: ->
    snap: true
    activeSection: 'intro'
    menuOpen: true
    innerWidth: 900
    programsActive: false

  handleScroll: ->
    y = window.pageYOffset
    h = window.innerHeight
    activeSection = @state.activeSection
    # What section are we in?
    @sectionCoords.forEach (section) ->
      if y > section.offset
        activeSection = section.link
    newState = {}
    changeState = false

    # Change the active section.
    if activeSection != @state.activeSection
      newState.activeSection = activeSection
      changeState = true

    if changeState
      @setState newState
    console.log activeSection, y
    return

  handleResize: ->
    {navOffsetDefault, nav} = @props.data
    {menuOpen} = @state

    # Calculate what section we are in.
    sectionCoords = []
    # Loop through every nav item.
    _.each nav, (item) ->
      {href, link, offset} = item
      # Easy way to skip a nav item is to set the href value to anything.
      # Also check to see if the link val is found as an html el id.
      if _.isUndefined(href) and el = document.getElementById(link)
        # Calculate where the section starts.
        pos = offset or navOffsetDefault
        pos = parseInt(pos) + window.pageYOffset
        pos += el.getBoundingClientRect().top
        sectionCoords.push
          link: link
          offset: pos
    @sectionCoords = sectionCoords

    setMenuOpen = window.innerWidth > 767
    if menuOpen isnt setMenuOpen
      @setState
        innerWidth: window.innerWidth
        menuOpen: setMenuOpen

  sectionCoords: []

  handleToggle: ->
    @setState menuOpen: !@state.menuOpen

  componentDidMount: ->
    handleScroll = _.throttle @handleScroll, 250
    handleScroll()
    window.onscroll = handleScroll

    window.addEventListener 'resize', @handleResize
    @handleResize()

  componentWillUnmount: ->
    window.onscroll = undefined
    window.removeEventListener 'resize', @handleResize

  handleProgramsClick: (e) ->
    if e and e.preventDefault
      e.preventDefault()
    @setState programsActive: !@state.programsActive

  handleSectionClick: ->
    _.delay @handleScroll, 200

  linkEl: (props) ->
    {activeSection, programsActive} = @state
    {link, first, last, href, title} = props
    key = link or title
    href = href or '#'+link
    classNames =
      'nav-item': true
      first: first
      last: last
      active: activeSection and activeSection == link
    if link
      classNames[link] = true

    if props.link is 'filter-programs'
      # Configure onClick event for programs filter click.
      onClick =  @handleProgramsClick
      if programsActive
        # Establish if menu item has dropdown.
        Dropdown = <ProgramList onClick={@handleProgramsClick} />

    <li key={key} className={cx(classNames)}>
      <a href={href} onClick={onClick} title={title}>{title}</a>
      {Dropdown}
    </li>

  render: ->
    {snap, menuOpen, activeSection, innerWidth, menuOpen} = @state
    {nav} = @props.data
    last_i = nav.length - 1
    # Build array of links.
    Links = nav.map (link, i) =>
      link.first = i == 0
      link.last = i == last_i
      @linkEl link
    # Throw in the search input element.
    Links.push <li key="search" className="student-search"><Search /></li>

    navClasses =
      'main-nav': true
      'show-menu': menuOpen
      'fixed': snap
    if activeSection
      navClasses[activeSection] = true

    # Show button when width is < 768
    ToggleEl = if innerWidth < 767
      <Toggle handleToggle={@handleToggle} menuOpen={menuOpen} />

    <nav className={cx(navClasses)}>
      <div className="nav-logo"></div>
      {ToggleEl}
      <ul className="nav">
        {Links}
      </ul>
    </nav>
