#!/bin/bash


bbox="$1 $2 $3 $4"
label=$5

GML_FILE=/var/kademo/data/inspire/lki-${label}.gml
SQL_FILE=/var/kademo/data/inspire/lki-${label}.sql
rm -f $SQL_FILE $GML_FILE

./lki2gml.sh $bbox $GML_FILE
./gml2sql.sh $GML_FILE $SQL_FILE
./sql2pg.sh $SQL_FILE

