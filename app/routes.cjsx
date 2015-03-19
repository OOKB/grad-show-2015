React = require 'react'
{Route, DefaultRoute} = require 'react-router'

Index = require './view/index'
Students = require './view/students/students'
Profile = require './view/profile/profile'

module.exports =

  <Route name="app" path="/" ignoreScrollBehavior handler={Index}>
    <Route name="usrProfile" path="/students/:uid/?:slidePos?" handler={Profile} />
    <DefaultRoute name="students" handler={Students} />
  </Route>
