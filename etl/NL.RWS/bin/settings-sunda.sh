#!/bin/bash
#
# Settings for host sunda (Just's Mac)
#
# Author: Just van den Broecke
#


INSPIRE_FOSS_HOME=/Users/just/project/customers/kadaster/svn/project/inspire-foss/trunk
GEODATA_HOME=/Users/just/geodata

TO_GML_SCRIPT=$INSPIRE_FOSS_HOME/etl/NL.RWS/bin/to-gml.sh
TO_SHAPE_SCRIPT=$INSPIRE_FOSS_HOME/etl/NL.Kadaster/bin/to-shape.sh
SHAPE_MERGE_SCRIPT=$INSPIRE_FOSS_HOME/etl/NL.Kadaster/bin/shape-merge.sh

LOADER_SCRIPT=$INSPIRE_FOSS_HOME/tools/loader/bin/fsloader.sh
LOADER_ARGS="inspire-postgis inspire_blob GML_32 USE_EXISTING "