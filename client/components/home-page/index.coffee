ko = require 'knockout'
Component = require 'component-register-ko'

module.exports = class HomePage extends Component
  @tag: 'home-page', @template: require './template'
  @styles: require './styles'

  constructor: (element) ->
    super
    @name = ko.observable('World')
