#!/bin/bash
#
# Extracts Dutch HY data from Shape  format to flat GML v2
#
# Author: Just van den Broecke
#
#
# To be transformed from Top10NL
# WATERDEEL_LIJN
# WATERDEEL_VLAK
# INRICHTINGSELEMENT_LIJN

SETTINGS_SCRIPT="settings-`hostname`.sh"
. $SETTINGS_SCRIPT

. helper-functions.sh

DATA_ROOT_DIR=$GEODATA_HOME/top10nl/shape/oost-nl
DATA_RESULT_DIR=$DATA_ROOT_DIR/transformed
FEATURE_TYPES="WATERDEEL_LIJN WATERDEEL_VLAK INRICHTINGSELEMENT_LIJN INRICHTINGSELEMENT_PUNT"

# Alle kaartbladen
# 28Oost, 29West en 34Oost (het oorspronkelijke "Losser" gebied)
# BLADEN="28o 29w 34o"
BLADEN="28o 29w 34o"

# Use the generic function to do all work
./top10nl-extract.sh -f "$FEATURE_TYPES" -b "$BLADEN" -d "$DATA_RESULT_DIR"

