React = require 'react'
{html, head, title, meta, body, link, script, h1, div} = require 'reactionary'

data = require '../data/data.json'

Header = require './header/header'
Intro = require './intro/intro'
Schedule = require './schedule/schedule'
Galleries = require './galleries/galleries'
Students = require './students/students'
Footer = require './footer/footer'

module.exports = React.createClass
  render: ->
    appFileName = @props.sha or 'app'
    html null,
      head null,
        title data.title
        meta
          charSet: 'utf-8'
        link
          rel: 'stylesheet'
          type: 'text/css'
          media: 'print'
          href: '/print.css'
        link
          rel: 'stylesheet'
          type: 'text/css'
          href: "/#{appFileName}.css"
      body null,
        Header data
        Intro null
        Schedule null
        Galleries null
        Students null
        Footer data
        script
          type: 'text/javascript'
          src: '//cdnjs.cloudflare.com/ajax/libs/paper.js/0.9.18/paper-full.min.js'
        script
          type: 'text/javascript'
          src: "/#{appFileName}.js"
        div # canvas attribute is not supported by React...
          dangerouslySetInnerHTML:
            __html: '<script type="text/paperscript" canvas="canvas" src="mgslogo.js"></script>'
