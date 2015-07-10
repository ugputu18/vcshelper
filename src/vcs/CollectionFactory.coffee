Collection = require('./Collection')
Git = require('./Git')
Mercurial = require('./Mercurial')
Promise = require('bluebird')
fs = Promise.promisifyAll(require('fs'))
path = require('path')

module.exports = class CollectionFactory

  @create: (basePath, configPath) ->
    ###
    Return promise of Collection
    ###
    if fs.existsSync(configPath)
        @_createByFile(basePath, require(configPath))
    else if fs.existsSync(path.join(basePath, '.hg'))
      Promise.resolve(new Mercurial(basePath))
    else if fs.existsSync(path.join(basePath, '.git'))
      Promise.resolve(new Git(basePath))
    else
      throw new Error('No vcs found')


  @_createByFile: (basePath, config) ->
    fs.realpathAsync(basePath).then (basePath) =>
      Promise.all(
        for name, value of config
          do (value) =>
            fs.realpathAsync(path.join(basePath, value.path)).then (cwd) =>
              switch value.type
                when 'hg' then new Mercurial(cwd, value.revmap)
                when 'git' then new Git(cwd, value.revmap)
                else throw new Error("Invalid type of repo. Expected one of git, hg, but #{value.type} given")
      )
    .then (helpers) => new Collection(helpers)
