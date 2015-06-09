# Work In Progress!

# VCS Helper
Multiple repositories helper

This tool allows you handle multiple repositories within one project by running one command.
Command is `vc` - acronym of **v**ersion **c**ontrol

```
vc up <rev>
vc merge <rev>
vc commit -m "Commit message"
vc push
```

To configure tool you should place `vcshelper.coffee` file to the root of your project. This file
should export object describes your project's repositories structure

Example:
```coffee
module.exports = 
  main: # just a key
    path: '.' # root of repository
    type: 'hg' # hg or git allowed
  core:
    path: 'public/bundles/cord/core' # relative to project's root dir
    type: 'git'
```
