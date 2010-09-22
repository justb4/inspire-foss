#!/bin/bash
#
# Transforms Dutch local Admin Units to INSPIRE AU
#
# Author: Just van den Broecke
#

RESULT_FILE=${2}

# Transformation
function transform() {
    echo "xsltproc local-to-inspire-au.xsl $1 $2"

    # do the work
    # xsltproc -v --timing local-to-inspire-au.xsl $1
    # may use "nice"
    xsltproc local-to-inspire-au.xsl $1  > $2
   echo "xsltproc local-to-inspire-au.xsl $1 $2 DONE"
}

# Extract/Transfer/Load entire dir from PERCELEN XML to PostGIS
function transformDir() {
    FILES=`ls $AU_HOME/$1/*.xml`

    # Transform each file in directory
    for F in $FILES
    do
          transform $F
    done
}

function usage() {
	echo "Usage: local-to-inspire-au.sh src dst"
	exit -1
}

function error() {
	echo "ERROR: $1"
	exit -1
}


transform $1 $2



