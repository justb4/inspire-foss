This directory contains all ETL specific to the Protected Sites theme.


The file PS_ORA_2_GML321.fmw is the FME workbench for the transformation from the original management DB to the interim GML 3.1.1 file.

This process creates a GML file with the following schema:
PS_GML311.xsd

The file PS_GML311_2_GML321.xsl is the XSLT that transform the GML 3.1.1 file into the final Inspire GML file.

This process creates the file that is available at the following url:
http://www.cartografiarl.regione.liguria.it/InspireData/PS.ProtectedSite.gml

This file is finally loaded in PostGIS using a WFS transaction.







