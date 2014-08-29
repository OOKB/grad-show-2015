React = require 'react'
{div, p} = require 'reactionary'
_ = require 'lodash'

data = require '../models/student.yaml'
Text = require '../el/form/text'
Select = require '../el/form/select'

module.exports = React.createClass

  render: ->
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
      if _.contains ['text', 'email', 'textarea'], field.element
        fields.push Text props
      else if field.element == 'select'
        fields.push Select props
    div
      id: 'container-collection'
      className: 'collection',
        fields
