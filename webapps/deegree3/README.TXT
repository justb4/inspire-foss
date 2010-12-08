This is a deegree v3 webapp configured for all INSPIRE Annex I themes.
PostGIS is confgigured for storage.

To use/run this webapp you will at least need to:

1) setup an "INSPIRE PostGIS DB" and
adapt the configuration contained in
src/main/webapp/WEB-INF/workspace/jdbc
Under src/main/resources are DB scripts to do this

2) have Java+Maven installed

See runnit.sh to run this webapp from the command line or just
by running Maven:

  mvn clean install tomcat:run



