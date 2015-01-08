React = require 'react'
{RouteHandler} = require 'react-router'

Main = require './main'

module.exports = React.createClass
  render: ->
    {data} = @props
    {title, sha} = data
    appFileName = sha or 'app'
    cssFilePath = "/assets/#{appFileName}.css"
    jsFilePath = "/assets/#{appFileName}.js"

    <html>
      <head>
        <title>{title}</title>
        <meta charSet="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" type="text/css" href={cssFilePath} />
        <link rel="stylesheet" type="text/css" href="/assets/print.css" media="print" />
      </head>
      <body>
        <div id="react">
          <Main data={data} />
        </div>
        <script src="/paper-full-v0.9.21.min.js" type="text/javascript" />
        <script src={jsFilePath} type="text/javascript" />
        <script src="/ga.js" type="text/javascript" />
        <span dangerouslySetInnerHTML={__html: '<script type="text/paperscript" canvas="canvas" src="mgslogo.js"></script>'} />
      </body>
    </html>
