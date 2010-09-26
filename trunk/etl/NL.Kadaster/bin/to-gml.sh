#!/bin/bash
#
# Transforms Dutch local data from Shape or MapInfo  format to flat GML v2
#
# Author: Just van den Broecke
#


# Transformation
function transform() {
    proj28992="+proj=sterea +lat_0=52.15616055555555 +lon_0=5.38763888888889 +k=0.999908 +x_0=155000 +y_0=463000 +ellps=bessel +units=m +towgs84=565.2369,50.0087,465.658,-0.406857330322398,0.350732676542563,-1.8703473836068,4.0812 +no_defs"
    proj4258="+proj=longlat +ellps=GRS80 +datum=WGS84 +no_defs  <>"
    echo "transforming $1 to $2"

    # Convert to flat GML2, also transforms coordinates to INSPIRE ETRS89
    ogr2ogr -overwrite  -t_srs "$proj4258" -s_srs "$proj28992" -lco DIM=2 -nlt MULTIPOLYGON -f "GML" $2 $1

    # Dutch source is encoded in Windows LATIN1 :-( (CP1252)
    # need to make UTF-8 encoded GML and change namespace id for gml2
    cat $2 | iconv -f CP1252 -t UTF-8 | sed s/gml:/gml2:/g | sed s/:gml/:gml2/g > temp.gml
    mv temp.gml $2

    echo "transforming $1 to $2 DONE"
}

transform $1 $2

