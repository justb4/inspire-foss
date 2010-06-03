.. _implementation:


**************
Implementation
**************

This chapter shows detailed aspects of the implementation for the INSPIRE Annex I data themes that were implemented,
i.e. Cadastral Parcels (CP) and Addresses (AD). We will show the steps for CP using small sets of test data. All code
samples below are directly included from the SVN repository on ``kademo.nl`` thus refer to the actual implementation.

PostGIS INSPIRE Database
========================

Below is the SQL source defining the INSPIRE database tables for all INSPIRE themes (AD, CP, GN, AU) 
used in the project. Table names are prefixed with the related INSPIRE theme abbreviation, e.g. ``gn_`` for
GeoNames.

.. literalinclude:: ../db/create-tables.sql
    :language: sql
    :linenos:

Next the ETL steps for the offline transformation are outlined.

ETL for Cadastral Parcels (CP)
==============================

The data for Cadastral Parcels was delivered as `ESRI shape files <http://en.wikipedia.org/wiki/Shapefile>`_. Our first step was to
transform ESRI shape files to GML. This was done using `GDAL/OGR <http://www.gdal.org>`_.
We illustrate all steps using test data.

This command transforms ``Perceelvlak.shp`` into GML

.. literalinclude:: ../ETL/NL.Kadaster/percelen/percelen-shp2gml.sh
    :linenos:

The result is a GML file ``percelen.gml`` partially shown below:

.. literalinclude:: ../ETL/NL.Kadaster/percelen/test/percelen.gml
    :language: xml
    :lines: 1-76
    :linenos:

Next this GML file is transformed into PostGIS SQL with this shell-command:

.. literalinclude:: ../ETL/NL.Kadaster/percelen/test/percelen2cp.sh
     :linenos:

The XSLT file ``percelen2cp.xsl`` used in this transformation is as follows.

.. literalinclude:: ../ETL/NL.Kadaster/percelen/percelen2cp.xsl
    :language: xml
    :linenos:

The SQL file resulting from the XSLT transformation, partially shown, is as follows.

.. literalinclude:: ../ETL/NL.Kadaster/percelen/test/test-insert.sql
    :language: sql
    :lines: 1-28
    :linenos:

In the last step this SQL file is simply executed using the
`Postgres psql command <http://www.postgresql.org/docs/8.4/static/app-psql.html>`_.

WFS for Cadastral Parcels (CP)
==============================

This outlines how the Deegree WFS server is configured. Each feature type in a Deegree
WFS is specified using an annotated XML (Application) Schema Definition file. Below
is the file used for Cadastral Parcels, ``DeegreeCadastralParcels.xsd``.

.. literalinclude:: ../www/webapps/deegree-wfs/WEB-INF/conf/wfs/featuretypes/DeegreeCadastralParcels.xsd
    :language: xml
    :linenos:

