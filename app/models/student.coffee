Model = require("ampersand-state")
_ = require 'lodash'

Images = require './images'
Embeds = require './embeds'

module.exports = (schema, locationData, programs) ->
  Programs = require('./programs')(programs)

  props = schema
  props.showNum =
    required: true
    default: 1
    type: 'number'
  props.program =
    type: 'object'

  Model.extend
    idAttribute: 'uid'
    props: props
    collections:
      files: Images
      embeds: Embeds
    derived:
      fullName:
        deps: ['firstName', 'lastName']
        fn: ->
          @firstName+' '+@lastName
      programId:
        deps: ['program']
        fn: ->
          @program and @program.id
      programName:
        deps: ['program']
        fn: ->
          if @program
            @program.name
          else
            null
      locationName:
        deps: ['location']
        fn: ->
          if @location
            loc = _.find(locationData, value: @location)
            if loc
              loc.name
            else
              @location
          else
            null
      locationId:
        deps: ['location']
        fn: ->
          if @location
            loc = _.find(locationData, value: @location)
            if loc and loc.offCampus
              'offcampus'
            else
              @location
          else
            null
      search:
        deps: ['fullName']
        fn: ->
          @fullName.toLowerCase()
      peers:
        deps: ['programId']
        fn: ->
          @collection.where {programId: @programId}
      myIndex:
        deps: ['peers']
        fn: ->
          _.indexOf _.pluck(@peers, 'uid'), @uid
      nextPeer:
        deps: ['peers', 'myIndex']
        fn: ->
          if @myIndex == @peers.length-1
            0
          else
            @peers[@myIndex+1]
      prevPeer:
        deps: ['peers', 'myIndex']
        fn: ->
          if @myIndex == 0
            @peers[@peers.length-1]
          else
            @peers[@myIndex-1]
      show:
        deps: ['program', 'showNum']
        fn: ->
          @program?.shows?.models[@showNum-1]
      showId:
        deps: ['show']
        fn: ->
          @show?.id
      showDate:
        deps: ['program', 'showNum']
        fn: ->
          unless @show then return null
          @show.displayDate

    parse: (usr) ->
      if usr.files and usr.files.length
        usr.files = _.map usr.files, (file) ->
          file.metadata.id = file.fileName
          file
      if usr.program and prog = Programs.get(usr.program)
        usr.program = prog
      else
        usr.program = {}
      #console.log 'Parsed user.'
      return usr
