#!/bin/bash
#
# Transforms Dutch local Admin Units in MapInfo to flat GML
#
# Author: Just van den Broecke
#

# Transformation
function transform() {
    echo "transforming $1 to $2"

    # Convert MapInfo to flat GML, also transforms coordinates to INSPIRE ETRS89
    ogr2ogr -overwrite  -t_srs "EPSG:4258" -s_srs "EPSG:28992"  -lco DIM=2 -nlt MULTIPOLYGON -f "GML" $2 $1

    # Dutch source is encoded in Windows LATIN1 :-( (CP1252)
    # need to make UTF-8 encoded GML and change namespace id for gml2
    cat $2 | iconv -f CP1252 -t UTF-8 | sed s/gml:/gml2:/g | sed s/:gml/:gml2/g > temp.gml
    mv temp.gml $2

    echo "transforming $1 to $2 DONE"
}

transform ${1}.TAB $2

# transform Ned_Burgem.TAB gemeente.gml
# transform Ned_Provincie.TAB provincie.gml
# transform KDXD720_2010.TAB koppel.gml
# transform Nederland.TAB  nederland.gml
