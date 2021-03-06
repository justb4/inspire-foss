.. _design-services:


*************************
Design - Network Services
*************************

The concepts and architecture introduced in the previous chapters will be expanded below
for the Network Services (WFS/WMS/CSW) components. In most cases
this invloves mainly the configuration of various standard FOSS components, in particular
deegree and GeoServer, plus the setup of various databases, mainly PostGIS.


deegree WFS/WMS Setup
---------------------

With the start of version 3, setting up a WFS/WMS with `deegree <http://deegree.org>`_ for INSPIRE
has become extermely easy. This due to enhancements since version 2:

#. the use of a `Maven <http://maven.org>`_ build system for assembling a deployable deegree.war file
   with a custom configuration. There is no need for example to sownload deegree explicitly, since
   dependent lirbaries are all downloaded implicitly via Maven.

#. built-in support for custom complex XSD schemas. Support for INSPIRE Themes is now mainly a matter
   of dropping INSPIRE XSD files for each data theme in a deegree configuration (workspace) directory.

#. built-in FeatureStore database schema and table creation. Through the deegree webapp UI a PostGIS schema and
   tables with can be created. This FeatureStore database will support all Feature Types as
   configured in item 2 (dropping XSD files).

#. easy of publication via WFS-T or FSLoader. This has been discussed extensively in the previous chapter on ETL.

#. WMS SLD pre-configured. Although this is still work in progress, the support for WMS based
   on a deegree WFS is facilitated by the availability of Styled Layer Descriptor (SLD) files
   that encode the INSPIRE rules for WMS Layer naming and portrayal.

The entire build/configuration
setup can be found in SVN under
`webapps/deegree3 <http://code.google.com/p/inspire-foss/source/browse/#svn%2Ftrunk%2Fwebapps%2Fdeegree3>`_.

PostGIS Database Setup
----------------------

Currently a simple table configuration is generated by deegree to store INSPIRE (complex feature) GML.
The structure is depicted in the Entity-Relationship Diagram in Figure 11.

.. figure:: _static/services-design-postgis.png
     :align: center
     :width: 280 px

     *Figure 11 - Services - PostGIS Feature Store E/R Diagram*

These two tables ``feature_types`` and ``gml_objects``
represent the entire database model for all INSPIRE and ESDIN ExM themes! The model used here is what is called a
*BLOB Store*. Within the table ``gml_objects`` each row comprises a single INSPIRE GML feature.
Within the table ``feature_types`` each row represents a single feature type from
an INSPIRE or ExM theme. The relationship between the two tables is basically a normalization
where each feature type is identified with a unique integer id, used as a foreign key (FK) from
``gml_objects`` on ``feature_types``. A brief summary of the different tables and their columns follows.


Table feature_types
^^^^^^^^^^^^^^^^^^^
Basically a lookup-table for all feature types. Row-content is generated from
the XSD files stored in the deegree configuration workspace. One row per feature type.

* ``id`` - the unique (internal) key of the feature type, auto-generated

* ``qname`` - qualified name, for example ``{urn:x-inspire:specification:gmlas:CadastralParcels:3.0}CadastralParcel``

* ``geometry`` - the enclosing geometry of all features (currently unused)

Table gml_objects
^^^^^^^^^^^^^^^^^
The table where GML objects are stored.

* ``id`` - the unique (internal) key of the GML object, auto-generated

* ``gml_id`` - the unique GML id of the feature, constructed from the ``inspireId`` (as ``namespace.localId``), (index)

* ``ft_type`` - the Feature Type, integer Foreign Key on table ``feature_types``

* ``binary_object`` - feature GML element stored as text blob

* ``bbox`` - the enclosing rectangle geometry of the feature (PostGIS indexed geometry)

These tables are automatically created and ``feature_types`` is filled when following the indicated
steps using the `deegree Admin GUI <See http://wiki.deegree.org/deegreeWiki/InspireNode#EnablePostGISstorage>`_, so
there is *no need to explicitly create these tables*.

This design has the following advantages:

#. simple, reduced complexity
#. a single design can handle any INSPIRE feature type, no need for explicit tables
#. fast: no need for on-the-fly processing to assemble features
#. spatial queries directly supported through ``gml_objects.bbox``
#. integrates well with deegree's *streaming mode* where features can be directly streamed to/from their Feature Store without building an in-memory representation

This design has the following issues:

#. not optimal for ad-hoc queries like WFS Filters. This is work in-progress within deegree v3.1+, where the model can be extended e.g. with extra property/xpath indexes.


GeoServer WMS Setup
-------------------

GeoServer was already setup within the Kadaster GEORZ Lab. To setup a WMS using the ESRI Shapefiles
generated within the ETL, the files were dropped into a directory and configured using
the standard GeoServer webapp GUI.

GeoNetwork Setup
----------------

GeoNetwork was setup generically within the GEORZ Lab from the standard GeoNetwork download.
Harvesters were configured to harvest metadata from the available WMS/WFS services.






















