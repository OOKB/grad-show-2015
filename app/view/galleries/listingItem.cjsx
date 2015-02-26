React = require 'react'

module.exports = React.createClass
  render: ->
    {name, building, street, zip, value} = @props.location
    value   = "#{value}"
    address = "#{street}, #{zip}"

    <li className={value}>
      <h4 className="gallery">{name}</h4>
      <div className="building">{building}</div>
      <div className="address"><address>{address}</address></div>
    </li>
