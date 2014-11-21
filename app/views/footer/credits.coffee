React = require 'react'
cx = require '../cx'
{p, a, span} = require 'reactionary'


module.exports = React.createClass

  linkEl: (props) ->
    span
      key: props.name
      className: cx(credit: true, first: props.first, last: props.last),
        a
          href: props.link
          title: props.name
          target: '_blank',
            props.name
        if props.last then '.' else ', '

  render: ->
    length = @props.built_designed.length
    last_i = length-1
    last = @props.built_designed[last_i]
    last.last = true
    last = @linkEl last
    links = @props.built_designed.map (credit, i) =>
      if i == 0
        credit.first = true
      unless i == last_i
        return @linkEl credit
      return

    p
      className: 'credits count-'+length,
        'Built and designed by '
        links
        'and '
        last
