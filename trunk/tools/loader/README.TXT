Just van den Broecke - just@justobjects.nl - added 17.sep.2010

This directory contains tools and tests for loading GML Features into
a PostGIS database.

At this moment this is done using the deegree FeatureStoreLoader (FSLoader).
The FSLoader is part of the deegree-tools package. See the deegree-tools dir
for how to download/install deegree-tools. This needs to be done first.

The main command is bin/fsloader.sh
This command takes a GML file with a SpatialDataSet and inserts features
into the DB using the DB config from the webapps/deegree2/WEB-INFO/workspace

See the test dir for how fsloader.sh can be used using test data.


