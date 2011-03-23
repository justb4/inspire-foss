#!/bin/bash
#
# Extracts Dutch TN (Transport Network) data from Shape  format to flat GML v2
#
# Author: Just van den Broecke
#
#

SETTINGS_SCRIPT="settings-`hostname`.sh"
. $SETTINGS_SCRIPT

DATA_ROOT_DIR=$GEODATA_HOME/NWB/nwb_rws
DATA_RESULT_DIR=$DATA_ROOT_DIR/transformed


rm -rf $DATA_RESULT_DIR
mkdir $DATA_RESULT_DIR

# Go to shapes directory
cd $DATA_ROOT_DIR

# Convert the shapes to GML
$TO_GML_SCRIPT -t MULTILINESTRING nwb_wegvakken.shp transformed/nwb_wegvakken.gml
$TO_GML_SCRIPT -t POINT nwb_hectopunten.shp transformed/nwb_hectopunten.gml

ls -l $DATA_RESULT_DIR
cd -
