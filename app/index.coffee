React = require 'react'
domReady = require 'domready'
Router = require 'react-router'
{Routes, Route, DefaultRoute, Redirect} = Router
# _ = require 'lodash'

# Data
userData = require './data/users'

# Views
App = require './views/app'

UsrImgs = require './views/usrImgs'
Logo = require './views/public/logo'

#Imgs = require './views/img_form'

module.exports =
  blastoff: ->
    self = window.app = @
    # Route stuff attach
    @users = userData
    # Init the React application router.
    routes =
      Routes
        location: 'hash',
          Route
            name: 'app'
            path: '/'
            handler: App,
              Route
                name: 'usrImgs'
                handler: UsrImgs
              Route
                name: 'logo'
                handler: Logo


    domReady =>
      @.container = React.renderComponent routes, document.body

# run it
module.exports.blastoff()
