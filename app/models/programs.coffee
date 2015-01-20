Model = require 'ampersand-model'
Collection = require 'ampersand-collection'
moment = require 'moment'

programData = require('../data/programs').programs

# Show Model
Show = Model.extend
  props:
    id: 'string'
    start: 'object'
    end: 'object'
  parse: (model) ->
    model.id = ''
    if model.start
      model.start = moment.utc model.start
      model.id += model.start.format 'YYMMDD'
    if model.end
      model.end = moment.utc model.end
      model.id += model.end.format 'YYMMDD'
    model
  derived:
    shortDate:
      deps: ['start', 'end']
      fn: ->
        @start.format('MMM D-')+@end.format('MMM D')
    displayDate:
      deps: ['start', 'end']
      fn: ->
        @start.format('MMM DD-')+@end.format('MMM DD, YYYY')
    longDate:
      deps: ['start', 'end']
      fn: ->
        @start.format('MMMM D-')+@end.format('MMMM D, YYYY')

# Shows Collection
Shows =  Collection.extend
  model: Show
  mainIndex: 'id'

# Program Model
Program = Model.extend
  props:
    id: 'string'
    type: 'string'
    shortform: 'string'
    alias: 'array'
    name: 'string'
    blurb: 'string'
  collections:
    shows: Shows

# AllShows Collection
AllShows = Collection.extend
  model: Show
  mainIndex: 'id'
  comparator: 'id'

# Programs Collection
Programs = Collection.extend
  model: Program
  mainIndex: 'id'
  allShows: new AllShows()

programCollection = new Programs programData, parse: true

programCollection.each (program) ->
  program.shows.each (show) ->
    unless programCollection.allShows.get(show.id)
      programCollection.allShows.add(show)

module.exports = programCollection
