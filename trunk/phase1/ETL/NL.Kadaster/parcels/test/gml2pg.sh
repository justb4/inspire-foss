#!/bin/sh

# ogr2ogr -s_srs EPSG:28992 -t_srs EPSG:4258 -f "PostgreSQL" PG:"host=localhost user=inspire dbname=inspire_test password=inspire" percelen.gml -nln percelen4258

rm percelen4258.* percelen4326.*


etrs89="+proj=longlat +ellps=GRS80 +no_defs"
wgs84="+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"
rd="+proj=sterea +lat_0=52.15616055555555 +lon_0=5.38763888888889 +k=0.9999079 +x_0=155000 +y_0=463000 +ellps=bessel +towgs84=565.237,50.0087,465.658,-0.406857,0.350733,-1.87035,4.0812 +units=m +no_defs"

# definitie van Jan Hartmann:
# http://trac.osgeo.org/geotiff/ticket/22
# http://n2.nabble.com/PROJ-4-EPSG-28992-td2033665.html
# http://lists.osgeo.org/pipermail/mapserver-users/2007-February/022227.html
rd="+proj=sterea +lat_0=52.15616055555555 +lon_0=5.38763888888889 +k=0.999908 +x_0=155000 +y_0=463000 +ellps=bessel +units=m +towgs84=565.4174,50.3319,465.5542,-0.398957388243134,0.343987817378283,-1.87740163998045,4.0725 +no_defs"

 rd="EPSG:28992"
 etrs89="EPSG:4258"
 wgs84="EPSG:4326"

# ogr2ogr -overwrite  -s_srs "$rd" -t_srs "$etrs89" -f "ESRI Shapefile"  percelen4258.shp percelen.gml
ogr2ogr -overwrite  -s_srs "$rd" -t_srs "$wgs84" -f "ESRI Shapefile"  percelen4326.shp percelen.gml
ogr2ogr -overwrite  -s_srs "$wgs84" -t_srs "$etrs89" -f "ESRI Shapefile"  percelen4258.shp  percelen4326.shp
/usr/lib/postgresql/8.3/bin/shp2pgsql -d -s 4258 -D -I percelen4258.shp  percelen4258 > percelen4258.dmp

psql -a -f percelen4258.dmp -U kadmin -d inspire_test
psql -a -c "ALTER TABLE percelen4258 OWNER TO inspire" -U kadmin -d inspire_test

# ogr2ogr -overwrite -s_srs EPSG:28992 -t_srs EPSG:28992 -f "PostgreSQL" PG:"host=localhost user=inspire dbname=inspire_test password=inspire" percelen.gml -nln percelen28992
