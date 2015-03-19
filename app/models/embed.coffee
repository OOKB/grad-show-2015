Model = require("ampersand-state")
module.exports = Model.extend

  props:
    id: 'string'
    uri:
      type: 'string'
    oembed:
      type: 'object'
