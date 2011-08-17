This dir contains the basic Proof of Concept for the transformation of
OpenStreetMap data to INSPIRE data for the data theme AdministrativeUnits.

See the ../../README.TXT for the basics of transforming OSM data to INSPIRE

You may try the steps yourself if you have the supporting tools installed: GDAL/OGR with Poostgresql support, osm2pgsql
and xsltproc.

The steps are executed through simple shell scripts that call the tools:

./get-au-xapi.sh [OPTIONAL] get OSM XML data through REST XAPI
./osm2pg.sh : store OSM data in Postgresql
./pg2ogr-gml.sh : extract data from PostgreSQL into flat OGR GML
./ogr-gml2inspire-gml.sh : convert flat OGR GML to INSPIRE GML

./validate.sh : for schema validation

files:
au-xapi-osm.xml : the raw OSM XML data (Planet file format)
au-ogr-gml.xml : the flat OGR GML file
au-inspire-gml.xml : the final result INSPIRE GML file


