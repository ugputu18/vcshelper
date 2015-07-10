Promise = require("bluebird")
passthru = Promise.promisify(require("passthru"))
ExecError = require('./ExecError')
path = require('path')
_ = require('lodash')
colors = require('colors')

module.exports = class Base
  ###
  Base class for all VC helpers
  ###

  type: null

  constructor: (@dir, @revMap = {}) ->
    @_dirToLog = if @dir == process.cwd()
      undefined
    else
      _.trim(path.relative(process.cwd(), @dir))


  commit: (message) -> @_doCommit(message)


  pull: -> @_doPull()


  push: -> @_doPush()


  update: (revision) -> @_doUpdate(@_mapRev(revision))


  merge: (revision) -> @_doUpdate(@_mapRev(revision))


  _mapRev: (revision) -> @revMap.revision ? revision


  _exec: (command) ->
    if Array.isArray(command)
      command = command.filter (c) -> c != undefined
    logCommand = command
    if Array.isArray(logCommand)
      logCommand = logCommand.join(' ')
    logArgs = []
    if undefined != @_dirToLog
      logArgs.push colors.green(@_dirToLog+':')
    logArgs.push colors.yellow("( #{@type} )")
    logArgs.push logCommand
    console.log.apply(console, logArgs)
    passthru(command, cwd: @dir).error (e)-> throw new ExecError(e.cause.message, e.cause.code)


  _doCommit: (message) ->


  _doPull: ->


  _doPush: ->


  _doUpdate: (revision) ->


  _doMerge: (revision) ->
