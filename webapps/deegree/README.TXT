10.january.2013 - Just van den Broecke

This directory contains all that is needed to run INSPIRE WFS/WMS services with
the deegree framework (www.deegree.org).

Starting with the 3.1 branch of deegree development the service web app and its configuration
(called "workspaces") have been modularized. By default the service webapp (.war)
does not have a configuration embedded but looks by default in the HOME directory $HOME/.deegree
for workspaces.

Below there are  2 subdirs:

esdin, the original webapp from the ESDIN project (see below)
pdok, the INSPIRE workspace for the Dutch PDOK project (deegree 3.2+)

ESDIN Specifics
---------------
- esdin/webapp - contains for now instructions how to download and run the deegree 3.1+ .war file
- esdin/workspace - the workspace of the inspire-foss deegree server, adapt for your local situation

installing the workspace (ESDIN)

1) mkdir $HOME/.deegree
link (or copy) esdin/workspace/src/main/workspace dir to $HOME/.deegree/default

2) altenative:
build workspace with mvn clean install
import the workspace in deegree

install/run deegree (ESDIN)
---------------------------
This requires getting the webapp archive (WAR) and run it in your appserver like Tomcat.

cd esdin/webapp
execute ./get-deegree-war.sh or get wardirectly from repository
deploy deegree3.war in Tomcat

OR run the webapp with Maven

cd esdin/webapp
mvn clean package tomcat:run










