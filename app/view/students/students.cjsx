React = require 'react'
_ = require 'lodash'

Student = require './student'
Blurb = require './blurb'
Filters = require '../filters/filters'

module.exports = React.createClass
  contextTypes: {
    router: React.PropTypes.func.isRequired
  }
  getInitialState: ->
    mounted: false

  componentDidMount: ->
    unless @state.mounted
      @setState mounted: true

  render: ->
    {students, locations, programs} = @props
    if @state.mounted
      q = @context.router.getCurrentQuery()
    else
      q = {}

    # Filter Students
    # Default to something
    unless q.programId or q.locationId or q.showId or q.search
      q.search = ''
    #   q.programId = 'teaching-ma'
    if students and students.where
      studentData = students.where q
    else
      studentData = students

    if q.programId and program = programs.get q.programId
      {name, blurb} = program
      blurbEl = <Blurb name={name} blurb={blurb} />
    else
      blurbEl = false

    <article id="students">
      <div className="container">
        <h2>Students</h2>
        <Filters locations={locations} programs={programs} />
        {blurbEl}
        <ul id="projects" className="list">
          {studentData.map (model) ->
            if model.pic
              <Student model={model} key={model.uid} />
          }
        </ul>
      </div>
    </article>
