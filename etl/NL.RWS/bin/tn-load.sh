#!/bin/bash
#
# Loads Dutch TN data into PostGIS using deegree3 FSLoader
#
# Author: Just van den Broecke
#
MYPWD=$PWD

SETTINGS_SCRIPT="settings-`hostname`.sh"
. $SETTINGS_SCRIPT

DATA_ROOT_DIR=$GEODATA_HOME/NWB/nwb_rws
DATA_RESULT_DIR=$DATA_ROOT_DIR/transformed

# FEATURE_TYPES="nwb_wegvakken nwb_hectopunten"
FEATURE_TYPES="nwb_wegvakken"

# Load each GML spatial dataset file
for FEATURE_TYPE in $FEATURE_TYPES; do
    echo "Loading TN_${FEATURE_TYPE}.gml ..."
    $LOADER_SCRIPT $LOADER_ARGS $DATA_RESULT_DIR/TN_${FEATURE_TYPE}.gml
done

cd $MYPWD
