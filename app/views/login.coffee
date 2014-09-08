React = require 'react'
{h1, div, p} = require 'reactionary'
Input = require 'react-bootstrap/Input'
_ = require 'lodash'

module.exports = React.createClass
  getInitialState: ->
    email: ''

  validationState: ->
    email = @state.email
    unless email then return
    #unless _.contains email, '@' then return 'warning'

    validEmails = ['kb', 'kc']
    if _.contains validEmails, email
      'success'
    else
      'error'

  changeEmail: ->
    email = @refs.email.getValue()
    if _.contains email, '@'
      email = email.split('@')[0]
    @setState email: email

  render: ->
    div
      className: 'container login',
        div
          className: 'row',
            div
              className: 'col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3',
                h1 'Login'
                p
                  className: 'lead',
                  'MICA Grad Show 2015',
                Input
                  type: 'text'
                  value: @state.email
                  placeholder: 'Enter MICA email'
                  label: 'You MICA email please'
                  help: 'No need to include @mica.edu (e.g. if your email is kbjornard@mica.edu, you would just enter kbjornard)'
                  bsStyle: @validationState()
                  ref: 'email'
                  hasFeedback: true
                  groupClassName: 'group-class-customize-me'
                  wrapperClassName: 'wrapper-class-customize-me'
                  labelClassName: 'label-class-editable'
                  onChange: @changeEmail
                  addonAfter: '@mica.edu'
