#!/bin/bash


GITBUCKET_VERSION=4.16.0

# 1
GITBUCKET_ANNOUNCE_PLUGIN_VERSION=1.7.1

# 2
GITBUCKET_H2_BACKUP_PLUGIN_VERSION=1.5.1

# 3
GITBUCKET_DESKTOPNOTIFY_PLUGIN_VERSION=4.10.0

# 4 -> gist plug-in: is part of the WAR now

# 5
GITBUCKET_COMMITGRAPHS_PLUGIN_VERSION=4.12.0

# 6
GITBUCKET_ASCIIDOCTOR_PLUGIN_VERSION=1.0.2

# 7
# GITBUCKET_BUGSPOTS_PLUGIN_VERSION=4.11.0

# 8 -> pages plug-in: is part of the WAR now

# 9
GITBUCKET_NETWORK_PLUGIN_VERSION=1.4

# 10 -> emoji plug-in: is part of the WAR now

# 11
# GITBUCKET_RST_PLUGIN_VERSION=0.4.0

# 12
GITBUCKET_EXPLORER_PLUGIN_VERSION=3.0.0

# 13 -> fess plug-in: requires more config instructions

# 14
GITBUCKET_PLANTUML_PLUGIN_VERSION=1.3.0

# 15
GITBUCKET_MONITORING_PLUGIN_VERSION=1.0.0

# 16 -> HTML5 Media plug-in: needs some examples

# 17 -> Jupyter plug-in: how to install Jypyter and make it work on Heroku?

# 18 -> Email Notifications plug-in: is part of the WAR now

echo downloading...
echo -- gitbucket.war.md5 && wget -q -O gitbucket.war.md5 https://github.com/gitbucket/gitbucket/releases/download/$GITBUCKET_VERSION/gitbucket.war.md5 && echo done.
echo

sig1=0

if [ -f gitbucket.war ];
then
	sig1=`/usr/bin/md5sum -b gitbucket.war | cut -d' ' -f1`
fi
sig2=`cut -d' ' -f1 gitbucket.war.md5`

if [ "$sig1" != "$sig2" ]
then
	echo gitbucket signature is wrong, downloading new version
	echo -- gitbucket.war && wget -q -O gitbucket.war https://github.com/gitbucket/gitbucket/releases/download/$GITBUCKET_VERSION/gitbucket.war && echo done.
else
	echo keeping gitbucket.war
fi

echo
echo checking plugins...
mkdir plugins > /dev/null 2>&1

if [ ! -f plugins/gitbucket-announce-plugin-$GITBUCKET_ANNOUNCE_PLUGIN_VERSION.jar ]
then
    rm plugins/gitbucket-announce-plugin*.jar > /dev/null 2>&1
    echo -- downloading gitbucket-announce-plugin.jar && wget -q -O plugins/gitbucket-announce-plugin-$GITBUCKET_ANNOUNCE_PLUGIN_VERSION.jar https://github.com/gitbucket-plugins/gitbucket-announce-plugin/releases/download/$GITBUCKET_ANNOUNCE_PLUGIN_VERSION/gitbucket-announce-plugin_2.12-$GITBUCKET_ANNOUNCE_PLUGIN_VERSION.jar && echo done.
fi

if [ ! -f plugins/gitbucket-h2-backup-plugin-$GITBUCKET_H2_BACKUP_PLUGIN_VERSION.jar ]
then
    rm plugins/gitbucket-h2-backup*.jar > /dev/null 2>&1
    echo -- downloading gitbucket-h2-backup.jar && wget -q -O plugins/gitbucket-h2-backup-plugin-$GITBUCKET_H2_BACKUP_PLUGIN_VERSION.jar https://github.com/gitbucket-plugins/gitbucket-h2-backup-plugin/releases/download/$GITBUCKET_H2_BACKUP_PLUGIN_VERSION/gitbucket-h2-backup-plugin_2.12-$GITBUCKET_H2_BACKUP_PLUGIN_VERSION.jar && echo done.
fi

if [ ! -f plugins/gitbucket-desktopnotify-plugin-$GITBUCKET_DESKTOPNOTIFY_PLUGIN_VERSION.jar ]
then
    rm plugins/gitbucket-desktopnotify-plugin*.jar > /dev/null 2>&1
    echo -- downloading gitbucket-desktopnotify-plugin.jar && wget -q -O plugins/gitbucket-desktopnotify-plugin-$GITBUCKET_DESKTOPNOTIFY_PLUGIN_VERSION.jar https://github.com/yoshiyoshifujii/gitbucket-desktopnotify-plugin/releases/download/$GITBUCKET_DESKTOPNOTIFY_PLUGIN_VERSION/gitbucket-desktopnotify-plugin_2.12-$GITBUCKET_DESKTOPNOTIFY_PLUGIN_VERSION.jar && echo done.
fi

if [ ! -f plugins/gitbucket-commitgraphs-plugin-$GITBUCKET_COMMITGRAPHS_PLUGIN_VERSION.jar ]
then
    rm plugins/gitbucket-commitgraphs-plugin*.jar > /dev/null 2>&1
    echo -- downloading gitbucket-commitgraphs-plugin.jar && wget -q -O plugins/gitbucket-commitgraphs-plugin-$GITBUCKET_COMMITGRAPHS_PLUGIN_VERSION.jar https://github.com/yoshiyoshifujii/gitbucket-commitgraphs-plugin/releases/download/$GITBUCKET_COMMITGRAPHS_PLUGIN_VERSION/gitbucket-commitgraphs-plugin_2.12-$GITBUCKET_COMMITGRAPHS_PLUGIN_VERSION.jar && echo done.
fi

if [ ! -f plugins/gitbucket-asciidoctor-plugin-$GITBUCKET_ASCIIDOCTOR_PLUGIN_VERSION.jar ]
then
    rm plugins/gitbucket-asciidoctor-plugin*.jar > /dev/null 2>&1
    echo -- downloading gitbucket-asciidoctor-plugin.jar && wget -q -O plugins/gitbucket-asciidoctor-plugin-$GITBUCKET_ASCIIDOCTOR_PLUGIN_VERSION.jar https://github.com/asciidoctor/gitbucket-asciidoctor-plugin/releases/download/$GITBUCKET_ASCIIDOCTOR_PLUGIN_VERSION/gitbucket-4.0-asciidoctor-plugin-assembly-$GITBUCKET_ASCIIDOCTOR_PLUGIN_VERSION.jar && echo done.
fi

if [ ! -f plugins/gitbucket-network-plugin-$GITBUCKET_NETWORK_PLUGIN_VERSION.jar ]
then
    rm plugins/gitbucket-network-plugin*.jar > /dev/null 2>&1
    echo -- downloading gitbucket-network-plugin.jar && wget -q -O plugins/gitbucket-network-plugin-$GITBUCKET_NETWORK_PLUGIN_VERSION.jar https://github.com/mrkm4ntr/gitbucket-network-plugin/releases/download/$GITBUCKET_NETWORK_PLUGIN_VERSION/gitbucket-network-plugin_2.12-$GITBUCKET_NETWORK_PLUGIN_VERSION.jar && echo done.
fi

# if [ ! -f plugins/gitbucket-rst-plugin-$GITBUCKET_RST_PLUGIN_VERSION.jar ]
# then
#    rm plugins/gitbucket-rst-plugin*.jar > /dev/null 2>&1
#    echo -- downloading gitbucket-rst-plugin.jar && wget -q -O plugins/gitbucket-rst-plugin-$GITBUCKET_RST_PLUGIN_VERSION.jar https://github.com/amuramatsu/gitbucket-rst-plugin/releases/download/$GITBUCKET_RST_PLUGIN_VERSION/gitbucket-4.0-rst-plugin-assembly-$GITBUCKET_RST_PLUGIN_VERSION.jar && echo done.
#fi

# if [ ! -f plugins/gitbucket-bugspots-plugin-$GITBUCKET_BUGSPOTS_PLUGIN_VERSION.jar ]
# then
#    rm plugins/gitbucket-bugspots-plugin*.jar > /dev/null 2>&1
#    echo -- downloading gitbucket-bugspots-plugin.jar && wget -q -O plugins/gitbucket-bugspots-plugin-$GITBUCKET_BUGSPOTS_PLUGIN_VERSION.jar https://github.com/yoshiyoshifujii/gitbucket-bugspots-plugin/releases/download/$GITBUCKET_BUGSPOTS_PLUGIN_VERSION/gitbucket-bugspots-plugin_2.11-$GITBUCKET_BUGSPOTS_PLUGIN_VERSION.jar && echo done.
#fi

if [ ! -f plugins/gitbucket-explorer-plugin-$GITBUCKET_EXPLORER_PLUGIN_VERSION.jar ]
then
    rm plugins/gitbucket-explorer-plugin*.jar > /dev/null 2>&1
    echo -- downloading gitbucket-explorer-plugin.jar && wget -q -O plugins/gitbucket-explorer-plugin-$GITBUCKET_EXPLORER_PLUGIN_VERSION.jar https://github.com/tomoki1207/gitbucket-explorer-plugin/releases/download/$GITBUCKET_EXPLORER_PLUGIN_VERSION/gitbucket-explorer-plugin_2.12-$GITBUCKET_EXPLORER_PLUGIN_VERSION.jar && echo done.
fi

if [ ! -f plugins/gitbucket-plantuml-plugin-$GITBUCKET_PLANTUML_PLUGIN_VERSION.jar ]
then
    rm plugins/gitbucket-plantuml-plugin*.jar > /dev/null 2>&1
    echo -- downloading gitbucket-plantuml-plugin.jar && wget -q -O plugins/gitbucket-plantuml-plugin-$GITBUCKET_PLANTUML_PLUGIN_VERSION.jar https://github.com/nus/gitbucket-plantuml-plugin/releases/download/v$GITBUCKET_PLANTUML_PLUGIN_VERSION/gitbucket-plantuml-plugin-assembly-$GITBUCKET_PLANTUML_PLUGIN_VERSION.jar && echo done.
fi

if [ ! -f plugins/gitbucket-plantuml-plugin-$GITBUCKET_MONITORING_PLUGIN_VERSION.jar ]
then
    rm plugins/gitbucket-monitorting-plugin*.jar > /dev/null 2>&1
    echo -- downloading gitbucket-monitorting-plugin && wget -q -O plugins/gitbucket-monitorting-plugin-$GITBUCKET_MONITORING_PLUGIN_VERSION.jar https://github.com/YoshinoriN/gitbucket-monitoring-plugin/releases/download/v$GITBUCKET_MONITORING_PLUGIN_VERSION/gitbucket-monitorting-plugin_2.12-$GITBUCKET_MONITORING_PLUGIN_VERSION.jar && echo done.
fi

echo
echo process ended. commit \& push the project to update.
