React = require 'react'
{Navigation} = require 'react-router'

Info = require './info'
Main = require './main'

module.exports = React.createClass
  mixins: [Navigation]
  contextTypes: {
    router: React.PropTypes.func.isRequired
  }
  getInitialState: ->
    mounted: false
  #/students
  handleClose: ->
    @transitionTo 'app'
    # window.history.back()

  componentDidMount: ->
    document.body.style.overflow = 'hidden'
    unless @state.mounted
      @setState mounted: true

  componentWillUnmount: ->
    elem = document.body
    if elem.style.removeProperty
      elem.style.removeProperty 'overflow'
    else
      elem.style.removeAttribute 'overflow'

  render: ->
    {students} = @props
    {uid} = @context.router.getCurrentParams()
    user = students.get(uid)
    if @state.mounted
      q = @context.router.getCurrentQuery()
    else
      q = {}
    {type, pos} = q
    {files, embeds} = user
    filePos = parseInt(pos) or 0
    unless type
      if files and files.length
        type = 'img'
      else if embeds and embeds.length
        type = 'embed'

    if type is 'img' and files and files.models[filePos]
      activeFile = files.models[filePos]
    else if type is 'embed' and embeds and embeds.models[filePos]
      activeFile = embeds.models[filePos]
    else
      activeFile = null

    className = "student-#{uid}"

    <article id="student-overlay" className={className}>
      <button role="button" onClick={@handleClose} className="close">
        x
      </button>
      <div className="container">
        <Info usr={user} file={activeFile} pos={filePos} type={type} />
        <Main usr={user} file={activeFile} pos={filePos} type={type} />
      </div>
    </article>
