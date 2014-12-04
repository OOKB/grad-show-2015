React = require 'react'
{html, head, title, meta, body, link, script, h1, div} = require 'reactionary'

data = require '../data/data.json'

App = require './app'

module.exports = React.createClass
  render: ->
    appFileName = @props.sha or 'app'
    html null,
      head null,
        title data.title
        meta
          charSet: 'utf-8'
        meta
          name: 'viewport'
          content: 'width=device-width, initial-scale=1'
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
        div
          id: 'react',
            App data: data
        script
          type: 'text/javascript'
          src: '//cdnjs.cloudflare.com/ajax/libs/paper.js/0.9.18/paper-full.min.js'
        script
          type: 'text/javascript'
          src: "/#{appFileName}.js"
        div # canvas attribute is not supported by React...
          dangerouslySetInnerHTML:
            __html: '<script type="text/paperscript" canvas="canvas" src="mgslogo.js"></script>'
