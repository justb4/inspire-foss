#!/bin/bash
#
# Transforms Dutch local Cadastral Parcels from Shape format to flat GML
#
# Author: Just van den Broecke
#

BASEDIR=`dirname $0`/..
BASEDIR=`(cd "$BASEDIR"; pwd)`

# use the common script
$BASEDIR/bin/to-gml.sh $1 $2

pwd


