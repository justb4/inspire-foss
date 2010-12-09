This directory contains the Extract Transfer Load (ETL) implementations specific to each
EU country/NMA within subdirectories.  At some point we may share common transformation scripts
like XSL callable templates.

Typical ETL processes here have three steps:

1. extract source data from any format (Shape, GML, MapInfo, Local DB, ..)
2. transforms to INSPIRE GML (e.g. using XSLT)
3. Load.: typically executed using the tools/loader or WFS-T





