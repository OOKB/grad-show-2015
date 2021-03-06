React = require 'react'

Slideshow = require './slideshow'
NoImages = require './noImages'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    {usr, file, pos, type} = @props
    {statement} = usr

    if file
      Imgs = <Slideshow usr={usr} file={file} pos={pos} type={type} />
    else
      Imgs = <NoImages />
    if statement
      StatementEl = <div className="statement" dangerouslySetInnerHTML={__html: statement} />

    <div className="student-main">
      {Imgs}
      {StatementEl}
    </div>
