#!/bin/bash
#
# Transforms OSM local Admin Units to INSPIRE AU
#
# Author: Just van den Broecke
#


BASEDIR=`dirname $0`/../
BASEDIR=`(cd "$BASEDIR"; pwd)`

# use the common script
$BASEDIR/../shared/bin/xslt.sh $BASEDIR/AdministrativeUnits/local-to-inspire-au-sd.xsl $1  $2




