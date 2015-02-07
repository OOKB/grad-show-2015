React = require 'react'


module.exports = React.createClass
  render: ->
    {name, building, street, zip} = @props.location
    address = "#{street}, #{zip}"

    <li>
      <div>{name}</div>
      <div>{building}</div>
      <div>{address}</div>
    </li>
