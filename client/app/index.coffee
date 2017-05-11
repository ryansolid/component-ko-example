ko = require 'knockout'
{registerComponent} = require 'component-register'
Component = require 'component-register-ko'
require 'style-loader!./global'

module.exports = registerComponent class Application extends Component
  @tag: 'example-app', @template: require './template'
  @styles: require './styles'
  constructor: (element) ->
    super
    # register components
    registerComponent(context(key)) for key in (context = require.context('../components', true, /^.\/([^\/]*\/)?[^\/]*(coffee)/)).keys()

    # initialize router
    router = new (require 'webcomponent-router')(element, {location: 'history'})
    (require './routes')(router)
    router.start()