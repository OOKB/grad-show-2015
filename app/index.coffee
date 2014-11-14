React = require 'react'
domReady = require 'domready'
Router = require 'react-router'
{Routes, Route, DefaultRoute, Redirect} = Router
# _ = require 'lodash'

# Data
userData = require './data/users'
data = require './data/data'
# Views
App = require './views/app'

UsrImgs = require './views/usrImgs'

#Imgs = require './views/img_form'

module.exports =
  blastoff: ->
    self = window.app = @
    # Route stuff attach
    @users = userData
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
