Base = require("./Base")

module.exports = class Mercurial extends Base

  type: 'mercurial'

  _doCommit: (message) -> @_exec(['hg', 'commit', '-m', message])


  _doPull: -> @_exec(['hg', 'pull'])


  _doPush: -> @_exec(['hg', 'push'])


  _doUpdate: (revision) -> @_exec(['hg', 'update', revision])


  _doMerge: (revision) -> @_exec(['hg', 'merge', '-r', revision])


  _doStatus: -> @_exec(['hg', 'status'])


  _doBranch: -> @_exec(['hg', 'branch'])
