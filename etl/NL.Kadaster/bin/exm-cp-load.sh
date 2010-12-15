#!/bin/bash
#
# Loads Dutch ESDIN ExM CP data into PostGIS using deegree3 FSLoader
#
# Author: Just van den Broecke
#

SETTINGS_SCRIPT="settings-`hostname`.sh"
. $SETTINGS_SCRIPT

cd $GEODATA_HOME/cidb/losser/perceel/transformed

$LOADER_SCRIPT $LOADER_ARGS exm-cp-parcels.gml

cd -
