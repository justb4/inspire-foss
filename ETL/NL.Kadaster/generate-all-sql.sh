#!/bin/bash

# Create all PostGIS DB+tables anew
cd ../../db
# ./create-all.sh
cd -

# ADRESSEN
# BAG use test data for now (later also all data)
# echo "INSERT BAG Test Data"
# INSERT_BAG_SQL_FILE=bag/test/test-insert.sql
# PSQL="psql -a -U kadmin -d inspire -f "
# $PSQL $INSERT_BAG_SQL_FILE

echo "IMPORT BAG Data"
cd bag
# ./allbag2ad.sh
cd -

# PERCELEN
echo "IMPORT BRK Data"
cd percelen

# convert BRK percelen ESRI shape to GML
# ./percelen-shp2gml.sh

# convert BRK percelen GML to INSPIRE PostGIS table data
# do not create DB
./percelen-gml2cp.sh

