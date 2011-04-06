This directory contains scripts for the ETL from Dutch cadastral parel data
stored in a locally specific PostGIS database called "LKI" into INSPIRE-compliant
data within the INSPIRE PostGIS database.

The conversion chain is as follows:

- extract data from local PostGIS into GML (lki2gml.sh using ogr2ogr)
- convert GML to SQL (gml2sql.sh using XSLT)
- insert SQL into target INSPIRE PostGIS DB (sql2pg.sh)

The script etl-lki.sh allows you to extract a specific area indicated
as a bbox in Dutch EPSG:28992 (RD Rijks Driehoeksmeting coordinates.

For example etl-lki-losser.sh does ETL for a 10x10 area near Losser (Gelderland)
for a cross-border project within ESDIN WP11.

