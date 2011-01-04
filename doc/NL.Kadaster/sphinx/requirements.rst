.. _requirements:


************
Requirements
************

This chapter outlines the main requirements for this project.

Specific functional requirements are:

* transform local data from the Dutch Kadaster to INSPIRE data themes (see below)
* setup Download Services via WFS for these INSPIRE data themes
* setup View Services via WMS for these INSPIRE data themes
* setup Metadata Services for these INSPIRE WMSs and WFSs
* combine the above services such that a "Publish, Find, Bind" scenario can be performed
* provide visualisation for these Services

The specific INSPIRE Annex I/ESDIN data themes to be transformed and handled by the above services are:

* Administrative Units (AU)
* Cadastral Parcels (CP)
* Geographical Names (GN)
* Hydrography (HY)
* Transport Networks (TN)
* ESDIN: Topography, Large Scale (ExM)

Note: AD (Addresses) were already handled in phase 1 of this project.

The local data sources to be used from the Kadaster are:

* Topography: Top10NL: http://www.kadaster.nl/top10nl
* Cadastral Parcels (CP) and Administrative Units (AU) : "Basisregistratie Kadaster", "CIDB (Centrale Informatie DB)"

Other requirements are:

* ESDIN WP11: contribute to best practices and provide services for interworking tests


