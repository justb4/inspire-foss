#!/bin/sh

INSERT_ADDRESSES_SQL_FILE=addresses/test/test-insert.sql
INSERT_PARCELS_SQL_FILE=parcels/test/test-insert.sql
PSQL="psql -a -U kadmin -d inspire -f "

# Create all PostGIS DB+tables anew
cd ../../db
./create-all.sh

cd -
$PSQL $INSERT_ADDRESSES_SQL_FILE
$PSQL $INSERT_PARCELS_SQL_FILE


