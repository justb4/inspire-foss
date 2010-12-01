#!/bin/bash
#
# Extracts from Dutch Top10NL Shape format to flat GML v2
#
# Author: Just van den Broecke
#


SETTINGS_SCRIPT="settings-`hostname`.sh"
. $SETTINGS_SCRIPT

. helper-functions.sh

DATA_RESULT_DIR=
FEATURE_TYPES=
BLADEN=

DATA_ROOT_DIR=$GEODATA_HOME/top10nl/shape/oost-nl

MYPWD=$PWD

# Arg parsing
# See http://www.linux.com/archive/feature/118031
while getopts d:f:b: OPTION
do	case "$OPTION" in
    f) FEATURE_TYPES="$OPTARG";;
    b) BLADEN="$OPTARG" ;;
    d) DATA_RESULT_DIR="$OPTARG";;
    [?]) echo "Usage: $0 -d 'DATA_RESULT_DIR' -b 'BLADEN' -f 'FEATURE_TYPES'"
        exit 1;;
    esac
done

function pre() {

	checkDir ${DATA_RESULT_DIR}
	checkVar ${BLADEN}
	checkVar ${FEATURE_TYPES}

    pr "DATA_RESULT_DIR=$DATA_RESULT_DIR"
    pr "BLADEN=$BLADEN"
    pr "FEATURE_TYPES=$FEATURE_TYPES"

    # delete previous result
    for FEATURE_TYPE in $FEATURE_TYPES; do
        # Coordinate RD to ETRS89 transform
        pr "Removing *${FEATURE_TYPE}* from  ${DATA_RESULT_DIR}"
       /bin/rm -f ${DATA_RESULT_DIR}/*${FEATURE_TYPE}.*
    done
}


function toShape() {
    # Assemble all in shape files and do coordinate transform to ETRS89
    for BLAD in $BLADEN; do
        pr "Transform ${DATA_ROOT_DIR}/${BLAD} ..."

        cd ${DATA_ROOT_DIR}/${BLAD}

        /bin/rm -rf transformed
        mkdir transformed

        # Go through all feature types in BLAD
        for FEATURE_TYPE in $FEATURE_TYPES; do
            # Coordinate RD to ETRS89 transform
            GEOMETRY_TYPE=`top10GeometryType $FEATURE_TYPE`
            $TO_SHAPE_SCRIPT -a -t ${GEOMETRY_TYPE} ${FEATURE_TYPE}.shp transformed/ETRS89_${FEATURE_TYPE}.shp
        done
    done
}

function shapeMerge() {
    # Merge all shape files for all areas (bladen)
    # Go through all "Point" feature types in BLAD
    for FEATURE_TYPE in $FEATURE_TYPES; do

        # Build list of shape files to merge
        SHAPE_FILES=
        SHAPE_FILE_NAME=ETRS89_${FEATURE_TYPE}.shp
        for BLAD in $BLADEN; do

            SHAPE_FILES="$SHAPE_FILES ${DATA_ROOT_DIR}/${BLAD}/transformed/${SHAPE_FILE_NAME}"

        done

        $SHAPE_MERGE_SCRIPT ${DATA_RESULT_DIR}/${SHAPE_FILE_NAME} $SHAPE_FILES
    done
}

function toGML() {
    # Transform shape files to flat GML
    for FEATURE_TYPE in $FEATURE_TYPES; do
        # Shape to Simple Feature (flat) GML transform
        GEOMETRY_TYPE=`top10GeometryType $FEATURE_TYPE`
        $TO_GML_SCRIPT  -t ${GEOMETRY_TYPE} $DATA_RESULT_DIR/ETRS89_${FEATURE_TYPE}.shp $DATA_RESULT_DIR/${FEATURE_TYPE}.gml
    done
}

function post() {
    ls -l $DATA_RESULT_DIR

    cd $MYPWD
    pr "ALL DONE"
}

# Do the work
pre
toShape
shapeMerge
toGML
post

