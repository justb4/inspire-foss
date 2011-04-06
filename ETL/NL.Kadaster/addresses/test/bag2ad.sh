#!/bin/sh

INSERT_SQL_FILE=test-insert.sql
/bin/rm -f $INSERT_SQL_FILE

echo "-- TEST DATA FOR BAG " >> $INSERT_SQL_FILE
xsltproc ../bag2ad.xsl verblijfsobject.xml >> $INSERT_SQL_FILE
xsltproc ../bag2ad.xsl ligplaats.xml >> $INSERT_SQL_FILE
xsltproc ../bag2ad.xsl standplaats.xml >> $INSERT_SQL_FILE
xsltproc ../bag2ad.xsl woonplaats.xml >> $INSERT_SQL_FILE
xsltproc ../bag2ad.xsl openbareruimte.xml >> $INSERT_SQL_FILE
xsltproc ../bag2ad.xsl nummeraanduiding.xml >> $INSERT_SQL_FILE

# Create all PostGIS DB+tables anew
cd ../../../../db
./create-all.sh

cd -
psql -a -U kadmin -d inspire -f $INSERT_SQL_FILE

