#!/bin/bash

# This script imports an entire BAG export into PostGIS

BAG_HOME=/var/kademo/data/bagxml/xml
SQL_RESULT=/var/kademo/data/inspire/ad.sql

PSQL="psql -a -U kadmin -d inspire"
PSQLS="psql -U kadmin -d inspire"

# Create the PostGIS DB + tables
function initDB() {
    cd ../../../db
    ./create-all.sh
    cd -
}

# Extract/Transfer/Load single file from BAG XML to PostGIS
function ETL() {
    echo "xsltproc bag2ad.xsl $1 >> $SQL_RESULT"

    # do the work: pipe directly into PostGIS
    # xsltproc bag2ad.xsl $1 | $PSQLS
    xsltproc bag2ad.xsl $1 >> $SQL_RESULT
}

# Extract/Transfer/Load entire dir from BAG XML to PostGIS
function ETLDir() {
    FILES=`ls $BAG_HOME/$1/*.xml`

    # ETL each file in directory
    for F in $FILES
    do
          ETL $F
    done
}

# initDB

/bin/rm -f $SQL_RESULT
ETL $BAG_HOME/0000WPL2009-09-01.xml
ETL $BAG_HOME/0000OPR2009-09-01.xml
ETLDir 0000VBO2009-09-01
ETL $BAG_HOME/0000LPL2009-09-01.xml
ETL $BAG_HOME/0000SPL2009-09-01.xml
ETLDir 0000NUM2009-09-01



