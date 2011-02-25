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

# Generate the ESRI Shapefiles from the MapInfo TAB files
$TO_SHAPE_SCRIPT Ned_Burgem.TAB transformed/au_gemeenten.shp
$TO_SHAPE_SCRIPT Ned_Provincie.TAB transformed/au_provincies.shp
$TO_SHAPE_SCRIPT Nederland.TAB transformed/au_land.shp

# NB we use the simplified version of the above shapefiles
# these were reduced to 20% using http://mapshaper.org
$TO_GML_SCRIPT simplified20/au_gemeenten.shp transformed/gemeenten.gml
$TO_GML_SCRIPT simplified20/au_provincies.shp transformed/provincies.gml
$TO_GML_SCRIPT simplified20/au_land.shp transformed/land.gml

ls -l transformed
cd -
