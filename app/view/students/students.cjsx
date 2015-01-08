React = require 'react'
_ = require 'lodash'

{State} = require 'react-router'

Student = require './student'
Blurb = require './blurb'
Filters = require '../filters/filters'

module.exports = React.createClass
  getInitialState: ->
    mounted: false

  componentDidMount: ->
    unless @state.mounted
      @setState mounted: true

  mixins: [State]
  render: ->
    {students} = @props
    if @state.mounted
      q = @getQuery()
    else
      q = {}
    
    # Filter Students
    # Default to something
    unless q.programId or q.location or q.showId or q.search
      q.programId = 'teaching-ma'
    if students and students.where
      studentData = students.where q
    else
      studentData = students

    program = q.programId

    <article id="students">
      <div className="container">
        <h2>Students</h2>
        <Filters />
        {if program then <Blurb program={program} />}
        <ul id="projects" className="list">
          {studentData.map (model) ->
            if model.pic
              <Student model={model} key={model.uid} />
          }
        </ul>
      </div>
    </article>
