Collection = require('ampersand-collection')
Model = require('./image')

module.exports = Collection.extend
  model: Model
  mainIndex: 'fileName'

  # comparator: (model) ->
  #   model.metadata.sortOrder

  # initialize: ->
  #   @on 'all', (a,b,c) ->
  #     console.log a,b,c
