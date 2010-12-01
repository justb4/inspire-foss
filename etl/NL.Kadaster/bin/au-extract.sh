#!/bin/bash
#
# Extracts Dutch AU data from MapInfo  format to flat GML v2
#
# Author: Just van den Broecke
#

SETTINGS_SCRIPT="settings-`hostname`.sh"
. $SETTINGS_SCRIPT

cd $GEODATA_HOME/cidb/losser/adminunit

rm -rf transformed
mkdir transformed


$TO_SHAPE_SCRIPT Ned_Burgem.TAB transformed/au_gemeenten.shp
$TO_GML_SCRIPT transformed/au_gemeenten.shp transformed/gemeenten.gml

$TO_SHAPE_SCRIPT Ned_Provincie.TAB transformed/au_provincies.shp
$TO_GML_SCRIPT transformed/au_provincies.shp transformed/provincies.gml

$TO_SHAPE_SCRIPT Nederland.TAB transformed/au_land.shp
$TO_GML_SCRIPT transformed/au_land.shp transformed/land.gml

ls -l transformed
cd -
