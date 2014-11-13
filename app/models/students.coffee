Collection = require('ampersand-collection')
Model = require('./student')
_ = require 'lodash'

module.exports = Collection.extend
  model: Model
  where: (attrs) ->
    if _.isEmpty attrs
      return []
    # Check each model.
    _.filter @models, (model) ->
      # Check for each value one at a time.
      match = true
      _.each attrs, (val, key) ->
        value = if model.get then model.get(key) else model[key]
        if value != val
          match = false
          return false
      return match
  # url: ->
  #   @parent.url()
  # sync: ->
  #   sync.apply {embeds: @}, arguments
