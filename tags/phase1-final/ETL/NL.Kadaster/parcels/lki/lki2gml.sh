#!/bin/bash
table=lki_vlakken
out=$5
rm -f $out
proj="+proj=sterea +lat_0=52.15616055555555 +lon_0=5.38763888888889 +k=0.999908 +x_0=155000 +y_0=463000 +ellps=bessel +units=m +towgs84=565.2369,50.0087,465.658,-0.406857330322398,0.350732676542563,-1.8703473836068,4.0812 +no_defs"

bbox="$1 $2 $3 $4"

echo "ogr2ogr: bbox=$bbox into $out"

# extract from LKI table in DB
ogr2ogr -f "GML" -a_srs "$proj" -spat $bbox $out PG:"host=localhost  user=TBS dbname=georzlab  password=TBS" $table


