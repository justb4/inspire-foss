## Introduction ##

This briefly describes how to setup and run the demo hosted at
http://inspire.kademo.nl/deegree-inspire-demo in your own environment.

## What is needed ##

  * [Java](http://java.sun.com), recent version 6 or higher
  * [Subversion](http://subversion.tigris.org/) (SVN) client latest
  * [Apache Maven](http://maven.apache.org), the build/run tool

Eclipse or any other IDE is not required, but may help as these tools are often integrated with both SVN and Maven.

## Installation ##

Install Java, SVN and Maven on your platform.

## Code checkout ##

Run the following command

`svn checkout http://inspire-foss.googlecode.com/svn/trunk inspire-foss`

This checks out all code (read only) into a newly created directory "inspire-foss".

## Run demo with Maven ##

This demo runs a web application contained in the directory

`inspire-foss/demos/deegree-inspire-demo`. We will call this dir `$WEBAPP` further below.

Do the following commands

  * `cd $WEBAPP`
  * `mvn tomcat:run`
  * browse to http://127.0.0.1/deegree-inspire-demo

The first time running Maven quite some software will be downloaded into your local Maven cache. Be patient.

The demo is self-contained, no PostGIS is needed etc (Deegree here uses memory store).

## Advanced: Extending with your own Data ##
You can even add your own data under the dir:
`$WEBAPP/src/main/webapp/WEB-INF/data`
and configuring a new source under
$WEBAPP/src/main/webapp/WEB-INF/conf/datasources/feature/inspire.xml

## Advanced: Adding WMS Layer of your data ##

You can configure a WMS for your data.

  * Define a new style in `$WEBAPP/src/main/webapp/WEB-INF/conf/styles`
  * Add a WMS layer within `$WEBAPP/src/main/webapp/WEB-INF/conf/services/wms.xml`


Note that the Viewer used in the demo is developed within another Open Source project together with Geodan (who is providing the ESDIN Demo Viewer): http://code.google.com/p/geoext-viewer