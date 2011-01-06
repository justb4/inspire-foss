.. _concepts:


********
Concepts
********

This chapter describes the core concepts and approaches to the functional requirements
listed in the :ref:`Requirements` and builds further on the :ref:`bestpractices` section.
Emphasis is on Content Transformation and Download Services via WFS. These concepts will lead towards a
software architecture described in the :ref:`Architecture` section.

Core Concept : ETL + INSPIRE Node
=================================

The integrated combination of two process components realizes the entire chain of Content Transformation and
INSPIRE Download/View Services:

1. an ETL (Extract Transform Load) process that

  * Extracts data from a local source database
  * Transforms this data to INSPIRE Data theme GML
  * Loads (publishes) the INSPIRE Data theme GML into an "INSPIRE Node"

2. the "INSPIRE Node" process, basically a WFS/WMS that allows for

  * publication of INSPIRE Data theme GML (e.g. via WFS-T)
  * storage of INSPIRE Data theme GML (e.g. using PostGIS or Oracle Spatial)
  * download of INSPIRE Data theme GML via WFS
  * viewing of INSPIRE Data theme GML via WMS (optional)

This is illustrated in Figure 4 below, using `deegree <http://deegree.org>`_ as the
"INSPIRE Node".

.. figure:: _static/deegree3-inspire-etl.png
   :align: center

   *Figure 4 - Core concept with ETL + deegree INSPIRE Node*

The basic scenario is described next.

The ETL process extracts data from a local source dataset/database and
transforms this data into valid INSPIRE data theme GML. This includes coordinate transformation (to ETRS89).
As the last step of the ETL process INSPIRE-compliant GML data
is published to the (deegree) INSPIRE Node, either using WFS-T (WFS-Transactional, a standardized way to
publish data remotely via the WFS protocol) or via a deegree tool called *FSLoader*.

The INSPIRE Node
takes care of storing GML data into an "INSPIRE Feature Store", usually a
database like PostGIS or Oracle Spatial. The storage format/schema is internal to
the INSPIRE Node, thus transparent to the user. Finally the INSPIRE Node will provide a WFS
to realize Download services. In addition a WMS can be configured
(using Styled Layer Descriptors) to provide INSPIRE View services via WMS.

This concept will be expanded further below and subsequent sections of this document.

ETL - A Reusable Approach
=========================

ETL is, as its abbreviation implies and as described above, a 3-step process.
WIthin the context of ETL from local geodata sources we have developed
a reusable approach. Reusable, among INSPIRE/ESDIN data themes but also by other NMAs.

The three steps are analysed next.

The first ETL step is Extract. This step is specific for the type of datasource, the data formats, the local access
to the data source restrictions and credentials etc. When extracting from a Spatial Database
like Oracle and storing in a different format, this step usually involves a format conversion.
For example data stored in Oracle can be extracted and stored as an ESRI Shape file, a GML (v2 or v3)
file, a MapInfo file etc. As both the data model and coordinate projection are only altered
structurally this is not a transformation. The result of this step is in our case a file that
serves as input to the second step, the Transform. In the case of the Kadaster as no access was possible
to the Oracle database, ESRI Shapefiles (for topo data, i.e. Top10NL) and MapInfo (for Cadastral and Administrative Unit data)
files were obtained.

The second step is Transform. Here several substeps are performed.

#. coordinate transformation through `GDAL/OGR <http://gdal.org>`_
#. model transformation through `XSLT <http://en.wikipedia.org/wiki/XSLT>`_

Step 1 takes the result of the Extract step, such as an ESRI Shape file and
will first apply coordinate transformation and a conversion to flat, simple feature GML still
reflecting the local data model. The model transformation in the second (XSLT) step will
transform the flat v2 (or v3.1.1) GML to INSPIRE v3.2.1 GML in two phases:

#. parsing, mapping and assembling elements and attributes
#. generation of INSPIRE v3.2.1 elements through XSLT *Named/Callable Templates*

The intention is that this second phase will have reusable XSLT *Named/Callable Templates*
that can be reused across themes (e.g. a *NamedPlace*). Callable templates are like subroutines.
As a result of the Transform step a file containing a dataset for a data themesuch as CP or AU
in GML v3.2.1 is created.

The last step is Load. The GML file from the Transform step is loaded into an INSPIRE Node.
This entire step is completely reusable aover themes, as this is mainly
calling either an HTTP "Uploader" to POST a GML dataset via WFS-T or a dedicated
tool like the deegree FSLoader.

deegree - A flexible INSPIRE Node
=================================

We realize that our concept is strongly based on the deegree (v3) architecture, but as we shall
see this setup is extremely reusable and flexible.

Basically the deegree INSPIRE Node is a black box: data can be published in INSPIRE GML (via WFS-T or FSLoader), data is stored
transparently in a spatial database, data can be requested via WMS or WFS. Most importantly,
*no specific configuration is neccessary to support any complex GML schema* such as INSPIRE Annex data themes (or GeoSciML).
The main action to support these data themes is by simply dropping XSD files
into a deegree wrokspace directory ! This makes the deegree INSPIRE node completely independent
from any local situation, thus highly reusable over data themes and NMAs.

One could even imagine of setting up an EU-wide deegree INSPIRE Node "in the Cloud" to which
all NMAs could publish their data !  See the figure below.

.. figure:: _static/deegree-inspire-node-cloud.png
   :align: center
   :width: 650px

   *Figure 5 - Shared deegree INSPIRE Node in The Cloud*

The "INSPIRE Node" setup is described at several places:

* deegree website: http://wiki.deegree.org/deegreeWiki/InspireNode
* presentation (Bolsena, June 2010): `PDF <http://www.justobjects.nl/jo/assets/presentation/bolsena-2010-inspire/bolsena-2010-inspire-just.pdf>`_














