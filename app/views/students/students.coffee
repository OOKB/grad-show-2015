React = require 'react'
{article, h2, div, ul, li} = require 'reactionary'

Student = require './student'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    #activeStudents = props.students.where program: 'graphic-design-mfa'
    activeStudents = @props.students
    #console.log activeStudents[0].toJSON()
    studentList = activeStudents.map (model) ->
      Student model: model, key: model.uid
    article
      id: 'students',
        div
          className: 'container',
            h2 'Students'
            div
              className: 'student-filters',
                'Filters...'
            ul
              id: 'projects'
              className: 'list',
                studentList
