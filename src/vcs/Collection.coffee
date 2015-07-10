Base = require('./Base')
Promise = require('bluebird')
_ = require('lodash')

module.exports = class Collection extends Base

  constructor: (@handlers) ->

  for methodName in ['commit', 'pull', 'push', 'update', 'merge', 'status', 'branch']
    # all do-methods replaced to collection-iterable methods
    do (methodName) =>
      @prototype[methodName] = (args...) ->
        result = Promise.resolve()
        for handler in @handlers
          do (handler) -> result = result.finally -> handler[methodName](args...)
        result
