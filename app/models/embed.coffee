Model = require("ampersand-model")
r = require 'superagent'
module.exports = Model.extend

  props:
    id: 'string'
    uri:
      type: 'string'
    oembed:
      type: 'object'
