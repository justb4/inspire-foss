#!/bin/bash
#
# Settings for host kademo ("german production server")
#
# Author: Just van den Broecke
#


INSPIRE_FOSS_HOME=/home/kadmin/deploy//svn/project/inspire-foss/trunk
GEODATA_HOME=/var/kademo/data/inspire/phase2

TO_GML_SCRIPT=$INSPIRE_FOSS_HOME/etl/NL.Kadaster/bin/to-gml.sh
TO_SHAPE_SCRIPT=$INSPIRE_FOSS_HOME/etl/NL.Kadaster/bin/to-shape.sh
SHAPE_MERGE_SCRIPT=$INSPIRE_FOSS_HOME/etl/NL.Kadaster/bin/shape-merge.sh

LOADER_SCRIPT=$INSPIRE_FOSS_HOME/tools/loader/bin/fsloader.sh
LOADER_ARGS="inspire-postgis inspire_blob GML_32 USE_EXISTING "