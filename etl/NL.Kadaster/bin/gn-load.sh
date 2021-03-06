#!/bin/bash
#
# Loads Dutch GN data into PostGIS using deegree3 FSLoader
#
# Author: Just van den Broecke
#
# To be loaded
# FUNCTIONEEL_GEBIED_PUNT
# GEOGRAFISCH_GEBIED_PUNT
# INRICHTINGSELEMENT_PUNT
# WEGDEEL_PUNT

MYPWD=$PWD

SETTINGS_SCRIPT="settings-`hostname`.sh"
. $SETTINGS_SCRIPT

DATA_ROOT_DIR=$GEODATA_HOME/top10nl/shape/oost-nl
DATA_RESULT_DIR=$DATA_ROOT_DIR/transformed

FEATURE_TYPES="FUNCTIONEEL_GEBIED_PUNT GEOGRAFISCH_GEBIED_PUNT INRICHTINGSELEMENT_PUNT WEGDEEL_PUNT"

# Load each GML spatial dataset file
for FEATURE_TYPE in $FEATURE_TYPES; do
    echo "Loading GN_${FEATURE_TYPE}.gml ..."
    $LOADER_SCRIPT $LOADER_ARGS $DATA_RESULT_DIR/GN_${FEATURE_TYPE}.gml
done

cd $MYPWD
