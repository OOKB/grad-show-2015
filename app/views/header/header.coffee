React = require 'react'
{header, h1, div} = require 'reactionary'

Logo = require './logo'
Nav = require './nav'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
<<<<<<< HEAD
    header
      className: 'header-art-1',
        Logo null
        h1
          style: {display: 'none'},
            @props.title
        div
          className: 'down-arrow',
            "\\/"
        Nav @props
=======
    header null,
      Logo null
      h1
        style: {display: 'none'},
          @props.title
      div
        className: 'down-arrow',
          "\\/"
      Nav @props
>>>>>>> d0841b46138d997a013ea8006d54ffacb0e2994d
