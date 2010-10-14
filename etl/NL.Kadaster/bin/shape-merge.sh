#!/bin/bash
#
# Merges a series of shapefiles into a single shape file
#
# The first argument is the target shape file to which
# the remaining argument shapefiles are merged into.
#
# See also http://www.gdal.org/ogr/drv_shapefile.html
#
# Author: Just van den Broecke
#

echo "START Shape merge"
# get name of shapefile and feature

LAYER_NAME=`echo $1 | awk -F/ '{print $NF}' | awk -F. '{print $1}'`

TARGET_SHAPEFILE=$1
TARGET_SHAPEFILE_ROOT=`echo $1 | awk -F. '{print $1}'`

echo "Removing ${TARGET_SHAPEFILE_ROOT}.*"
/bin/rm -f "${TARGET_SHAPEFILE_ROOT}.*"

echo "Creating initial ${TARGET_SHAPEFILE} from $2"
ogr2ogr ${TARGET_SHAPEFILE} $2

# Skip first 2 arguments (we take the second as the start file)
shift 2
SHAPE_FILES=$*

# Go through all remaining shapefiles and merge
for SHAPE_FILE in ${SHAPE_FILES}; do
    # Coordinate RD to ETRS89 transform
    echo "Merging $SHAPE_FILE ..."
    ogr2ogr -update -append -f "ESRI Shapefile" ${TARGET_SHAPEFILE} ${SHAPE_FILE} -nln ${LAYER_NAME}
done


echo "END Shape merge"