React = require 'react'
{div, p, form, fieldset, img, button} = require 'reactionary'
Input = require 'react-bootstrap/Input'
_ = require 'lodash'

data = require '../models/photo.yaml'
Text = require '../el/form/text'
TextArea = require '../el/form/textarea'
Select = require '../el/form/select'

module.exports = React.createClass
  getInitialState: ->
    fieldQty: 1

  addImg: ->
    if @state.fieldQty < 20
      @setState fieldQty: @state.fieldQty + 1
    return

  imgFields: (i) ->
    fields = []
    _.forEach data.props, (field, fieldId) ->
      props =
        key: fieldId
        id: fieldId
        label: field.label
        placeholder: field.placeholder
        help: field.help
        fieldType: field.element
        options: field.options
      if _.contains ['text', 'email'], field.element
        fields.push Text props
      else if field.element == 'select'
        fields.push Select props
      else if field.element == 'textarea'
        fields.push TextArea props
    fields.push Input
      key: 'files'
      type: 'file'
      id: 'fileImg'
      accept:"image/jpg, image/jpeg"
      className: "col-md-4 col-md-offset-4"
      onChange: (input) =>
        #Screw you art kid, stop trying to be unique! — only jpgs allowed.
        #fileInput = @refs['fileImg'].getDOMNode()
        fileInput = document.getElementById("fileImg")
        if fileInput.files and fileInput.files[0]
          reader = new FileReader()
          reader.onload = (e) =>
            console.log 'file change'
            @setState imgSrc: e.target.result
          reader.readAsDataURL fileInput.files[0]

    if @state and @state.imgSrc
      console.log 'lshow img'
      fields.push img
        key: 'img'
        src: @state.imgSrc
        alt: 'preview image'
    setName = 'img-fields-'+i
    fieldset
      key: setName
      className: setName,
        fields

  render: ->
    fieldQty = @state.fieldQty
    imgs = _.map _.range(fieldQty), @imgFields
    form
      className: 'form-horizontal',
        imgs
        button
          onClick: @addImg,
            '+ More'
