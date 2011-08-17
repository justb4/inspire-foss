This directory contains all ETL specific to transform OpenStreetMap data to INSPIRE.

contact: Just van den Broecke  - www.justobjects.nl

Each directory with a Theme name contains the ETL (mainly XSL) scripts for that theme.
Subdirs <theme>/test contain specific test-data/scripts


Documentation is being worked upon, in short the ETL here works as follows:

The ETL steps

1. get raw OSM XML dataset
2. store OSM data in Postgres DB
3. Extract data from DB as (OGR) Simple Feature GML
4. convert (OGR) Simple Feature GML to INSPIRE GML 3.2.1
5. publish INSPIRE GML 3.2.1 data to WFS server

The tools used in each step are:
Step 1 via OSM REST XAPI or downloading OSM "Planet" files
Step 2 with osm2pgsql tool (http://wiki.openstreetmap.org/wiki/Osm2pgsql)
Step 3 with GDAL/OGR ogr2ogr tool (www.gdal.org)
Step 4 is model transform via XSLT
Step 5 is deegree FSLoader or WFS-T or copy to dir (memory store)

The XSLT (etl/OSM/*/*.xsl) (Step 4) has two phases/steps:
a- parsing/extracting from OGR Simple Feature GML
b- INSPIRE GML 3.2.1 generation

a- is specific to the local Simple Feature GML but step b- is (becoming) generic.
Step b- works through XSLT callable templates (like regular functions).
These templates are parametrized, e.g. passing an INSPIRE ID or some other property values.

Under etl/OSM/* all XSLT used for step a- starts with local-*,
all XSLT for step b- is named after the Data Theme.

For example etl/OSM/AdministrativeUnits contains local-to-inspire-au-sd.xsl
and local-to-inspire-au.xsl for step a- (generate SpatialDataSet).
Within local-to-inspire-au.xsl step b- is invoked by calling AdministrativeUnits.xsl, See (a-)
http://code.google.com/p/inspire-foss/source/browse/trunk/etl/OSM/AdministrativeUnits/local-to-inspire-au.xsl
and (b-):
http://code.google.com/p/inspire-foss/source/browse/trunk/etl/OSM/AdministrativeUnits/AdministrativeUnits.xsl

In addition a lot of reuse is made for common elements like Inspire ID,
Country Coding but also cross theme elements like GeograpicalNames (see e.g. Administractive Units).

The only tricky thing now is the transformation from Simple feature GML 2 or 3.1.1 geometry
to 3.2.1 geometry. This is done by importing generic XSLT for all themes from
http://code.google.com/p/inspire-foss/source/browse/#svn/trunk/etl/OSM/xsl

Reuse of XSLT over themes which speeds up the ETL configuration considerably (from days to hours per theme).

Under etl/OSM/<Theme>/test is testcode/scripts/data for validation (see tools/validation) and loading.

Under etl/OSM/bin are all scripts to invoke ETL. At the highest level, simply the command
"etl.sh" will invoke all ETL for all local datasets.

As said there is still some work needed to make these XSLT generic over Countries/Data Providers
but there is a direction now. Documentation will appear under trunk/doc/OSM and published
 to http://inspire.kademo.nl
