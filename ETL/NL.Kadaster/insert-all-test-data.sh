#!/bin/sh

INSERT_BAG_SQL_FILE=bag/test/test-insert.sql
INSERT_PRC_SQL_FILE=percelen/test/test-insert.sql
PSQL="psql -a -U kadmin -d inspire -f "

# Create all PostGIS DB+tables anew
cd ../../db
./create-all.sh

cd -
$PSQL $INSERT_BAG_SQL_FILE
$PSQL $INSERT_PRC_SQL_FILE


