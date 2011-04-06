.. _concepts:


********
Concepts
********

This chapter describes the Dutch Kadaster core approach to the main issues of transformations:

#. data model transformation from Dutch national formats to INSPIRE themes
#. coordinate transformation from Dutch RD (EPSG:28992) to ETRS89 (EPSG:4258)

The approach of Combined Transformation as defined within ESDIN WP11 has been taken.  Details are
outlined below. This approach is further elaborated into a software architecture described in the next chapter.

Combined Transformation using an INSPIRE-theme database model
=============================================================

Our approach applies the *Combined Transformation* as defined within ESDIN WP11 as the basis. This implies a combination
of *offline transformation* into an intermediate data format, followed by an *on-the-fly transformation* into
the INSPIRE data theme format. This is depicted below.

.. figure:: _static/combined-trans-concept.jpg
   :width: 500 px
   :align: center

*Figure 1 - Combined Transformation*

Figure 1 shows Combined Transformation as applied within our project. The arrows denote the flow of data
from local sources (left) up to INSPIRE-compliant data coming out of a WFS. The circles denote processing steps. The database
symbols depict data(base) storage.

On the left in Figure 1 we have data stored in local databases. Within the Dutch Kadaster data resides in Oracle according to
local database models. The first (offline) transformation step is called ETL (`Extract Transform Load <http://en.wikipedia.org/wiki/Extract,_transform,_load>`_). As a result of this step
data is stored within a separate database that we will call here an "INSPIRE-database". For this "INSPIRE-database" we defined data models directly
based on the INSPIRE Annex I-III data models. The ETL process used in the offline transformation is realized as follows:

* Extract: data is extracted/exported from the database into XML
* Transform: XML data is transformed with XSLT into INSERT/UPDATE statements for the "INSPIRE-database"
* Load: the resulting INSERT statements are executed

As a result of the offline ETL step we have data within the INSPIRE database. Note that since we use
a spatial database, the ETL-step also provides the reprojection from Dutch RD (EPSG:28992) to ETRS89 (EPSG:4258)
through the generation of reprojection functions within the INSERT statements.

The last (on-the-fly) transformation takes place within an application server (Deegree or GeoServer2) supplying a WFS. This
WFS is configured to transform data from the "INSPIRE-database" to the INSPIRE Annex I-II Application Schema data.
We have based our WFS on the `PostGIS/Deegree pilot approach <_static/euradin-wp7-wfs-pilot.pdf>`_  by the Norwegian Mapping and Cadastre Authority (NMCA)
within EURADIN WP7.

Figure 2 below depicts all steps in detail with Deegree as the WFS.

.. figure:: _static/combined-trans-concept-exp.jpg
   :width: 650 px
   :align: center

*Figure 2 - Combined Transformation - Expanded View*

The above sketches the basic concept. This will be further elaborated within the next chapter on architecture.

Pros and Cons
=============

We think that the advantages of Combined Transformation outweigh the disadvantages. This is listed
belows as Pros and Cons.

Pros
----

* transformation problem has been reduced into two manageable sub-problems
* have a single integrated/clean/understandable INSPIRE-theme database model
* reusable setup, also for other National Mapping Agencies (NMAs)
* only the offline transformation to the database model is locally (NMA)-specific
* database provides reuse for common themes such as GeoNames (GN) and Administrative Units (AU)
* provide for *cross-theme relationships* through foreign keys, such as Addresses (AD) referencing Cadastral Parcels (CP)
* optimized for performance (e.g. no on-the-fly reprojections)
* easy to work with reusable test data
* local datasets that were locally separate like Dutch BAG (Addresses) and BRK (Cadastral Parcels) can now be integrated

Cons
----
* keeping local data in sync with INSPIRE-theme database is a problem
* how to transform only the local data that has changed (requires mutation information)












