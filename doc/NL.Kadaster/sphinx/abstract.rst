.. _abstract:

.. index:: INSPIRE, Transformation, Combined Transformation, EURADIN, ESDIN

********
Abstract
********

The project "INSPIRE Prototypes (phase2)" aims to provide best practices and working
prototypes for INSPIRE data transformation and network (web) services for the Dutch Kadaster.
The home page for this project is http://inspire.kademo.nl.

The focus is on the following specific subjects:

  * ETL (Extract Transform Load)

    * extracting data from local Dutch geodata sources
    * data transformation to INSPIRE data models and coordinate systems
    * loading transformed data into a destination datastore

  * Data storage models : how to store "INSPIRE Data"

  * Web Services : setting up Download (via WFS), View (via WMS) and Discovery (via CSW) services

  * Visualisation and testing : validation and demonstration of the above subjects

The specific INSPIRE Annex I Data themes that were elaborated are
AU (Administrative Units), CP (Cadastral Parcels), GN (Geographical Names), HY (Hydrography)
and Transport Networks (TN). AD (Addresses) were already handled
in `phase 1 of this project <http://inspire.kademo.nl/docold/phase1>`_.

This project was largely carried out in the context of
`ESDIN <http://www.esdin.eu>`_, the European Spatial Data Infrastructure with a Best Practice Network,
a project supported by eContent+ programme. Apart from the above Annex I Data themes
the ESDIN data theme for European Topography (Large Scale), ExM was elaborated.
ExM builds on the INSPIRE data themes AU, CP, GN, HY and TN.

Practical work was carried using the development infrastructure of
the `GEORZ Lab & Research department <http://www.kademo.nl>`_ within the Dutch Kadaster.
All external software used in this project is Free and Open Source (FOSS).
All assets (code, documentation) produced by this project are licensed under the GNU Public License v3
and available at the FOSS projects
http://code.google.com/p/inspire-foss (ETL, services) and http://code.google.com/p/geoext-viewer (web-based viewer).
