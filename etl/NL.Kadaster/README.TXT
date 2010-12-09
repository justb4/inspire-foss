This directory contains all ETL specific to Dutch Kadaster.

contact: Just van den Broecke  - www.justobjects.nl

Each directory with a Theme name contains the ETL (mainly XSL) scripts for that theme.
Subdirs <theme>/test contain specific test-data/scripts

/bin contains all (shell) scripts for ETL
/xsl contains common XSLT scripts

Documentation is being worked upon, in short the ETL here works as follows:

3 ETL steps

Simple Features DB -1->
   Simple Feature GML -2->
     INSPIRE GML 3.2.1 -3->
        PostGIS or memory store

Step 1 is through GDAL/OGR (or FME) and includes coordinate transform
Step 2 is model transform via XSLT
Step 3 is deegree FSLoader or WFS-T or copy to dir (memory store)

The XSLT (etl/NL.Kadaster/*/*.xsl) has two phases/steps:
a- parsing/extracting from Simple Feature GML
b- INSPIRE GML 3.2.1 generation

a- is specific to the local Simple Feature GML but step b- is (becoming) generic.
Step b- works through XSLT callable templates (like regular functions).
These templates are parametrized, e.g. passing an INSPIRE ID or some other property values.

Under etl/NL.Kadaster/* all XSLT used for step a- starts with local-*,
all XSLT for step b- is named after the Data Theme.

For example etl/NL.Kadaster/CadastralParcels contains local-to-inspire-cp-sd.xsl
and local-to-inspire-cp.xsl for step a- (generate SpatialDataSet).
Within local-to-inspire-cp.xsl step b- is invoked by calling CadastralParcels.xsl, See (a-)
http://code.google.com/p/inspire-foss/source/browse/trunk/etl/NL.Kadaster/CadastralParcels/local-to-inspire-cp.xsl
and (b-):
http://code.google.com/p/inspire-foss/source/browse/trunk/etl/NL.Kadaster/CadastralParcels/CadastralParcels.xsl

In addition a lot of reuse is made for common elements like Inspire ID,
Country Coding but also cross theme elements like GeograpicalNames (see e.g. Administractive Units).

The only tricky thing now is the transformation from Simple feature GML 2 or 3.1.1 geometry
to 3.2.1 geometry. This is done by importing generic XSLT for all themes from
http://code.google.com/p/inspire-foss/source/browse/#svn/trunk/etl/NL.Kadaster/xsl

Reuse of XSLT over themes which speeds up the ETL configuration considerably (from days to hours per theme).

Under etl/NL.Kadaster/<Theme>/test is testcode/scripts/data for validation (see tools/validation) and loading.

Under etl/NL.Kadaster/bin are all scripts to invoke ETL. At the highest level, simply the command
"etl.sh" will invoke all ETL for all local datasets.

As said there is still some work needed to make these XSLT generic over Countries/Data Providers
but there is a direction now. Documentation will appear under trunk/doc/NL.Kadaster and published
to http://inspire.kademo.nl 
