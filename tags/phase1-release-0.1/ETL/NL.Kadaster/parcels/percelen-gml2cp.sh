#!/bin/bash
#
# Imports an entire PERCELEN export into PostGIS
#
# Author: Just van den Broecke
#
PERCELEN_HOME=/var/kademo/data/kad-vlakken-lim
SQL_RESULT=/var/kademo/data/inspire/cp.sql
PSQL="psql -a -U kadmin -d inspire"
PSQLS="psql -U kadmin -d inspire"

# single arg whether to create empty db
INIT_DB=$1

# Create the PostGIS DB + tables
function initDB() {
    cd ../../../db
#    ./create-all.sh
    cd -
}

# Extract/Transfer/Load single file from PERCELEN XML to PostGIS
function ETL() {
    echo "xsltproc percelen2cp.xsl $1 >> $SQL_RESULT"

    # do the work: pipe directly into PostGIS
    # xsltproc -v --timing percelen2cp.xsl $1 | $PSQL
    nice xsltproc percelen2cp.xsl $1 >> $SQL_RESULT
}

# Extract/Transfer/Load entire dir from PERCELEN XML to PostGIS
function ETLDir() {
    FILES=`ls $PERCELEN_HOME/$1/*.xml`

    # ETL each file in directory
    for F in $FILES
    do
          ETL $F
    done
}

function usage() {
	echo "Usage: percelen-gml2cp.sh [initDB]"
	exit -1
}

function error() {
	echo "ERROR: $1"
	exit -1
}

if [ "${INIT_DB}" =  "initDB" ]
then
    initDB
fi

/bin/rm -f $SQL_RESULT
ETL $PERCELEN_HOME/Perceelvlak.gml



