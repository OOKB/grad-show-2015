React = require 'react'

module.exports = React.createClass

  componentDidMount: ->
    @forceUpdate

  handleClick: (e) ->
    {email} = @props
    if e.preventDefault
      e.preventDefault()
    window.location.href = email
    return

  render: ->
    {email} = @props
    unless email
      console.warn 'no email address'
      return false
    emailJumble = email.replace('@', '(at)').split('').reverse().join('')
    if isMounted() # Show the actual email address
      <a href="#" className="email">{email}</a>
    else # Obfuscate email address
      style =
        unicodeBidi: 'bidi-override'
        direction: 'rtl'
      <a href="#" className="email" style={style}>{emailJumble}</a>
