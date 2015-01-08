React = require 'react'

module.exports = React.createClass
  # getInitialState: ->

  contactLinkEl: (id, href, txt) ->
    if id is 'email'
      onClick = (e) ->
        e.preventDefault()
        window.location.href = href
      href = '#'

    <li key={id} className={id}>
      <a href={href} onClick={onClick}>{txt}</a>
    </li>

  render: ->
    {website, personalEmail} = @props.usr

    ContactFields = []
    if website
      ContactFields.push @contactLinkEl('website', website, 'View Website')
    if personalEmail
      ContactFields.push @contactLinkEl('email', 'mailto:'+personalEmail, 'Contact via Email')

    <ul className="contact-info">
      {ContactFields}
    </ul>
