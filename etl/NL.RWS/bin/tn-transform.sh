#!/bin/bash
#
# Transforms Dutch RWS NWB data from flat GML v2 to INSPIRE GML3
#
# Author: Just van den Broecke
#

MYPWD=$PWD

SETTINGS_SCRIPT="settings-`hostname`.sh"
. $SETTINGS_SCRIPT
TRANSFORM_SCRIPT=${INSPIRE_FOSS_HOME}/etl/NL.RWS/TransportNetworks/local-to-inspire-tn-ro-sd.sh

DATA_ROOT_DIR=$GEODATA_HOME/NWB/nwb_rws
DATA_RESULT_DIR=$DATA_ROOT_DIR/transformed

# FEATURE_TYPES="nwb_wegvakken nwb_hectopunten"
FEATURE_TYPES="nwb_wegvakken"

# Transform flat GML to INSPIRE GML
for FEATURE_TYPE in $FEATURE_TYPES; do
    # Shape to Simple Feature (flat) GML transform
    ${TRANSFORM_SCRIPT} $DATA_RESULT_DIR/${FEATURE_TYPE}.gml $DATA_RESULT_DIR/TN_${FEATURE_TYPE}.gml
done

ls -l $DATA_RESULT_DIR

cd $MYPWD
