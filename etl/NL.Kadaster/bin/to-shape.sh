#!/bin/bash
#
# Transforms/reprojects Dutch source format (e.g. MapInfo or Shape) to ESRI Shape
#
# Author: Just van den Broecke
#

# really need this specific PROJ projection strings as most transforms from 28992 are broken
proj28992="+proj=sterea +lat_0=52.15616055555555 +lon_0=5.38763888888889 +k=0.999908 +x_0=155000 +y_0=463000 +ellps=bessel +units=m +towgs84=565.2369,50.0087,465.658,-0.406857330322398,0.350732676542563,-1.8703473836068,4.0812 +no_defs"
proj4258="+proj=longlat +ellps=GRS80 +datum=WGS84 +no_defs  <>"
geotype=MULTIPOLYGON
                               
# Transformation
function transform() {
    echo "transforming $1 to $2 with geotype=$geotype"

    # http://trac.osgeo.org/gdal/wiki/ConfigOptions
    # Otherwise we'll loose the CP1252 encoded chars
    export OGR_FORCE_ASCII=NO

    # Convert local source to Shape also transforms coordinates to INSPIRE ETRS89
    ogr2ogr -nlt $geotype -t_srs "$proj4258" -s_srs "$proj28992" -f "ESRI Shapefile" $2 $1

    echo "transforming $1 to $2 DONE"
}

# Arg parsing
# See http://www.linux.com/archive/feature/118031
while getopts t:s OPTION
do	case "$OPTION" in
	t) geotype="$OPTARG";;
	[?]) echo "Usage: $0 [-t (MULTIPOLYGON|POINT) ] sourcefile destfile"
		exit 1;;
	esac
done

shift $(($OPTIND - 1))

# Remaining args are source and dest file
transform $1 $2


