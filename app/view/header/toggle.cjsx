React = require 'react'


module.exports = React.createClass
  # getInitialState: ->

  render: ->
    {handleToggle, menuOpen} = @props
    if menuOpen
      className = "toggle close"
    else
      className = "toggle open"
    innerText = "Menu"
    <button onClick={handleToggle} className={className} type="button">
      {innerText}
    </button>
