CollectionFactory = require('./vcs/CollectionFactory')
Promise = require('bluebird')
require('coffee-script/register');
path = require('path')
ExecError = require('./vcs/ExecError')

Promise.longStackTraces()

module.exports = ->

  program = require('commander')

  vcCollection = CollectionFactory.create(process.cwd(), path.join(process.cwd(), 'vcsfile.coffee'))
  exitProcess = (e) -> process.exit(e.code)

  program
  .command('up [revision]')
  .alias('checkout')
  .description('Checkout revision to working directory')
  .action (revision, options) ->
    vcCollection.update(revision)
    .catch ExecError, exitProcess

  program
  .command('merge [revision]')
  .description('Merge with revision')
  .action (revision, options) ->
    vcCollection.merge(revision)
    .catch ExecError, exitProcess


  program
  .command('commit <message>')
  .description('Perform commit to all repositories')
  .alias('ci')
  .action (message, options) ->
    vcCollection.commit(message)
    .catch ExecError, exitProcess

  program
  .command('push')
  .description('Push changesets to remote')
  .action (options) ->
    vcCollection.push()
    .catch ExecError, exitProcess

  program
  .command('pull')
  .description('Pull changesets from remote')
  .action (options) ->
    vcCollection.pull()
    .catch ExecError, exitProcess


  vcCollection.then (collection) ->
    vcCollection = collection
    program.parse(process.argv)
