#!/bin/bash
#
# Transforms Dutch local data from Shape or MapInfo  format to flat GML v2
# (no reprojection as this would generate 3D coordinates)
#
# Author: Just van den Broecke
#

geotype=MULTIPOLYGON

# Transformation
function transform() {
    echo "transforming $1 to $2 ..."
    
    # http://trac.osgeo.org/gdal/wiki/ConfigOptions
    # Otherwise we'll loose the CP1252 encoded chars
    export OGR_FORCE_ASCII=NO

    # Testing out options to force axis order swapping
	# we should reverse the axis order from x,y to y,x !
	# But we need GDAL >= 1.8.0
	# see http://www.gdal.org/ogr/drv_gml.html
	# export GML_CONSIDER_EPSG_AS_URN=YES
    # export FORMAT=GML3
    # export GML3_LONGSRS=YES
    # export GML_INVERT_AXIS_ORDER_IF_LAT_LONG=NO
    # ogr2ogr -a_srs EPSG:4258 -nlt $geotype -f "GML" temp.gml $1 -dsco FORMAT=GML3
    # ogr2ogr -a_srs EPSG:4258 -nlt $geotype -f "GML" $2 temp.gml

    ogr2ogr -nlt $geotype -f "GML" $2 $1

    # Dutch source is encoded in Windows LATIN1 :-( (CP1252)
    # need to make UTF-8 encoded GML and change namespace id for gml2
    cat $2 | iconv -f CP1252 -t UTF-8 | sed s/gml:/gml2:/g | sed s/:gml/:gml2/g > temp.gml
    mv temp.gml $2

    echo "transforming $1 to $2 DONE"
}

# Arg parsing
# See http://www.linux.com/archive/feature/118031
while getopts t:s OPTION
  do
    case "$OPTION" in
     t) geotype="$OPTARG";;
    [?]) echo "Usage: $0 [-t (MULTIPOLYGON|POINT) ] sourcefile destfile"
      exit 1;;
    esac
  done

shift $(($OPTIND - 1))

# Remaining args are source and dest file
transform $1 $2

