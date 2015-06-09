module.exports = ->

  program = require('commander')

  program
  .command('up [revision]')
  .alias('checkout')
  .description('Checkout revision to working directory')
  .action (revision, options) ->
    console.log 'vc up', revision, options

  program
  .command('merge [revision]')
  .description('Merge with revision')
  .action (revision, options) ->
    console.log 'vc merge', revision, options

  program
  .command('commit <message>')
  .description('Perform commit to all repositories')
  .alias('ci')
  .action (message, options) ->
    console.log 'commit', message, options

  program
  .command('push')
  .description('Push changesets to remote')
  .action (options) ->
    console.log 'push', options

  program
  .command('pull')
  .description('Pull changesets from remote')
  .action (options) ->
    console.log 'pull', options


  program.parse(process.argv)
