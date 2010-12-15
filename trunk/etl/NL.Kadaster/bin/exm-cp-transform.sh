#!/bin/bash
#
# Transforms INSPIRE Annex I CP GML to ESDIN ExM CP GML
#
# Author: Just van den Broecke
#

SETTINGS_SCRIPT="settings-`hostname`.sh"
. $SETTINGS_SCRIPT

cd $GEODATA_HOME/cidb/losser/perceel/transformed

TRANSFORM_SCRIPT=$INSPIRE_FOSS_HOME/etl/NL.Kadaster/ExM/inspire-cp-to-exm-cp.sh

$TRANSFORM_SCRIPT cp-parcels.gml exm-cp-parcels.gml

ls -l *.gml
cd -

