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

## Try it locally first

Execute `./run.sh` from the current directory to start GitBucket locally ( http://localhost:8080/gitbucket/ ), with `GITBUCKET_HOME`  as the current directory: it will be using all the currently downloaded plug-ins.


## Errors

The following plug-ins doesn't seem to work correctly now with the latest (4.16.0) version of GitBucket:
 - Bugspots plugin - #7 - throws ClassNotFoundException
 - RST plugin - #11 - throws ClassNotFoundException
