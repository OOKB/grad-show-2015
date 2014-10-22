React = require 'react'
{div, p} = require 'reactionary'
_ = require 'lodash'

Router = require './router'

StudentForm = require './views/student_form'
Login = require './views/login'
Imgs = require './views/img_form'
Img = require './views/img_upload'

module.exports = React.createClass
  #getInitialState: ->
    #loggedIn: app.me.loggedIn

  router: new Router()

  initRouter: ->
    @router.setReactState = @setRouterState
    @router.history.start()

  componentDidMount: ->
    @initRouter()

  setRouterState: (newState) ->
    if newState
      @setState newState

  brokenEl: (section) ->
    txt = 'Hello there! Unfortunately our application is broken... '
    p txt+section

  render: ->
    section = null
    if @state and @state.section
      section = @state.section
    props =
      initState: @state
      setRouterState: @setRouterState

    if _.isObject props.initState
      props.initState.setRouterState = @setRouterState

    header = false
    component = switch section
      when 'form' then StudentForm props
      when 'imgs' then Imgs props
      when 'login' then Login props
      when 'img' then Img props
      else @brokenEl(section)
    footer = false

    return div header, component, footer