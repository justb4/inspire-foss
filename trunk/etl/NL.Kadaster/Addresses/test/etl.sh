../pg2gml.sh | nice xsltproc --maxdepth 50000 ../local-to-inspire-ad-sd.xsl -  | ../../../../tools/loader/bin/fsloader.sh  inspire-postgis inspire_blob GML_32 USE_EXISTING /dev/stdin

