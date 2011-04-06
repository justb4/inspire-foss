#!/bin/sh

# Create all PostGIS DB+tables anew
cd ../../db
./create-all.sh
cd -

./import-cp.sh
./import-ad.sh
