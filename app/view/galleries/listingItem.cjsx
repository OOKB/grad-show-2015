React = require 'react'


module.exports = React.createClass
  render: ->
    {name, building, street, zip} = @props.location
    address = "#{street}, #{zip}"

    <li>
      <h4 className="gallery">{name}</h4>
      <div className="building">{building}</div>
      <div className="address"><address>{address}</address></div>
    </li>
