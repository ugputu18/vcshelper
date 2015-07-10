module.exports = class ExecError extends Error

  constructor: (message, @code) ->
    super(message)
