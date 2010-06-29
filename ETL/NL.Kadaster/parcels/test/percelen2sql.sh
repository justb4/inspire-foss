#!/bin/sh

INSERT_SQL_FILE=test-insert.sql
/bin/rm -f $INSERT_SQL_FILE

echo "-- TEST DATA FOR PARCELS " >> $INSERT_SQL_FILE
# xsltproc ../percelen2cp.xsl percelen.gml >> $INSERT_SQL_FILE
xsltproc ../percelen2cp.xsl percelen-nh.gml >> $INSERT_SQL_FILE
