React = require 'react'
{RouteHandler} = require 'react-router'
_ = require 'lodash'

Header    = require './header/header'
Intro     = require './intro/intro'
Schedule  = require './schedule/schedule'
Galleries = require './galleries/galleries'
Footer    = require './footer/footer'

{students} = require '../data'
StudentCollection = require '../models/students'
StudentData = new StudentCollection students, parse: true

module.exports = React.createClass
  render: ->
    {data, query} = @props

    <div id="react-app">
      <Header data={data} />
      <Intro />
      <Schedule />
      <Galleries />
      <RouteHandler data={data} students={StudentData} />
      <Footer data={data} />
    </div>
