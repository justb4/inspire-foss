#!/bin/bash
#
# Transforms Dutch TN data from flat GML v2 to INSPIRE GML3
#
# Author: Just van den Broecke
#
# To be transformed from Top10NL
# WEGDEEL_LIJN
# WEGDEEL_VLAK
# WEGDEEL_PUNT

MYPWD=$PWD

SETTINGS_SCRIPT="settings-`hostname`.sh"
. $SETTINGS_SCRIPT
TRANSFORM_SCRIPT=${INSPIRE_FOSS_HOME}/etl/NL.Kadaster/TransportNetworks/local-to-inspire-tn-ro-sd.sh

# cd $GEODATA_HOME/top10nl/shape/testgebied
DATA_ROOT_DIR=$GEODATA_HOME/top10nl/shape/oost-nl
DATA_RESULT_DIR=$DATA_ROOT_DIR/transformed

FEATURE_TYPES="WEGDEEL_PUNT WEGDEEL_LIJN WEGDEEL_VLAK"

# Transform flat GML to INSPIRE GML
for FEATURE_TYPE in $FEATURE_TYPES; do
    # Shape to Simple Feature (flat) GML transform
    ${TRANSFORM_SCRIPT} $DATA_RESULT_DIR/${FEATURE_TYPE}.gml $DATA_RESULT_DIR/TN_${FEATURE_TYPE}.gml
done

ls -l $DATA_RESULT_DIR

cd $MYPWD
