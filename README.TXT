08.aug.2015 - moved this project from Google Code to GitHub, many links may be broken...

03.jun.2010

Primary contact: Just van den Broecke - just@justobjects.nl

This is the top directory for the project "inspire-foss". This project deals with
the Transformation, storage and web-based delivery for geodata based on European INSPIRE standards.

All files under this are under the GNU GENERAL PUBLIC LICENSE v3 even if
no license text is included in the file. See LICENSE.TXT and http://www.gnu.org.

See http://inspire.kademo.nl for specifics and documentation.
See http://code.google.com/p/inspire-foss for the sources.

The directories below contain the following:

/demos - ready to use demo apps
/doc - all documentation
/etl - (Extract, Transform, Load) transformation for (NMA) local datasets
/tools - serveral tools for e.g. feature store loading and validation
/webapps - web applications (mainly WFS) for serving INSPIRE-compliant Theme data

More info here below as taken from the Google Code Project page:

The European Union Directive 2007/2/EC INSPIRE, [http://inspire.jrc.ec.europa.eu/ Infrastructure for Spatial Information in Europe], defines a set of specifications for common data formats and services for geodata across Europe. In order to comply with these specs, EU member states will have to transform national geodata to INSPIRE-defined standards and make this data available through web services. These web services include the Web Feature Service (WFS) and Web Mapping service (WMS) as defined by the [http://www.opengeospatial.org Open Geospatial Consortium] (OGC) and the [http://www.iso.org ISO].

==Goals==
This project aims to provide reusable Free and Open Source Software (FOSS) components for implementing INSPIRE, specifically: 

  * ETL (Extract, Transfer, Load) : converting national geodata to INSPIRE-compliant data
  * storage: data(base) storage models for INSPIRE data
  * web services: setting up WFS/WMS/CSW/WPS to support INSPIRE network services
  * validation and testing: schema validation and in-depth service validation

The main target group for this project are developers from EU member states like National Mapping Agencies (NMAs) that are tasked with delivering INSPIRE-compliant data and web services.

==Participants==
Project participants include:

  * [http://kademo.nl GEORZ Lab and Research, The Dutch Kadaster]  
  * [http://www.justobjects.nl Just Objects]
  * [http://lat-lon.de lat/lon GmbH, Germany]
  * [http://www.occamlabs.de Occam Labs UG, Germany]
  * [http://www.geodan.nl Geodan]
 
==Getting Involved==
You can subscribe to [http://groups.google.com/group/inspire-foss-devel our mailing list] to participate in specific discussions involving INSPIRE implementation.
If you are interested to get involved in coding you can mail Just van den Broecke at
[mailto:justb4@gmail.com justb4@gmail.com].

==Documentation==
Documentation: some can be found in the [http://code.google.com/p/inspire-foss/w/list Wiki]. The main technical setup of this project
for Network Services and ETL is in progress, see http://inspire.kademo.nl/doc.
 
==Learning==

We started developing a workshop where you can get hands-on experience with all tools in
this project. See also [InspireFossWorkshop] in the Wiki. Do your own ETL, run WMS/WFS services, view and test results. Through the virtual appliance `InspireFossBox` getting up and running is a breeze.

Interested? Mail [mailto:justb4@gmail.com Just van den Broecke] for details.

==Additional links==

For the visualization of complex INSPIRE data a companion project is active: [http://code.google.com/p/geoext-viewer the GeoViewer]. This viewer is used in all examples. 

  * [http://inspire.kademo.nl inspire.kademo.nl] - INSPIRE implementation by the [http://www.kadaster.nl Dutch Kadaster]
  * [http://stetl.org] - Stetl, the new (2012) Streaming ETL framework, also for INSPIRE transformations 
  * [http://inspire.kademo.nl/deegree-inspire-demo Deegree3 INSPIRE Demo] - run/extend this self-contained example in your own environment. See the [RunDeegree3Demo] page for more info
  * [http://wiki.deegree.org/deegreeWiki/InspireNode deegree InspireNode] - INSPIRE View and Download Services based on the advanced application schema support of [http://deegree.org deegree v3]
  * [http://www.esdin.eu www.esdin.eu] - European Spatial Data Infrastructure with a Best Practice Network  


_"The implementation of the INSPIRE directive is not an easy task,
mainly because there are so few real world experiences. For me the
information shared by this group has been really useful."_  [http://groups.google.com/group/inspire-foss-devel/browse_thread/thread/afde7dd6a6ac95f4 Stefano, Dec 7, 2010]


  
