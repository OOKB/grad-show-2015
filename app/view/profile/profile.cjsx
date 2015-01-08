React = require 'react'
{Navigation, State} = require 'react-router'

Info = require './info'
Main = require './main'

module.exports = React.createClass
  mixins: [Navigation, State]
  # getInitialState: ->
  #/students
  handleClose: ->
    #@transitionTo '/students'
    window.history.back()

  componentDidMount: ->
    document.body.style.overflow = 'hidden'

  componentWillUnmount: ->
    elem = document.body
    if elem.style.removeProperty
      elem.style.removeProperty 'overflow'
    else
      elem.style.removeAttribute 'overflow'

  render: ->
    {students} = @props
    {uid, img} = @getParams()
    user = students.get(uid)
    unless user
      return false
    img_i = parseInt(img) or 0
    {files} = user
    if files and files.models[img_i]
      activeFile = files.models[img_i]
    else
      activeFile = null
    className = "student-#{uid}"

    <article id="student-overlay" className={className}>
      <button role="button" onClick={@handleClose} className="close">
        x
      </button>
      <div className="container">
        <Info usr={user} img={activeFile} img_i={img_i} />
        <Main usr={user} img={activeFile} img_i={img_i} />
      </div>
    </article>
