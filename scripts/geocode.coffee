fs = require 'fs'
yaml = require 'js-yaml'
async = require 'async'
_ = require 'lodash'
r = require 'request'

txt = fs.readFileSync './content/locations.yaml', 'utf8'
data = yaml.safeLoad txt
unless data.locations then return
locations = data.locations

console.log locations
geoCode = (loc, cb) ->
  api = 'https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyBvRcq80VXzEvyujglWI8KyjM0gIectUfQ&address='
  citySt = '+baltimore+maryland+'
  geoString = loc.street+citySt+loc.zip
  req = api+geoString
  console.log geoString
  r.get req, (err, resp, body) ->
    if err then return cb(err, loc)
    geo = JSON.parse body
    if geo.status == 'OK' and geo.results and geo.results[0].geometry
      loc.geoData = geo.results[0].geometry
    else
      loc.geoData = geo.results
    cb(err, loc)
    return


async.map locations, geoCode, (err, locData) ->
  if err then throw err
  data.locations = locData
  yamlStr = "---\n"+yaml.safeDump(data)
  fs.writeFileSync './content/locations.yaml', yamlStr
  console.log 'done!'
