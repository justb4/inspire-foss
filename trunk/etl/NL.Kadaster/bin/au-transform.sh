#!/bin/bash
#
# Transforms Dutch AU data from flat GML v2 to INPSIRE GML3
#
# Author: Just van den Broecke
#

SETTINGS_SCRIPT="settings-`hostname`.sh"
. $SETTINGS_SCRIPT

cd $GEODATA_HOME/cidb/losser/adminunit/transformed

TRANSFORM_SCRIPT=$INSPIRE_FOSS_HOME/etl/NL.Kadaster/AdministrativeUnits/local-to-inspire-au-sd.sh

$TRANSFORM_SCRIPT gemeenten.gml au-gemeenten.gml
$TRANSFORM_SCRIPT provincies.gml au-provincies.gml
$TRANSFORM_SCRIPT land.gml au-land.gml

ls -l *.gml
cd -

