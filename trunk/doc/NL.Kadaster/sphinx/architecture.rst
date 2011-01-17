.. _architecture:


************
Architecture
************

The concepts introduced in the previous chapter provides the basis for
the software architecture. The overall architecture is depicted in the Figure below.

.. figure:: _static/inspire-phase2-arch.png
   :align: center
   :width: 650 px

   *Figure 6 - Overall Architecture*

The above architecture is a realization of a standard `Java J2EE <http://java.sun.com/j2ee/overview.html>`_ client/server setup.
The server is based on the `Apache Tomcat J2EE server <http://tomcat.apache.org/>`_. This server
provides a standard (J2EE) container framework in which web applications (webapps) like
`deegree <http://deegree.org>`_, `GeoServer <http://geoserver.org>`_
and `GeoNetwork <http://geonetwork-opensource.org>`_ are deployed.

In addition (not shown in the Figure),
an `Apache HTTP server (httpd) <http://httpd.apache.org/>`_
handles all external web-access for static content, delegating
dynamic web services like WMS, WFS through the Apache module `mod_proxy_ajp <http://httpd.apache.org/docs/2.2/mod/mod_proxy_ajp.html>`_
to the Tomcat server.
This not only provides rich web service handling options for security (like `Shibboleth <http://shibboleth.internet2.edu/>`_) and
logging, but also standard HTTP port numbers (80, 443) and cleaner/slimmer URLs.

An overview of the different components, their functionalities and interconnections depicted
in Figure 6 is given next, starting from the bottom, basically following the flow of
(geo)data.

* **Oracle** - the local Oracle (Spatial) production database(s) that hold the (Kadaster) source data
  for cadastral parcels, administrative units, topography (`Top10NL <http://www.kadaster.nl/top10nl/>`_).

* **ETL** - the offline Extract Transform Load (ETL) processes introduced in the :ref:`Concepts` chapter. Multiple substeps
  comprise the total ETL as will be expanded below. The ETL uses various scripts (Unix Shell) and tools (GDAL/OGR and
  XSLT) to execute the ETL-processes. The final results are transformed data sets in the GML 3.2.1 format compliant
  with INSPIRE Annex I themes with coordinates in ETRS89 (EPSG:4258). These data sets are loaded
  into a PostGIS database via publication APIs (FSLoader or WFS-T) of the deegree web application.

* **deegree** - the key-component in the architecture, basically the "INSPIRE Hub". deegree supports several
  OGC (OWS) web services. Here we mainly use the deegree WFS and WMS. deegree supports various data storage technologies.
  Within the project "PostGIS" (PostgreSQL with the PostGIS spatial extension) is used.
  The other deegree APIs and tools used are
  the deegree ``FSLoader``, a client tool that allows the insertion of GML into a
  Feature Store of a deegree instance. Here data is stored into a PostGIS Feature Store.
  The ``FSLoader`` is invoked as the final step (Load) of the ETL process.
  The deegree WMS functionality is partially used, only as a proof of concept.
  A WMS is easily configured by setting up Styled Layer Descriptors (SLDs) for the
  Feature Store. It should be stressed that the deegree setup/configuration is highly
  reusable as no local (Kadaster-specific) configuration is present. See also the
  `deegree webapp setup <http://code.google.com/p/inspire-foss/source/browse/#svn%2Ftrunk%2Fwebapps%2Fdeegree3>`_.

* **GeoServer** - a very versatile framework for the publication of geo-data according
  to OGC standards. In this setup only the WMS (version 1.3) functionality is used (for reasons described elsewhere
  in this document) by means of `ESRI Shapefiles <http://en.wikipedia.org/wiki/Shapefile>`_ which are generated from
  the ETL process.

* **GeoNetwork** - a powerful (geo)metadata management framework, that supports a multitude
  of metadata formats and API services. Here, the OGC Catalogue Services for the Web (CSW) is depicted.
  Officially called "GeoNetwork opensource", it is used here to automatically harvest and store
  WMS/WFS metadata from the deegree and GeoServer components via HTTP W*S getCapabilities services.
  GeoNetwork stores its data/metadata in a
  custom database (here called MetaData but is in fact PostgreSQL). Through various services (like CSW) and
  custom GeoNetwork web application, one can Find geo-datasets and access these (Bind).
  As such deegree + GeoServer together with GeoNetwork support a geospatial Publish, Find, Bind
  scenario for geospatial datasets.

* **GeoExt Web Client** - a web-based mapping client that has been developed on the basis of
  the JavaScript web framework `GeoExt <http://geoext.org>`_. This client can be accessed at
  http://inspire.kademo.nl . In addition this client framework is used as the basis for
  the ESDIN WP11 web client. See also the Google Code project for this viewer
  at http://code.google.com/p/geoext-viewer.

In summary, data flows from local Oracle databases, through ETL processes
where source data is transformed (model+coordinates) into INSPIRE data,
published through deegree FSLoader or WFS-T and stored into a PostGIS database (and ESRI Shapefiles for WMS).
From there the INSPIRE data is served via WMS and WFS through the deegree and GeoServer (WMS only) components
and visualized in the GeoExt Viewer.  On a regular, scheduled basis GeoNetwork will
harvest metadata from the deegree and GeoServer components.

The remainder of this document will expand on the above architecture.






