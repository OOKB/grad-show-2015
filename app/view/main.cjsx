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
    {data, students, locations, intro, programs} = @props

    <div id="react-app">
      <Header data={data} programs={programs} />
      <Intro body={intro} />
      <Schedule />
      <Galleries locations={locations} settings={data.locationSettings} />
      <RouteHandler data={data} students={students} locations={locations} programs={programs} />
      <Footer data={data} />
    </div>
