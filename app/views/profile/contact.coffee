React = require 'react'
{div, ul, li, a} = require 'reactionary'

module.exports = React.createClass
  # getInitialState: ->

  contactLinkEl: (id, href, txt) ->
    li
      key: id
      className: id,
        a
          href: href,
            txt

  render: ->
    usr = @props.usr

    contactFields = []
    if usr.website
      contactFields.push @contactLinkEl('website', usr.website, 'View Website')
    if usr.personalEmail
      contactFields.push @contactLinkEl('email', 'mailto:'+usr.personalEmail, 'Contact via Email')

    ul
      className: 'contact-info',
        contactFields
