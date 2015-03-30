React = require 'react'
_ = require 'lodash'

Nav = require './nav'

module.exports = React.createClass
  getInitialState: ->
    imgNum: @props.data.imgNum

  componentDidMount: ->
    {headerImgQty} = @props.data
    @setState imgNum: _.random(1, headerImgQty)

  render: ->
    {imgNum} = @state
    {data, programs} = @props
    {title} = data
    className = "header-art-#{imgNum}"

    <header className={className}>
      <h1 style={display: 'none'}>{title}</h1>
      <Nav data={data} programs={programs} />
    </header>
