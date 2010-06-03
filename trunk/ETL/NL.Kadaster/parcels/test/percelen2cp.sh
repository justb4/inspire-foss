#!/bin/sh

INSERT_SQL_FILE=test-insert.sql
/bin/rm -f $INSERT_SQL_FILE

echo "-- TEST DATA FOR PARCELS " >> $INSERT_SQL_FILE
xsltproc ../percelen2cp.xsl percelen.gml >> $INSERT_SQL_FILE

# Create all PostGIS DB+tables anew
cd ../../../../db
# ./create-all.sh
cd -


psql -a -c "TRUNCATE TABLE cp_parcel" -U kadmin -d inspire
psql -a -U kadmin -d inspire -f $INSERT_SQL_FILE
psql -a -c "ALTER TABLE cp_parcel OWNER TO inspire" -U kadmin -d inspire

