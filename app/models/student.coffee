Model = require("ampersand-model")
crypto = require 'crypto'
_ = require 'lodash'

data = require '../data/studentSchema'

Images = require './images'
Embeds = require './embeds'

props = data.props
#props.peers = 'array'

module.exports = Model.extend
  idAttribute: 'uid'
  props: props
  fields: data.props
  collections:
    files: Images
    embeds: Embeds
  derived:
    email:
      deps: ['uid']
      fn: ->
        @emailFromUid(@uid)
    gravatar:
      deps: ['email']
      fn: ->
        @gravatarUrl(@email)
    fullName:
      deps: ['firstName', 'lastName']
      fn: ->
        @firstName+' '+@lastName
    programName:
      deps: ['program']
      fn: ->
        if @program
          _.find(props.program.options, value: @program).name
        else
          null
    locationName:
      deps: ['location']
      fn: ->
        if @location
          _.find(props.location.options, value: @location).name
        else
          null
    searchStr:
      deps: ['fullName']
      fn: ->
        @fullName
    peers:
      deps: ['program']
      fn: ->
        @collection.where {program: @program}

  emailFromUid: (uid) ->
    if uid == 'kai'
      'kai@ezle.io'
    else
      uid+'@mica.edu'

  gravatarUrl: (email) ->
    hash = crypto.createHash('md5').update(email).digest('hex')
    'https://www.gravatar.com/avatar/'+hash+'?d=retro&s=300'

  parse: (usr) ->
    if usr.uid and not usr.pic
      usr.pic = @gravatarUrl(@emailFromUid(usr.uid))

    if usr.files and usr.files.length
      usr.files = _.map usr.files, (file) ->
        file.metadata.id = file.fileName
        file
    #console.log 'Parsed user.'
    return usr
