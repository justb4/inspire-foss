.. _abstract:


********
Abstract
********

This document describes the realization of web services for INSPIRE Annex I themes using
Open Source components. The focus is on the overal approach and software architecture. This work
was carried out in the context of `EURADIN WP7 <http://www.euradin.eu>`_ and
`ESDIN WP11 <http://www.esdin.eu>`_. Two specific Annex I v3.0 themes are implemented:
Addresses (AD) and Cadastral Parcels (CP). Data from Kadaster data sources for addresses (BAG) and parcel data
(from BRK, "Basisregistratie Kadaster") are transformed into INSPIRE-compliant data and exposed through a Web Feature Service (WFS) 
using "Combined Transformation".
Open Source components are used like `PostGIS (Spatial Database) <http://postgis.refractions.net>`_ and `Deegree (Web Feature Server) <http://deegree.org>`_.


