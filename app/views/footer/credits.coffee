React = require 'react/addons'
cx = React.addons.classSet
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
    last = @props.built_designed.splice(-1, 1)[0]
    last.last = true
    last = @linkEl last
    links = @props.built_designed.map (credit, i) =>
      if i == 0
        credit.first = true
      @linkEl credit

    p
      className: 'credits count-'+length,
        'Built and designed by '
        links
        'and '
        last
