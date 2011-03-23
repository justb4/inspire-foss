#!/bin/bash
#
# Transforms Dutch local Hydrography to INSPIRE TN-RO
#
# Author: Just van den Broecke
#


BASEDIR=`dirname $0`/..
BASEDIR=`(cd "$BASEDIR"; pwd)`

# use the common script
$BASEDIR/../shared/bin/xslt.sh $BASEDIR/TransportNetworks/local-to-inspire-tn-ro-sd.xsl $1  $2




