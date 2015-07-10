Base = require('./Base')
Promise = require('bluebird')
_ = require('lodash')

module.exports = class Collection extends Base

  constructor: (@handlers) ->

  for methodName in ['commit', 'pull', 'push', 'update', 'merge']
    # all do-methods replaced to collection-iterable methods
    do (methodName) =>
      @prototype[methodName] = ->
        result = Promise.resolve()
        for handler in @handlers
          do (handler) -> result = result.then -> handler[methodName](arguments...)
        result
