The European Union Directive 2007/2/EC INSPIRE, [Infrastructure for Spatial Information in Europe](http://inspire.jrc.ec.europa.eu/), defines a set of specifications for common data formats and services for geodata across Europe. In order to comply with these specs, EU member states will have to transform national geodata to INSPIRE-defined standards and make this data available through web services. These web services include the Web Feature Service (WFS) and Web Mapping service (WMS) as defined by the [Open Geospatial Consortium](http://www.opengeospatial.org) (OGC) and the [ISO](http://www.iso.org).

## Goals ##
This project aims to provide reusable Free and Open Source Software (FOSS) components for implementing INSPIRE, specifically:

  * ETL (Extract, Transfer, Load) : converting national geodata to INSPIRE-compliant data
  * storage: data(base) storage models for INSPIRE data
  * web services: setting up WFS/WMS/CSW/WPS to support INSPIRE network services
  * validation and testing: schema validation and in-depth service validation

The main target group for this project are developers from EU member states like National Mapping Agencies (NMAs) that are tasked with delivering INSPIRE-compliant data and web services.

## Participants ##
Project participants include:

  * [GEORZ Lab and Research, The Dutch Kadaster](http://kademo.nl)
  * [Just Objects](http://www.justobjects.nl)
  * [lat/lon GmbH, Germany](http://lat-lon.de)
  * [Occam Labs UG, Germany](http://www.occamlabs.de)
  * [Geodan](http://www.geodan.nl)

## Getting Involved ##
You can subscribe to [our mailing list](http://groups.google.com/group/inspire-foss-devel) to participate in specific discussions involving INSPIRE implementation.
If you are interested to get involved in coding you can mail Just van den Broecke at
[justb4@gmail.com](mailto:justb4@gmail.com).

## Documentation ##
Documentation: some can be found in the [Wiki](http://code.google.com/p/inspire-foss/w/list). The main technical setup of this project
for Network Services and ETL is in progress, see http://inspire.kademo.nl/doc.

## Learning ##

We started developing a workshop where you can get hands-on experience with all tools in
this project. See also [InspireFossWorkshop](InspireFossWorkshop.md) in the Wiki. Do your own ETL, run WMS/WFS services, view and test results. Through the virtual appliance `InspireFossBox` getting up and running is a breeze.

Interested? Mail [Just van den Broecke](mailto:justb4@gmail.com) for details.

## Additional links ##

For the visualization of complex INSPIRE data a companion project is active: [the GeoViewer](http://code.google.com/p/geoext-viewer). This viewer is used in all examples.

  * [inspire.kademo.nl](http://inspire.kademo.nl) - INSPIRE implementation by the [Dutch Kadaster](http://www.kadaster.nl)
  * http://stetl.org - Stetl, the new (2012) Streaming ETL framework, also for INSPIRE transformations
  * [Deegree3 INSPIRE Demo](http://inspire.kademo.nl/deegree-inspire-demo) - run/extend this self-contained example in your own environment. See the [RunDeegree3Demo](RunDeegree3Demo.md) page for more info
  * [deegree InspireNode](http://wiki.deegree.org/deegreeWiki/InspireNode) - INSPIRE View and Download Services based on the advanced application schema support of [deegree v3](http://deegree.org)
  * [www.esdin.eu](http://www.esdin.eu) - European Spatial Data Infrastructure with a Best Practice Network


_"The implementation of the INSPIRE directive is not an easy task,
mainly because there are so few real world experiences. For me the
information shared by this group has been really useful."_  [Stefano, Dec 7, 2010](http://groups.google.com/group/inspire-foss-devel/browse_thread/thread/afde7dd6a6ac95f4)