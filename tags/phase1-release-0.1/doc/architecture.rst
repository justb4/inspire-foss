.. _architecture:


************
Architecture
************

The concept introduced in the previous chapter provides the basis for
the software architecture. The overall architecture is depicted in Figure 3 below.

.. figure:: _static/inspire-arch-global.jpg
   :width: 650 px
   :align: center

*Figure 3 - Overall Architecture*

The bottom part of Figure 3 shows the Extract Transform Load (Offline Transformation) discussed
in the Concepts chapter. The top part of this figure shows the realization of the various
OGC/INSPIRE-compliant web services (CSW, WFS and WMS). Although meta-data is not part of this project
a possible relationship with a
`GeoNetwork meta data server <http://geonetwork-opensource.org/>`_ is depicted.

The server is based on the `Apache Tomcat J2EE server <http://tomcat.apache.org/>`_. This server
provides a (J2EE) container in which application servers like GeoServer, GeoNetwork or Deegree are deployed.
For WFS we have chosen `Deegree WFS <http://www.deegree.org/>`_  since we had
a sample WFS configuration from the Norwegian Mapping Agency (Frank Arntsen).
In a later stage we will also apply `GeoServer version 2 <http://www.geoserver.org>`_.

The main development for the WFS service is through configuration files of the Deegree WFS service. This is a
3-step process:

#. declare all feature types in the file ``WEB-INF/conf/wfs/wfs_configuration.xml``
#. define each feature type schema and its mapping to PostGIS in a file ``WEB-INF/conf/wfs/featuretypes/<FeatureName>.xsd``
#. define input/output XSLT filters in ``WEB-INF/conf/wfs/xslt/``

These configuration files define the WFS and its mapping to the "INSPIRE database" in PostGIS.


Database Model
==============
The PostgreSQL/PostGIS database model closely follows the INSPIRE Annex I data theme model, i.e.
no Kadaster-specific entities/attributes are present. Figure 4 below depicts the Entity-Relationship
Diagram for the database.

.. figure:: _static/inspire-db-er.jpg
   :width: 650 px
   :align: center

*Figure 4 - PostgreSQL/PostGIS Database (UML) E/R Diagram*

The above figure shows the database structure in UML notation. All table entities are shown as classes. Relationships
between tables are 1-1 unless an explicit multiplicity is shown. Table names are prefixed with the INSPIRE
data theme abbreviation, for example "ad_*" denotes Addresses (AD). Major table attributes are
shown within the class-boxes. When an attribute has a "*" appended it denotes a foreign key
into the table present in its name, for example "ad_address_id" is a holds a key into the table
"ad_address". All tables have a unique primary key attribute called "id".

Entities (tables) and relations that are not used for mappping the Dutch address model (ad_admin_unit) are shown
in dashed notation. Unused foreign keys are shown in italic font.

The database model only shows all mandatory elements (tables/attributes). This model can be extended
with other themes. This allows reuse of common tables like GeoNames (GN, gn_* tables).

Model Transformations
=====================
The database model depicted above is an intermediate model within our combined transformation approach.
Three models are involved in transformations:

#. the local model BAG (Dutch address model) or BRK (Dutch cadastral parcels model)
#. the intermediate database model as in previous section
#. the INSPIRE Data Theme Annex I-II (GML) models like AD (Addresses) and CP (Cadastral Parcels)

The transformations will map classes/entities between these models as follows.

Addresses
---------
Dutch addresses have a relatively simple structure that is easily mapped to the INSPIRE Addresses (AD) model.
A Dutch address has the following parts, mapping as follows to the INSPIRE AD model.

For example the Dutch address ::

  Hoofdstraat 15
  1611AA Bovenkarspel

Is built up as follows:

#. Hoofdstraat: "Openbare ruimte" (usually a street name) maps to Thoroughfare
#. 15: "Huisnummer/letter/toevoeging" (usually a house number plus additions) maps to max 3 LocatorDesignators
#. 1611AA: "PostCode" (4 digits + 2 character code) maps to  PostalDescriptor.PostCode
#. Bovenkarspel: "Woonplaats" (place of living, usually a town) maps to AddressAreaName

See also the INSPIRE_DataSpecification_AD_v3.0 page 115.

The INSPIRE AD elements AdminUnit and PostalDescriptor.PostName are not used for Dutch addressing.
AdminUnits are used in The Netherlands for designating administrative areas and have three levels, for the above
address example these levels are:

#. Nederland: "Land" (Country, The Netherlands)
#. Noord-Holland: "Provincie" (Province)
#. Stede Broec: "Gemeente" (Municipality)

See also the INSPIRE_DataSpecification_AD_v3.0 page 83.


Cadastral Parcels
-----------------
For a minimal INSPIRE Cadastral Parcel theme (CP) compliance only the parcel id and polygon is required.
This is easily extracted from the Dutch Parcel data (BRK). Hence only a single DB table (cp_parcel)
is needed. Future versions may use and transform additional parcel attributes.


Coordinate Transformations
==========================
In our approach the output from the offline transformation with XSLT contains basically INSERT statements for the
intermediate database model. Since we are using `PostgreSQL/POSTGIS <http://postgis.refractions.net>`_ it is trivial to
let XSLT generate coordinate transformation statements, for example: ::

  INSERT INTO ad_address (id,valid_from,position)
   SELECT '0532200000002467','2004-10-19 10:23:54+02',
      ST_Transform(ST_GeomFromEWKT('SRID=28992;POINT(144760.0 523379.0)'), 4258)
 		WHERE NOT EXISTS (SELECT id FROM ad_address WHERE id='0532200000002467');

Here, the PostGIS function ``ST_Transform()`` will perform a transformation from the coordinate
``(144760.0 523379.0)`` in Dutch RD
(SRID=28992) to an INSPIRE-compliant coordinate in the ETRS89 projection (EPSG:4258). This transformation will be
performed during the INSERT and thus store all coordinates as ETRS89 within the database.

NB one important issue (as we painfully found out) is to have accurate projection settings within the
PostGIS configuration table ``spatial_ref_sys``. In particular since we are performing a so called
`Datum transformation <http://www.linz.govt.nz/geodetic/conversion-coordinates/geodetic-datum-conversion/index.aspx>`_
all parameters need to be set correctly. PostGIS versions before 1.4.2 may not have correct settings for
EPSG:28992. The correct value is: ::

  +proj=sterea +lat_0=52.15616055555555 +lon_0=5.38763888888889 +k=0.999908 +x_0=155000 +y_0=463000
    +ellps=bessel +units=m
      +towgs84=565.4174,50.3319,465.5542,-0.398957388243134,0.343987817378283,-1.87740163998045,4.0725 +no_defs"

In particular the ``+towgs84`` parameter specifies how to perform a Datum shift. This will make a transformation
to WGS84 correct. However for ETRS89 we still have to make another modification to the ``spatial_ref_sys`` entry for
EPSG:4258, that is to add ``+datum=WGS84`` to its definition such that it becomes : ::

  +proj=longlat +ellps=GRS80 +datum=WGS84 +no_defs

This gives correct transformation results as compared on a ETRS89 map. We need some further investigation
what the accuracy is when using WGS84 datum for transformation to ETRS89. 

.. figure:: _static/parcel-transform-fit.jpg

 *Figure 3a - Transformed Cadastral Parcels (gray)*

See also: http://lists.maptools.org/pipermail/proj/2010-March/005116.html and an elaborate
explanation: http://lists.maptools.org/pipermail/proj/2009-February/004381.html by the same author, hence here we
like to acknowledge
`Jan Hartmann <http://www.fmg.uva.nl/amidst/object.cfm?objectID=A243BCC5-FD73-47E6-A3034C21D5C43BE9>`_ for sharing
the results of his many hours of investigation.

The GML 3.2.1 Issue
===================

The INSPIRE Annex I data themes version 3 define GML Application Schemas based on GML version 3.2.1.
This version of GML is not yet supported by the Open Source WFS products like GeoServer and Deegree.
The highest version these products support is GML 3.1.1. In order to provide INSPIRE-compliant
GML 3.2.1 an XSLT input/output filter is wrapped around the WFS Deegree service.
The actual service is developed as WFS 1.1.0 using GML 3.1.1. Incoming WFS requests in GML 3.2.1 are transformed
to GML 3.1.1 and the reverse happens for the WFS response. This transformation is
specified in XSLT (see WFS configuration step 3 above). Deegree provides standard support
for input/output filters. This is depicted below in Figure 5. Although this solution is kludgy, it is
the best we can do for now until Deegree/GeoServer provides GML 3.2.1 support.

.. figure:: _static/deegree-filters.jpg
    :align: center

*Figure 5 - Deegree Input/Output Filters (from EURADIN WP7 NMCA WFS Pilot setup)*

In addition there is an issue what to use
as the container element for the Feature collection returned in the WFS response. See also
`this discussion in the INSPIRE GML/XMl forum <http://inspire-forum.jrc.ec.europa.eu/mod/groups/topicposts.php?topic=3309&group_guid=2484>`_.
Three options exist:

#. use the  SpatialDataset-element from the INSPIRE BaseTypes
#. use the (deprecated) GML 3.2.1 FeatureCollection
#. use the WFS 2.0 FeatureCollection

We will go with option 2, moving towards 3 when deploying Deegree v3. Option 1 seems to be intended
for bulk downloads, not as a container in WFS responses.






