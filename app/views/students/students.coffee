React = require 'react'
{article, h2, div, ul, li} = require 'reactionary'

data = require '../../data/users.json'
StudentCollection = require '../../models/students'

props =
  students: new StudentCollection data, parse: true

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    console.log props.students.models[0].toJSON()
    article
      id: 'students',
        h2 'Students'
        div
          className: 'student-filters',
            'Filters...'
        ul
          id: 'projects'
          className: 'list',
            li 'students li'
