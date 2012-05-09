#!/bin/sh
# Full ETL
# Source: PostGIS DB with BAG NLExtract version
# Destination: deegree INSPIRE DB

PG2GML=../pg2gml.sh
BAG_GML2INSPIRE_GML="nice xsltproc --maxdepth 50000 ../local-to-inspire-ad-sd.xsl - "
FS_LOAD="../../../../tools/loader/bin/fsloader.sh  inspire-postgis inspire_blob GML_32 USE_EXISTING /dev/stdin"

FEATURE_TYPES="openbareruimte  woonplaats postcode verblijfsobject ligplaats standplaats"

# delete previous result
for FEATURE_TYPE in $FEATURE_TYPES; do
  # Do full etl in single stream
  $PG2GML $FEATURE_TYPE | $BAG_GML2INSPIRE_GML | $FS_LOAD
done

