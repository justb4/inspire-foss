.. _bestpractices:

.. index:: INSPIRE, Transformation, Combined Transformation, EURADIN, ESDIN, Download Service

**************
Best Practices
**************

At this moment of writing several best practices on INSPIRE content transformation have evolved.

ESDIN WP11
==========

The "transformation issue" and various
architectural approaches have been described extensively within the ESDIN WP11 Deliverable D11.1 (ECP-2007-GEO-317008),
called *"Best Practice for Content Transformations
Enabling INSPIRE-Compliant Data Delivery"* (author Lassi Lehto et al).
Unfortunately this document is not freely available online, but below is a quote from the Executive Summary:

*"The content transformation types dealt with in this document include data model transformation and coordinate transformation, and are
discussed in the context of the INSPIRE Download Service. All relevant architectural approaches to the process of content
transformation are considered. These include transformations on the database level, between databases, carried out by a
Download Service, a cascading Download Service or a dedicated Transformation Service, or performed in a portal or client
application. The discussion includes both off-line, on-the-fly and combined transformation methods. The transformation process
is also described, with special emphasis put on the encoding of the schema mapping instructions.*

*Off-line transformation approaches seem to provide the best possible robustness and performance levels for online data delivery.
A major challenge in this approach is to keep the separate service database up-to-date. On-the-fly content transformation methods
are seen as a solution for this challenge and can be regarded as the only feasible approach in cases involving large amounts of
frequently updated content. A combined alternative for transformation includes both off-line and on-the-fly processing steps
into the workflow.*

*Various tools are available for performing content transformations. These include both commercial and open source products.
The testing carried out in the context of ESDIN project include the following products capable of data model transformations:
FME Desktop/Server, Radius Studio, GO Loader/Publisher, XtraServer and deegree. In addition transformations were carried out
based on SQL and XSLT scripting.*

*The results from the testing suggest that many of the transformation types required for achieving INSPIRE-compliancy are
too complicated or time consuming for the on-the-fly approach. Only 40% of the tests carried out were at least partially
based on on-the-fly processes. The project results so far seem to suggest that a combined solution, in which both off-line
and on-the-fly processes are utilized, is the most promising one.*

*A method that relies on the idea of maintaining various different data schemas inside a single DBMS has been identified
in the project as a new kind of solution for INSPIRE-compliant data delivery. The updates from the primary schema to
the secondary one could be based on automated database triggers, activated when modifications are done on the primary
data set. The approach can be seen as an interesting compromise between permantent data adaptation and the various
transformation-based approaches."*

EURADIN WP7
===========
Within `EURADIN WP7 <https://www.euradin.eu/Objetives2/Pages/WP7.aspx>`_ the Norwegian Mapping and Cadastre Authority (NMCA)
has defined a pilot setup for a WFS Address service. This setup is based on a `PostgreSQL/PostGIS database <http://postgis.refractions.net>`_ and a `Deegree WFS <http://deegre.org>`_
and is outlined `in this presentation (PDF) <_static/euradin-wp7-wfs-pilot.pdf>`_. 

Other Best Practices
====================
Ramage and Lovell describe INSPIRE best practices in [Ramage]_ although these seem to be tied to software products of
their company 1Spatial.

[Snowflake]_ Software advertises an `INSPIRE solution <http://www.snowflakesoftware.co.uk/markets/inspire/solution.htm>`_
using a direct (*on-the-fly*) transformation from local (Oracle) databases to INSPIRE GML through a WFS.
The mapping from the local schema to the INSPIRE schema can be defined graphically.













