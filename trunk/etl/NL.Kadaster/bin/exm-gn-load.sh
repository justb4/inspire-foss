#!/bin/bash
#
# Loads Dutch ESDIN ExM CP data into PostGIS using deegree3 FSLoader
#
# Author: Just van den Broecke
#

SETTINGS_SCRIPT="settings-`hostname`.sh"
. $SETTINGS_SCRIPT

DATA_ROOT_DIR=$GEODATA_HOME/top10nl/shape/oost-nl
DATA_RESULT_DIR=$DATA_ROOT_DIR/transformed

FEATURE_TYPES="FUNCTIONEEL_GEBIED_PUNT GEOGRAFISCH_GEBIED_PUNT INRICHTINGSELEMENT_PUNT WEGDEEL_PUNT"

# Load each GML spatial dataset file
for FEATURE_TYPE in $FEATURE_TYPES; do
    echo "Loading ExM_GN_${FEATURE_TYPE}.gml ..."
    $LOADER_SCRIPT $LOADER_ARGS $DATA_RESULT_DIR/ExM_GN_${FEATURE_TYPE}.gml
done

cd $MYPWD

