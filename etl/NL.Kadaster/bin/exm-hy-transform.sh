#!/bin/bash
#
# Transforms Dutch HY INSPIRE GML3 to ExM HY
#
# Author: Just van den Broecke
#
# To be transformed from HY INSPIRE GML3
# WATERDEEL_LIJN
# WATERDEEL_VLAK
# INRICHTINGSELEMENT_LIJN
# INRICHTINGSELEMENT_PUNT (Locks)

MYPWD=$PWD

SETTINGS_SCRIPT="settings-`hostname`.sh"
. $SETTINGS_SCRIPT
TRANSFORM_SCRIPT=${INSPIRE_FOSS_HOME}/etl/NL.Kadaster/ExM/inspire-hy-to-exm-hy.sh

# cd $GEODATA_HOME/top10nl/shape/testgebied
DATA_ROOT_DIR=$GEODATA_HOME/top10nl/shape/oost-nl
DATA_RESULT_DIR=$DATA_ROOT_DIR/transformed

FEATURE_TYPES="INRICHTINGSELEMENT_PUNT INRICHTINGSELEMENT_LIJN WATERDEEL_LIJN WATERDEEL_VLAK"

# Transform flat GML to INSPIRE GML
for FEATURE_TYPE in $FEATURE_TYPES; do
    # Shape to Simple Feature (flat) GML transform
    ${TRANSFORM_SCRIPT} $DATA_RESULT_DIR/HY_${FEATURE_TYPE}.gml $DATA_RESULT_DIR/ExM_HY_${FEATURE_TYPE}.gml
done

ls -l $DATA_RESULT_DIR

cd $MYPWD
