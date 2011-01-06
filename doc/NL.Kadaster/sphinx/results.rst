.. _results:


*******
Results
*******

A WFS is currently active providing
INSPIRE-compliant data for Cadastral Parcels (CP) and Addresses (AD)
according to the INSPIRE Annex I V3 schemas (GML 3.2.1/WFS 1.1.0).

The WFS is located at `<http://inspire.kademo.nl/deegree3>`_.

Testing
=======

This `generic WFS client <http://inspire.kademo.nl/deegree-wfs/client/client.jsp>`_ allows you to POST custom WFS requests.

Below are some sample WFS (GET) requests that can be directly executed on the live WFS.

* `WFS GetCapabilities <http://inspire.kademo.nl/deegree-wfs/services?SERVICE=WFS&VERSION=1.1.0&REQUEST=GetCapabilities>`_
* `WFS Addresses (BAG data) - GetFeature <http://inspire.kademo.nl/deegree-wfs/services?SERVICE=WFS&VERSION=1.1.0&REQUEST=GetFeature&outputFormat=text/xml;%20subtype=gml/3.2.1&TYPENAME=AD:Address&maxfeatures=50&NAMESPACE=xmlns%28AD=urn:x-inspire:specification:gmlas:Addresses:3.0%29>`_
* `WFS Cadastral Parcels (BRK perceel data) - GetFeature <http://inspire.kademo.nl/deegree-wfs/services?SERVICE=WFS&VERSION=1.1.0&REQUEST=GetFeature&TYPENAME=CP:CadastralParcel&maxfeatures=50&NAMESPACE=xmlns%28CP=urn:x-inspire:specification:gmlas:CadastralParcels:3.0%29>`_

Viewing
=======

In order to view data a WMS using the ETRS89 (EPSG:4258) projection was setup using GeoServer.
Dutch raster topomaps
and `OpenStreetMap <http://www.openstreetmap.org>`_  tiles are used as baselayers.
The Dutch Kadaster GEORZ Lab is developing a
generic (WMS) view-client as a FOSS project
see http://code.google.com/p/geoext-viewer. This viewer, called GeoViewer is based on `GeoExt <http://www.geoext.org>`_.


Below in Figure 6 and 7 screenshots of GeoViewer adapted for INSPIRE data viewing are shown for both INSPIRE
Addresses and Cadastral Parcels. This viewer can be directly accessed through
http://inspire.kademo.nl/view/viewer.html.


.. figure:: _static/geoviewer-cp.jpg
   :align: center

*Figure 6 - View of Cadastral Parcels (CP) with Kadaster GeoViewer*

.. figure:: _static/geoviewer-ad.jpg
   :align: center

*Figure 7 - View of Addresses (AD) with Kadaster GeoViewer*
