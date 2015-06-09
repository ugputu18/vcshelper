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

To configure tools you should place `.vcshelper` file to the root of your project. Syntax is:

```
<folder relative to root, dot is allowed> <git|hg>
```

Example:
```
. hg
public/bundles/cord/core git
```
