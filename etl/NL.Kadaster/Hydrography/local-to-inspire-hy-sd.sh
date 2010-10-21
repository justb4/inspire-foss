#!/bin/bash
#
# Transforms Dutch local Hydrography to INSPIRE HY-P
#
# Author: Just van den Broecke
#


BASEDIR=`dirname $0`/..
BASEDIR=`(cd "$BASEDIR"; pwd)`

# use the common script
$BASEDIR/bin/xslt.sh $BASEDIR/Hydrography/local-to-inspire-hy-sd.xsl $1  $2




