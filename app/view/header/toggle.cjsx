React = require 'react'


module.exports = React.createClass
  # getInitialState: ->

  render: ->
    {handleToggle, menuOpen} = @props
    if menuOpen
      innerText = "Hide Menu"
    else
      innerText = "Reveal Menu"
    <button onClick={handleToggle} className="toggle" type="button">
      {innerText}
    </button>
