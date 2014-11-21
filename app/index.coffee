React = require 'react'
domReady = require 'domready'
Router = require 'react-router'
{Routes, Route, DefaultRoute, Redirect, NotFoundRoute} = Router
# _ = require 'lodash'

# Data
StudentCollection = require './models/students'

students = require './data/users'
data = require './data/data'
data.students = new StudentCollection students, parse: true

# Views
App = require './views/app'
Profile = require './views/profile/profile'

UsrImgs = require './views/usrImgs'


#Imgs = require './views/img_form'

module.exports =
  blastoff: ->
    self = window.app = @
    # Route stuff attach
    @students = data.students
    # Init the React application router.
    console.log 'ready'
    routes =
      Routes
        scrollBehavior: 'none'
        location: 'hash',
          Route
            name: 'app'
            path: '/'
            data: data
            handler: App,
              Route
                name: 'usrImgs'
                handler: UsrImgs
              Route
                name: 'usrProfile'
                path: '/students/:uid/?:img?'
                handler: Profile
          NotFoundRoute
            handler: App
            data: data

    el = document.getElementById('react')
    #el = document.body
    domReady =>
      @container = React.renderComponent routes, el

# run it
module.exports.blastoff()
