React = require 'react'

Slideshow = require './slideshow'
NoImages = require './noImages'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    {usr, img, img_i} = @props
    {statement} = usr

    if img
      Imgs = <Slideshow usr={usr} img={img} img_i={img_i} />
    else
      Imgs = <NoImages />

    <div className="student-main">
      {Imgs}
      <div className="statement" dangerouslySetInnerHTML={__html: statement} />
    </div>
