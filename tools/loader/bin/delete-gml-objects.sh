#!/bin/sh
#
# Util to clear gml_objects table
#
echo "DELETE FROM gml_objects;" | psql -a -U kadmin -d inspire_blob
