#!/bin/bash
#
# Transforms Dutch local Admin Units to INSPIRE CP
#
# Author: Just van den Broecke
#


BASEDIR=`dirname $0`/..
BASEDIR=`(cd "$BASEDIR"; pwd)`

# use the common script
$BASEDIR/bin/xslt.sh $BASEDIR/GeographicalNames/local-to-inspire-gn-sd.xsl $1  $2




