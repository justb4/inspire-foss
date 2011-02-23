#!/bin/sh
#
# Util to clear gml_objects table
#
echo "DELETE FROM gml_objects;" | psql -a -U inspire -d inspire_blob
