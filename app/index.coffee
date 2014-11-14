React = require 'react'
domReady = require 'domready'
Router = require 'react-router'
{Routes, Route, DefaultRoute, Redirect} = Router
# _ = require 'lodash'

# Data
StudentCollection = require './models/students'

students = require './data/users'
data = require './data/data'
data.students = new StudentCollection students, parse: true

# Views
App = require './views/app'

UsrImgs = require './views/usrImgs'


#Imgs = require './views/img_form'

module.exports =
  blastoff: ->
    self = window.app = @
    # Route stuff attach
    @students = data.students
    # Init the React application router.
    console.log 'ready'
    # routes =
    #   Routes
    #     location: 'hash',
    #       Route
    #         name: 'app'
    #         path: '/'
    #         handler: App,
    #           Route
    #             name: 'usrImgs'
    #             handler: UsrImgs

    domReady =>
      @container = React.renderComponent App(data), document.body

# run it
module.exports.blastoff()
