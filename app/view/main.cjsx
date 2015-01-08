React = require 'react'
{RouteHandler} = require 'react-router'
_ = require 'lodash'

Header    = require './header/header'
Intro     = require './intro/intro'
Schedule  = require './schedule/schedule'
Galleries = require './galleries/galleries'
Footer    = require './footer/footer'

StudentCollection = require '../models/students'

module.exports = React.createClass
  render: ->
    {data, query} = @props
    StudentData = new StudentCollection data.students, parse: true

    <div id="react-app">
      <Header data={data} />
      <Intro />
      <Schedule />
      <Galleries />
      <RouteHandler data={data} students={StudentData} />
      <Footer data={data} />
    </div>
