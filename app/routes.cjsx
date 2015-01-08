React = require 'react'
Router = require 'react-router'
{Route, DefaultRoute} = Router

Index = require './view/index'
Students = require './view/students/students'
Profile = require './view/profile/profile'

module.exports = (data) ->

  <Route name="app" path="/" handler={Index}>
    <Route name="usrProfile" path="/students/:uid/?:img?" handler={Profile} />
    <DefaultRoute handler={Students} />
  </Route>
