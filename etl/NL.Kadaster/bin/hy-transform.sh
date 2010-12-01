#!/bin/bash
#
# Transforms Dutch HY data from flat GML v2 to INSPIRE GML3
#
# Author: Just van den Broecke
#
# To be transformed from Top10NL
# WATERDEEL_LIJN
# WATERDEEL_VLAK
# INRICHTINGSELEMENT_LIJN

MYPWD=$PWD

SETTINGS_SCRIPT="settings-`hostname`.sh"
. $SETTINGS_SCRIPT
TRANSFORM_SCRIPT=${INSPIRE_FOSS_HOME}/etl/NL.Kadaster/Hydrography/local-to-inspire-hy-sd.sh

# cd $GEODATA_HOME/top10nl/shape/testgebied
DATA_ROOT_DIR=$GEODATA_HOME/top10nl/shape/oost-nl
DATA_RESULT_DIR=$DATA_ROOT_DIR/transformed

FEATURE_TYPES="WATERDEEL_LIJN WATERDEEL_VLAK INRICHTINGSELEMENT_LIJN INRICHTINGSELEMENT_PUNT"

# Transform flat GML to INSPIRE GML
for FEATURE_TYPE in $FEATURE_TYPES; do
    # Shape to Simple Feature (flat) GML transform
    ${TRANSFORM_SCRIPT} $DATA_RESULT_DIR/${FEATURE_TYPE}.gml $DATA_RESULT_DIR/HY_${FEATURE_TYPE}.gml
done

ls -l $DATA_RESULT_DIR

cd $MYPWD
