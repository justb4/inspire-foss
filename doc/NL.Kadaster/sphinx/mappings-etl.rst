.. _mappings-etl:


***********************
Transformation Mappings
***********************

This chapter describes the mappings from the Dutch Kadaster local source data to INSPIRE Annex I (GML) theme data.

ESDIN Matching Tables
=====================

All transformations done within the ETL process were based on the
so called "Matching Tables" that The Kadaster has provided to ESDIN WP7.
These Matching Tables are Excel spreadsheets where for each data theme
a single spreadsheet describes the mappings from a local data
model to INSPIRE features/properties. These mapping files are maintained at the
ESDIN project site: https://esdin.basecamphq.com/projects/2489177

This information from the Matching Tables is not repeated here. Below follows
a summary.

Summary
=======

The table below contains a summary of data sources, INSPIRE Themes and
implemented INSPIRE Feature Types.

+---------------------------+--------------------+----------+----------+
| INSPIRE Theme             | Feature Types      | Source   | Coverage |
+===========================+====================+==========+==========+
| Administrative Units (AU) | AdministrativeUnit | CIDB     | Full     |
+---------------------------+--------------------+----------+----------+
| CadastralParcels (CP)     | CadastralParcel    | CIDB     |  TA      |
+---------------------------+--------------------+----------+----------+
| GeographicalNames (GN)    | NamedPlace,        | Top10NL  |  TA      |
|                           | GeographicalName   |          |          |
+---------------------------+--------------------+----------+----------+
| Hydrography (HY)          | StandingWater,     | Top10NL  |  TA      |
|                           | Watercourse,       |          |          |
|                           | DomOrWeir,         |          |          |
|                           | Lock               |          |          |
+---------------------------+--------------------+----------+----------+
| TransportNetworks (TN)    | RoadNode,          | Top10NL  |  TA      |
|                           | RoadLink,          |          |          |
|                           | RoadArea           |          |          |
+---------------------------+--------------------+----------+----------+

Source "CIDB" (Centrale Informatie DataBase) is the Kadaster's administrative
database for parcel and administrative unit info. Top10NL is the Dutch national topographic
data source. Coverage "Full" denotes
country-wide coverage, Coverage TA (Test Area) denotes that a small area has been transformed.

The test area is shown below in Figure 11.

.. figure:: _static/test-area-coverage.jpg
   :align: center
   :width: 650 px

   *Figure 11 - Test Area shown in Viewer*


