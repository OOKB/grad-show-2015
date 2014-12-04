React = require 'react'
{article, div, button} = require 'reactionary'
{Navigation} = require 'react-router'

Info = require './info'
Main = require './main'

module.exports = React.createClass
  mixins: [Navigation]
  # getInitialState: ->
  #/students
  handleClose: ->
    @transitionTo '/students'

  componentDidMount: ->
    document.body.style.overflow = 'hidden'

  componentWillUnmount: ->
    elem = document.body
    if elem.style.removeProperty
      elem.style.removeProperty 'overflow'
    else
      elem.style.removeAttribute 'overflow'

  render: ->
    uid = @props.params.uid
    user = app.students.get(uid)
    unless user
      return false
    img_i = parseInt(@props.params.img) or 0
    if user.files and user.files.models[img_i]
      activeFile = user.files.models[img_i]
    else
      activeFile = null

    article
      id: 'student-overlay'
      className: 'student-',
        button
          role: 'button'
          onClick: @handleClose
          className: 'close',
            'x'
        div
          className: 'container',
            Info
              usr: user
              img: activeFile
              img_i: img_i
            Main
              usr: user
              img: activeFile
              img_i: img_i
