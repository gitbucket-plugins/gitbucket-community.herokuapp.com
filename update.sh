#!/bin/bash


GITBUCKET_VERSION=4.5

GITBUCKET_ANNOUNCE_PLUGIN_VERSION=1.5.0
GITBUCKET_H2_BACKUP_PLUGIN_VERSION=1.3.0
GITBUCKET_DESKTOPNOTIFY_PLUGIN_VERSION=4.3.0
GITBUCKET_COMMITGRAPHS_PLUGIN_VERSION=3.12.0
GITBUCKET_ASCIIDOCTOR_PLUGIN_VERSION=1.0.1
GITBUCKET_PAGES_PLUGIN_VERSION=0.7
GITBUCKET_NETWORK_PLUGIN_VERSION=1.1
GITBUCKET_EMOJI_PLUGIN_VERSION=4.3.0
GITBUCKET_RST_PLUGIN_VERSION=0.1.0
GITBUCKET_BUGSPOTS_PLUGIN=3.12.0

echo downloading...
echo -- gitbucket.war.md5 && wget -q -O gitbucket.war.md5 https://github.com/gitbucket/gitbucket/releases/download/$GITBUCKET_VERSION/gitbucket.war.md5 && echo done.
echo

sig1=0

if [ -f gitbucket.war ];
then
	sig1=`md5sum -b gitbucket.war | cut -d' ' -f1`
fi
sig2=`cut -d' ' -f1 gitbucket.war.md5`

if [ $sig1 != $sig2 ]
then
	echo gitbucket signature is wrong, downloading new version
	echo -- gitbucket.war && wget -q -O gitbucket.war https://github.com/gitbucket/gitbucket/releases/download/$GITBUCKET_VERSION/gitbucket.war && echo done.
else
	echo keeping gitbucket.war
fi

if [ -d plugins ];
then
	echo plugins directory exists, skipping.
else
	echo
	echo downloading plugins...
	rm -rf plugins
	mkdir plugins
	echo -- gitbucket-announce-plugin.jar && wget -q -O plugins/gitbucket-announce-plugin.jar https://github.com/gitbucket-plugins/gitbucket-announce-plugin/releases/download/$GITBUCKET_ANNOUNCE_PLUGIN_VERSION/gitbucket-announce-plugin.jar && echo done.
	echo -- gitbucket-h2-backup.jar && wget -q -O plugins/gitbucket-h2-backup.jar https://github.com/gitbucket-plugins/gitbucket-h2-backup-plugin/releases/download/$GITBUCKET_H2_BACKUP_PLUGIN_VERSION/gitbucket-h2-backup.jar && echo done.
	echo -- gitbucket-desktopnotify-plugin.jar && wget -q -O plugins/gitbucket-desktopnotify-plugin.jar https://github.com/yoshiyoshifujii/gitbucket-desktopnotify-plugin/releases/download/$GITBUCKET_DESKTOPNOTIFY_PLUGIN_VERSION/gitbucket-desktopnotify-plugin_2.11-$GITBUCKET_DESKTOPNOTIFY_PLUGIN_VERSION.jar && echo done.
	echo -- gitbucket-commitgraphs-plugin.jar && wget -q -O plugins/gitbucket-commitgraphs-plugin.jar https://github.com/yoshiyoshifujii/gitbucket-commitgraphs-plugin/releases/download/$GITBUCKET_COMMITGRAPHS_PLUGIN_VERSION/gitbucket-commitgraphs-plugin_2.11-$GITBUCKET_COMMITGRAPHS_PLUGIN_VERSION.jar && echo done.
	echo -- gitbucket-asciidoctor-plugin.jar && wget -q -O plugins/gitbucket-asciidoctor-plugin.jar https://github.com/asciidoctor/gitbucket-asciidoctor-plugin/releases/download/$GITBUCKET_ASCIIDOCTOR_PLUGIN_VERSION/gitbucket-4.0-asciidoctor-plugin-assembly-$GITBUCKET_ASCIIDOCTOR_PLUGIN_VERSION.jar && echo done.
	echo -- gitbucket-pages-plugin.jar && wget -q -O plugins/gitbucket-pages-plugin.jar https://github.com/yaroot/gitbucket-pages-plugin/releases/download/v$GITBUCKET_PAGES_PLUGIN_VERSION/pages-plugin_2.11-$GITBUCKET_PAGES_PLUGIN_VERSION.jar && echo done.
	echo -- gitbucket-network-plugin.jar && wget -q -O plugins/gitbucket-network-plugin.jar https://github.com/mrkm4ntr/gitbucket-network-plugin/releases/download/$GITBUCKET_NETWORK_PLUGIN_VERSION/gitbucket-network-plugin_2.11-$GITBUCKET_NETWORK_PLUGIN_VERSION.jar && echo done.
	echo -- gitbucket-emoji-plugin.jar && wget -q -O plugins/gitbucket-emoji-plugin.jar https://github.com/gitbucket/gitbucket-emoji-plugin/releases/download/$GITBUCKET_EMOJI_PLUGIN_VERSION/gitbucket-emoji-plugin_2.11-$GITBUCKET_EMOJI_PLUGIN_VERSION.jar && echo done.
	echo -- gitbucket-rst-plugin.jar && wget -q -O plugins/gitbucket-rst-plugin.jar https://github.com/amuramatsu/gitbucket-rst-plugin/releases/download/$GITBUCKET_RST_PLUGIN_VERSION/gitbucket-4.0-rst-plugin-assembly-$GITBUCKET_RST_PLUGIN_VERSION.jar && echo done.
	echo -- gitbucket-bugspots-plugin.jar && wget -q -O plugins/gitbucket-bugspots-plugin.jar https://github.com/yoshiyoshifujii/gitbucket-bugspots-plugin/releases/download/$GITBUCKET_BUGSPOTS_PLUGIN/gitbucket-bugspots-plugin_2.11-$GITBUCKET_BUGSPOTS_PLUGIN.jar && echo done.
fi

echo
echo process ended. commit \& push the project to update.