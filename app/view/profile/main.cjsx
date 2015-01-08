React = require 'react'

ProgramList = require './programList'
Slideshow = require './slideshow'
NoImages = require './noImages'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    {usr, img} = @props
    {statement} = usr

    if img
      Imgs = <Slideshow usr={usr} img={img} />
    else
      Imgs = <NoImages />

    <div className="student-main">
      {Imgs}
      <div className="statement" dangerouslySetInnerHTML={__html: statement} />
      <ProgramList usr={usr} />
    </div>
