Collection = require('ampersand-collection')
Model = require('./student')
_ = require 'lodash'

module.exports = Collection.extend
  model: Model
  mainIndex: 'uid'
  where: (attrs) ->
    if _.isEmpty attrs
      return []
    # Check each model.
    _.filter @models, (model) ->
      # Check for each value one at a time.
      match = true
      _.each attrs, (val, key) ->
        value = if model.get then model.get(key) else model[key]
        unless _.isString value
          match = false
          return false
        if value != val
          if key == 'search'
            searchArr = _.compact val.split(' ')
            match = _.every searchArr, (searchTxt) ->
              value.indexOf(searchTxt) > -1
          else
            match = false
            return false
      return match
  # url: ->
  #   @parent.url()
  # sync: ->
  #   sync.apply {embeds: @}, arguments
