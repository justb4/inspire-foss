.. _implementation:


**************
Implementation
**************

This chapter shows detailed aspects of the implementation.
ETL and service setup is illustrated for a single Annex I data theme Administrative Units (AU) using small sets of test data. All code
samples below are directly included from `the Google Code project SVN (phase2) <http://code.google.com/p/inspire-foss/source/browse/#svn/trunk>`_
thus refer to the actual implementation.


ETL for Administrative Units (AU)
=================================

The data for Administrative Units was delivered as `MapInfo TAB files <hhttp://en.wikipedia.org/wiki/MapInfo_TAB_format>`_.
Below we follow the ETL processing steps from source (TAB) data to the actual GML
features loaded into the PostGIS data store. All ETL source code can be
found at `SVN trunk/etl/NL.Kadaster <http://code.google.com/p/inspire-foss/source/browse/#svn%2Ftrunk%2Fetl%2FNL.Kadaster>`_.

Start ETL
---------

The shell script ``au-etl.sh`` listed below starts the entire ETL processing for Administrative Units.
It simply defers

.. literalinclude:: ../../../etl/NL.Kadaster/bin/au-etl.sh
    :language: guess
    :linenos:

``au-etl.sh`` simply defers the three ETL steps (Extract, Transform, Load) to three
Shell scripts with the same respective names.

Extract
-------

This step extracts features from the MapInfo source files and transforms
these to flat GML (Simple Features). Below the shell script ``au-extract.sh`` is listed.

.. literalinclude:: ../../../etl/NL.Kadaster/bin/au-extract.sh
    :language: guess
    :linenos:

For each administrative level a separate MapInfo file was available, hence
there are three transformations: country level (1st) , province level (2nd) and
municipality level (3rd). Note also the initialization script that sets the shell variable ``SETTINGS_SCRIPT``.
This scripts provides hostname-specific initialization settings, as the name of the script is
dependent on the hostname. Thus on the host called "kademo" the script will be called
``settings-kademo.sh`` (see next).

.. literalinclude:: ../../../etl/NL.Kadaster/bin/settings-kademo.sh
    :language: guess
    :linenos:

Each transformation is performed in two steps by two scripts ``to-shape.sh`` and ``to-gml.sh``. The reason
is some limitation within ``ogr2ogr`` that didn't allow to combine all in a single script.
The issue was that 3D coordinates would be generated which confuses some other tools.

Below is the ``to-shape.sh`` script. This converts a MapInfo file to an ESRI Shapefile, reprojecting
all cooridnates from Dutch RD (EPSG:28992) to ETRS86 (EPSG:4258).

.. literalinclude:: ../../../etl/NL.Kadaster/bin/to-shape.sh
    :language: guess
    :linenos:

Note that the projection strings (proj settings) are explicit as to always have the proper projection settings.
The next script ``to-gml.sh`` converts the intermediate Shape file to flat GML.

.. literalinclude:: ../../../etl/NL.Kadaster/bin/to-gml.sh
    :language: guess
    :linenos:

As Dutch source data is encoded in Windows LATIN1 (CP1252),
the ``to-gml.sh`` script also converts to UTF-8 encoded GML using the Unix tool ``iconv``.

The final result from the Extract-step are Simple Feature GML files like
``gemeenten.gml`` (3rd level AU) partially shown below:

.. literalinclude:: ../../../etl/NL.Kadaster/AdministrativeUnits/test/gemeente-sample-for-doc.xml
    :language: xml
    :lines: 1-50
    :linenos:

Transform
---------

In this step the simple feature GML from the Extract step is transformed into INSPIRE Data Theme GML.

This is triggered through the shell script ``au-transform.sh`` listed below.

.. literalinclude:: ../../../etl/NL.Kadaster/bin/au-transform.sh
    :language: guess
    :linenos:

The ``TRANSFORM_SCRIPT`` called ``local-to-inspire-au-sd.sh`` is structured as follows.

.. literalinclude:: ../../../etl/NL.Kadaster/AdministrativeUnits/local-to-inspire-au-sd.sh
    :language: guess
    :linenos:

The ``xslt.sh`` script calls the native XSLT processor, like ``xsltproc`` on Unix machines.
The XSLT script that is applied is ``local-to-inspire-au-sd.xsl`` and will transform
the GML to a GML 3.2.1 ``SpatialDataset``. See below.

.. literalinclude:: ../../../etl/NL.Kadaster/AdministrativeUnits/local-to-inspire-au-sd.xsl
    :language: guess
    :linenos:

The script ``local-to-inspire-au-sd.xsl`` loops through all features. For each feature the
XSLT script ``local-to-inspire-au.xsl`` is invoked implicitly (using ``xsl:apply-templates``)
and is listed next below.

.. literalinclude:: ../../../etl/NL.Kadaster/AdministrativeUnits/local-to-inspire-au.xsl
     :language: guess
     :linenos:

The XSLT script ``local-to-inspire-au.xsl`` will extract parameters for each feature and
will explicitly call the final and generic XSLT script ``AdministrativeUnits.xsl``.

.. literalinclude:: ../../../etl/NL.Kadaster/AdministrativeUnits/AdministrativeUnits.xsl
     :language: guess
     :linenos:

``AdministrativeUnits.xsl`` consists of XSLT *Callable Templates*, here just one, named
``AU.AdministrativeUnit``. Note that from within these callable templates other generic and reused XSLT templates are called
such as to generate an InspireId element or even a ``GeographicalName`` by calling on the GN
generic template ``GeographicalNames.xsl`` (included at the top-level).

In the above XSLT processing several common XSLT scripts are included and invoked as well. These deal
with constants and generic templates.

Load
----

In this step the complex feature GML from the Transform step is loaded into the deegree PostGIS database.

This is triggered through the shell script ``au-load.sh`` listed below.

.. literalinclude:: ../../../etl/NL.Kadaster/bin/au-load.sh
    :language: guess
    :linenos:

The loader script ``fsloader.sh`` resides in the `SVN tools/loader <http://code.google.com/p/inspire-foss/source/browse/#svn%2Ftrunk%2Ftools%2Floader>`_
directory and calls the deegree tools through Java as follows:

.. literalinclude:: ../../../tools/loader/bin/fsloader.sh
    :language: guess
    :linenos:


deegree WFS Configuration
=========================

This outlines how the Deegree WFS server is configured. Each feature type in a deegree
v3 WFS is implicitly supported by dropping XSD files into a deegree workspace directory.

.. literalinclude:: ../../../webapps/deegree3/src/main/webapp/WEB-INF/workspace/services/wfs.xml
    :language: xml
    :linenos:

PostGIS INSPIRE Database
========================

Below is the SQL source defining the INSPIRE database tables for all INSPIRE and ESDIN ExM themes (AU, CP, GN, HY and TN)
used in the project. This database schema has been created by the deegree WFS through the web admin GUI.

.. literalinclude:: ../../../webapps/deegree3/src/main/resources/create-tables.sql
    :language: sql
    :linenos:

