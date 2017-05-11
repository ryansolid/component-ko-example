{Model} = require 'backbone'

module.exports = class User extends Model
  urlRoot: '/api/users'
  sync: require('backbone-http').sync(User)