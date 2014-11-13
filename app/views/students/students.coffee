React = require 'react'
{article, h2, div, ul, li} = require 'reactionary'

data = require '../../data/users.json'
StudentCollection = require '../../models/students'

props =
  students: new StudentCollection data, parse: true

Student = require './student'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    #activeStudents = props.students.where program: 'graphic-design-mfa'
    activeStudents = props.students
    #console.log activeStudents[0].toJSON()
    studentList = activeStudents.map (model) ->
      Student model: model, key: model.uid
    article
      id: 'students',
        h2 'Students'
        div
          className: 'student-filters',
            'Filters...'
        ul
          id: 'projects'
          className: 'list',
            studentList
