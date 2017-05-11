module.exports = (router) ->
  router.map ->
    @notFound -> ['index']
    @index {tag: 'home-page'}
