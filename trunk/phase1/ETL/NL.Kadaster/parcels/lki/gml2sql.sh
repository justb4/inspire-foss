#!/bin/bash

GML_FILE=$1
SQL_FILE=$2

/bin/rm -f $SQL_FILE

echo "xsltproc: $GML_FILE into $SQL_FILE"

echo "-- FOR PARCELS FROM GML $GML_FILE" >> $SQL_FILE
xsltproc ../percelen2cp.xsl $GML_FILE >> $SQL_FILE
