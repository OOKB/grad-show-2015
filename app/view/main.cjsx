React = require 'react'
{RouteHandler} = require 'react-router'
_ = require 'lodash'

Header    = require './header/header'
Intro     = require './intro/intro'
Schedule  = require './schedule/schedule'
Galleries = require './galleries/galleries'
Footer    = require './footer/footer'

module.exports = React.createClass
  render: ->
    {data, students, locations} = @props

    <div id="react-app">
      <Header data={data} />
      <Intro />
      <Schedule />
      <Galleries locations={locations} settings={data.locationSettings} />
      <RouteHandler data={data} students={StudentData} locations={locations} />
      <Footer data={data} />
    </div>
