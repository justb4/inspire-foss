#!/bin/bash
#
# Transforms Dutch local Addresses to INSPIRE AD
#
# Author: Just van den Broecke
#


BASEDIR=`dirname $0`/..
BASEDIR=`(cd "$BASEDIR"; pwd)`

# use the common script
$BASEDIR/bin/xslt.sh $BASEDIR/Addresses/local-to-inspire-ad-sd.xsl $1  $2





