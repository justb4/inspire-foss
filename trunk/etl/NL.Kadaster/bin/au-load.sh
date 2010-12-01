#!/bin/bash
#
# Loads Dutch AU data into PostGIS using deegree3 FSLoader
#
# Author: Just van den Broecke
#

SETTINGS_SCRIPT="settings-`hostname`.sh"
. $SETTINGS_SCRIPT

cd $GEODATA_HOME/cidb/losser/adminunit/transformed

$LOADER_SCRIPT $LOADER_ARGS au-gemeenten.gml
$LOADER_SCRIPT $LOADER_ARGS au-provincies.gml
$LOADER_SCRIPT $LOADER_ARGS au-land.gml

cd -
