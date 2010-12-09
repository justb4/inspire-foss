This directory contains all ETL specific to the Protected Sites theme.


The file SIC_2_ORA_2_GML311.fmw is the FME workbench for the transformation from the original management DB to the interim GML 3.1.1 file.

This process creates the following files:
SIC_GML311.gml (here a subset the dataset)
SIC_GML311.xsd (the schema file that describe the feature)

The file SIC_3_GML311_2_GML321.xsl is the XSLT that transform the GML 3.1.1 file (SIC_GML311.gml) into the final Inspire GML file.

This process creates the file:
SIC_GML321.gml

This file is finally loaded in PostGIS.







