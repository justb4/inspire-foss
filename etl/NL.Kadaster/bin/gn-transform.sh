#!/bin/bash
#
# Transforms Dutch GN data from flat GML v2 to INPSIRE GML3
#
# Author: Just van den Broecke
#
# To be transformed from Top10NL
# FUNCTIONEEL_GEBIED_PUNT
# GEOGRAFISCH_GEBIED_PUNT
# INRICHTINGSELEMENT_PUNT
# WEGDEEL_PUNT

MYPWD=$PWD

SETTINGS_SCRIPT="settings-`hostname`.sh"
. $SETTINGS_SCRIPT
TRANSFORM_SCRIPT=${INSPIRE_FOSS_HOME}/etl/NL.Kadaster/GeographicalNames/local-to-inspire-gn-sd.sh

# cd $GEODATA_HOME/top10nl/shape/testgebied
DATA_ROOT_DIR=$GEODATA_HOME/top10nl/shape/oost-nl
DATA_RESULT_DIR=$DATA_ROOT_DIR/transformed

FEATURE_TYPES="FUNCTIONEEL_GEBIED_PUNT GEOGRAFISCH_GEBIED_PUNT INRICHTINGSELEMENT_PUNT WEGDEEL_PUNT"

# Transform flat GML to INSPIRE GML
for FEATURE_TYPE in $FEATURE_TYPES; do
    # Shape to Simple Feature (flat) GML transform
    ${TRANSFORM_SCRIPT} $DATA_RESULT_DIR/${FEATURE_TYPE}.gml $DATA_RESULT_DIR/GN_${FEATURE_TYPE}.gml
done

ls -l $DATA_RESULT_DIR

cd $MYPWD
