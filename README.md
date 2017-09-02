# gitbucket-community.herokuapp.com

This project stores the definition of the community demo version of GitBucket available at : http://gitbucket-community.herokuapp.com/

## How to deploy

The herokuapp update itself using the content of the GitHub project.
Thus on push, it will automatically redeploy with the new content.

## Update to a new version of GitBucket

- change in `update.sh` the version of GitBucket (use the tag value)
  for example from `GITBUCKET_VERSION=4.4` to `GITBUCKET_VERSION=4.5`
- run `./update.sh`
- commit & push the changes

## Update a plugin version

- change in `update.sh` the version of the plugin
  for example from `GITBUCKET_ANNOUNCE_PLUGIN_VERSION=1.4.0` to `GITBUCKET_ANNOUNCE_PLUGIN_VERSION=1.5.0`
- run `./update.sh`
- commit & push the changes

## Add a plugin

- add a variable storing the plugin version
- duplicate & adapt from another plugin the check and download part
- run `./update.sh`
- commit & push the changes

## Try it locally
Execute `run.sh` to start GitBucket locally in the current directory,
with the current downloded plug-ins.

## Errors

The following plug-ins doesn't seem to work correctly with the latest (4.16) version of GitBucket:
 - H2 Backup plugin - #2
 - Bugspots plugin - #7 - throws ClassNotFoundException
 - RST plugin - #11 - throws ClassNotFoundException
 - Explorer plugin - #12
