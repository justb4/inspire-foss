#!/bin/bash
#
# Transforms Dutch CP data from flat GML v2 to INPSIRE GML3
#
# Author: Just van den Broecke
#

SETTINGS_SCRIPT="settings-`hostname`.sh"
. $SETTINGS_SCRIPT

cd $GEODATA_HOME/cidb/losser/perceel/transformed

TRANSFORM_SCRIPT=$INSPIRE_FOSS_HOME/etl/NL.Kadaster/CadastralParcels/local-to-inspire-cp-sd.sh

$TRANSFORM_SCRIPT parcels.gml cp-parcels.gml

ls -l *.gml
cd -

