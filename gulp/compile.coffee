fs = require 'fs'
react = require 'react'
PublicIndex = require '../app/views/public/index'

html = react.renderComponentToStaticMarkup PublicIndex(null)
fs.writeFile('public/index.html', html)
