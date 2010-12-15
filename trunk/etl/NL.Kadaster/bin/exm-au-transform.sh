#!/bin/bash
#
# Transforms INSPIRE Annex I CP GML to ESDIN ExM CP GML
#
# Author: Just van den Broecke
#

SETTINGS_SCRIPT="settings-`hostname`.sh"
. $SETTINGS_SCRIPT

cd $GEODATA_HOME/cidb/losser/adminunit/transformed

TRANSFORM_SCRIPT=$INSPIRE_FOSS_HOME/etl/NL.Kadaster/ExM/inspire-au-to-exm-au.sh

$TRANSFORM_SCRIPT au-gemeenten.gml exm-au-gemeenten.gml
$TRANSFORM_SCRIPT au-provincies.gml exm-au-provincies.gml
$TRANSFORM_SCRIPT au-land.gml exm-au-land.gml

ls -l *.gml
cd -
