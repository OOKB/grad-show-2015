_ = require 'lodash'

module.exports = (data) ->
  {students, schema, programs, locations} = data
  data.currentYear = new Date().getFullYear()
  data.imgNum = 1
  unless programs
    console.error 'missing programs'
  data.programs = require('./models/programs')(programs)

  StudentCollection = require('./models/students')(schema, locations, data.programs)
  data.students = new StudentCollection students, parse: true
  data.data.locationSettings.points = []
  _.each locations, (loc) ->
    {geoData, name, building, street, zip} = loc
    if geoData
      directionsLink = 'https://maps.google.com?daddr='+street.split(' ').join('+')
      directionsLink += '+Baltimore+Maryland+'+zip
      popupHTML = "<div>
        <h3>#{loc.name}</h3>
        <ul>
          #{if loc.building then '<li>Building: '+building+'</li>' else ''}
          <li>Address: #{street} #{zip}</li>
          <li><a href=\"#{directionsLink}\">Directions</a></li>
        </ul>
      </div>"
      data.data.locationSettings.points.push {
        latitude: loc.geoData.location.lat
        longitude: loc.geoData.location.lng
        label: loc.name
        info: popupHTML
      }

  console.log 'processed data'
  return data
