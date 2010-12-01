#!/bin/bash
#
# Extracts Dutch TN (Transport Network) data from Shape  format to flat GML v2
#
# Author: Just van den Broecke
#
#
# To be transformed from Top10NL
# WEGDEEL_PUNT WEGDEEL_LIJN WEGDEEL_VLAK SPOORBAANDEEL_LIJN



SETTINGS_SCRIPT="settings-`hostname`.sh"
. $SETTINGS_SCRIPT

# cd $GEODATA_HOME/top10nl/shape/testgebied
DATA_ROOT_DIR=$GEODATA_HOME/top10nl/shape/oost-nl
DATA_RESULT_DIR=$DATA_ROOT_DIR/transformed
FEATURE_TYPES="WEGDEEL_PUNT WEGDEEL_LIJN WEGDEEL_VLAK"

# Alle kaartbladen
# 28Oost, 29West en 34Oost (het oorspronkelijke "Losser" gebied)
BLADEN="28o 29w 34o"

# Use the generic function to do all work
./top10nl-extract.sh -f "$FEATURE_TYPES" -b "$BLADEN" -d "$DATA_RESULT_DIR"

