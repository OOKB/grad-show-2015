Collection = require('ampersand-collection')
Model = require('./student')

module.exports = Collection.extend
  model: Model
  # url: ->
  #   @parent.url()
  # sync: ->
  #   sync.apply {embeds: @}, arguments
