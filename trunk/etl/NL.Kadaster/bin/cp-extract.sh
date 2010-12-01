#!/bin/bash
#
# Extracts Dutch CP data from MapInfo format to flat GML v2
#
# Author: Just van den Broecke
#

SETTINGS_SCRIPT="settings-`hostname`.sh"
. $SETTINGS_SCRIPT

cd $GEODATA_HOME/cidb/losser/perceel

/bin/rm -rf transformed
mkdir transformed

$TO_SHAPE_SCRIPT DKK_perceelsvlak.TAB transformed/cp_parcels.shp
$TO_GML_SCRIPT transformed/cp_parcels.shp transformed/parcels.gml

ls -l transformed
cd -
