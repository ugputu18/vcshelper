Base = require("./Base")

module.exports = class Git extends Base

  type: 'git'

  _doCommit: (message) -> @_exec(['git', 'commit', '-am', message])


  _doPull: -> @_exec(['git', 'pull'])


  _doPush: -> @_exec(['git', 'push'])


  _doUpdate: (revision) -> @_exec(['git', 'checkout', revision])


  _doMerge: (revision) -> @_exec(['git', 'merge', '--no-ff', '--no-commit', revision])


  _doStatus: -> @_exec(['git', 'status', '-s'])


  _doBranch: -> @_exec(['git', 'rev-parse', '--abbrev-ref', 'HEAD'])
