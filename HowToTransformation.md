# Introduction #

This `HowTo` describes how to transform your local national data
to INSPIRE harmonized data and how to embed this transformation in a
complete [ETL (Extract, Transform, Load)](http://en.wikipedia.org/wiki/Extract,_transform,_load) chain.
This will be illustrated using
some of the existing transformation resources present within the project.
In the remainder of this document the term "ETL" will be used for the overall process from local data to harmonized
INSPIRE data. "Content Transformation" is a similar term as ETL and may be found in some of the documentation.
The ETL is tightly integrated with the provision of download and view network services via WFS and respectively
WMS. These network services are not part of this `HowTo`.

# The ETL Chain #
The image below shows the core/skeleton ETL chain. Although this image shows some data specific to the
Dutch Kadaster (Oracle and `MapInfo`), the overall processing steps remain identical and will be expanded below.
The circles depict processing steps, the rectangles intermediate results (files). The arrows denote the flow of data.

![http://inspire-foss.googlecode.com/svn/trunk/doc/workshop/media/etl-design-chain1.png](http://inspire-foss.googlecode.com/svn/trunk/doc/workshop/media/etl-design-chain1.png)

Note: in some cases, as will be described below, the `export` and 'OGR` processing steps may be bundled together into a single processing step.

# Background Reading #

This section contains references to the main background knowledge that helps to
understand and conduct the ETL development process.

## ETL Design and Tools ##
In order to grasp the steps that follow in upcoming sections we advise to
first read about the concepts, design and technologies underlying the ETL.

The main document (HTML and PDF) to start with is http://inspire.kademo.nl/doc. Although this document has references to data  specific to the
[Dutch Kadaster](http://www.kadaster.nl) it has general applicability. In particular
the sections about [Concepts](http://inspire.kademo.nl/doc/concept.html) and
[ETL Design](http://inspire.kademo.nl/doc/design-etl.html) should provide the basic
information on the basics of the ETL. This document also provides some
specific information on the [ETL Implementation](http://inspire.kademo.nl/doc/implementation.html)
where actual code is even directly included within the document. Though the ETL may look different for each dataset
and target INSPIRE Theme, there are underlying "patterns" which not only divide the ETL components into
logical units but also make many of these components highly reusable.

All code for existing ETL can be browsed
online via the [ETL folder within the Subversion repository](https://code.google.com/p/inspire-foss/source/browse/#svn%2Ftrunk%2Fetl).
As you may have noticed the directory layout under the `etl` folder is organized by
`<Country>.<Data Provider>/<INSPIRE Theme>`, for example `NL.RWS/TransportNetworks`. Directly
under `etl` is a directory
called [shared](https://code.google.com/p/inspire-foss/source/browse/#svn%2Ftrunk%2Fetl%2Fshared) that contains shared ETL code for multiple data providers and INSPIRE Themes.
Not all data providers follow this convention yet. Best is to look under
[NL.Kadaster](https://code.google.com/p/inspire-foss/source/browse/#svn%2Ftrunk%2Fetl%2FNL.Kadaster) and [NL.RWS](https://code.google.com/p/inspire-foss/source/browse/#svn%2Ftrunk%2Fetl%2FNL.RWS).


Further background knowledge that helps in understanding the ETL implementation deals with the technologies
that are used:

  * [GDAL/OGR](http://gdal.org) core format and projection transformation. Although GDAL/OGR is an entire suite of libraries/tools, only a single command-line tool is used: [ogr2ogr](http://www.gdal.org/ogr2ogr.html).
  * [XSLT](http://en.wikipedia.org/wiki/XSLT) is used for model/schema transformation. To learn about XSLT, the best source to start is [the XSLT tutorial at W3Schools.com](http://www.w3schools.com/xsl).
  * The ETL chain and the invokation of the tools like `xsltproc` and `ogr2ogr` are "glued" together using Unix/Linux shell scripts. To learn the [Steve's Bourne / Bash shell scripting tutorial](http://steve-parker.org/sh/sh.shtml) is a good starting point.

## Your Data and INSPIRE ##
Whatever tools you will use to transform your data to INSPIRE, you have to be familiar
with the formats and schema's of both your data and the targeted harmonized INSPIRE data.

For INSPIRE data models you need to be familiar with the following:

  * XML Schema Definition Language (XSD) - see [tutorial at W3Schools.com](http://www.w3schools.com/schema/default.asp)
  * GML (version 3.2.1) Schemas
  * ISO Application Schemas
  * The related INSPIRE Schema's (XSDs) for your target Theme(s)

All applicable XSD files have been added to the project and [can be browsed](https://code.google.com/p/inspire-foss/source/browse/#svn%2Ftrunk%2Fschemas)
but the easiest is to use an XML editor or IDE like IntelliJ to be able to navigate the schema files.

Last but not least you need to have a specification of your own data.

# The Steps #
So with all the reference documents, tools and data, what are the steps to develop an ETL for a source dataset X
and a target INSPIRE Theme Y ? Basically it is best to look at the existing ETLs under the [ETL folder within the Subversion repository](https://code.google.com/p/inspire-foss/source/browse/#svn%2Ftrunk%2Fetl) but
we will try here to list a set of subsequent steps for the development process. Once you are familiar with the process
you may change the order of the steps.

## Steps Summary ##
Without going into details, here is a summary of the main steps for developing an ETL for any source dataset X.

  1. **Mapping Specs** - define the mapping from your source data objects/attributes to target INSPIRE Annex I-III Theme GML Features/properties in a document/Excel sheet.
  1. **Flatten** - convert your source DB data into any simple/flat feature format: CSV, ESRI Shapefile, `MapInfo` File, flat GML, ....
  1. **Make GML** - convert and reproject data from 2. into simple (flat) feature GML in the EPSG:4258 (ETRS89) projection
  1. **Test Samples** - get some representative sample GML from the file(s) generated in step 3 to be used to develop/test schema transformation with XSLT and put this GML in a test directory
  1. **XSLT Develop** - develop the core schema XSLT transformation by creating the following components (files)
    * XSLT (callable templates) for the target feature(s) generation within [the shared ETL directory](https://code.google.com/p/inspire-foss/source/browse/#svn%2Ftrunk%2Fetl%2Fshared)
    * XSLT for the extraction of attributes from the source GML (see step 4.) and calling the XSLT callable templates
    * XSLT for the spatial dataset GML container generation
    * the shell script to invoke the transformation described here in these first 3 bullets
  1. **Validation** - validate the resulting output GML of step 5 using the [project validator tool](https://code.google.com/p/inspire-foss/source/browse/#svn%2Ftrunk%2Ftools%2Fvalidator).
  1. **Load** - develop a Unix script that loads the test data into PostGIS
  1. **Full ETL** - develop Unix shell scripts to execute the ETL developed in step 1-5 for the full source dataset
  1. **WFS/WMS test** - optional: use the deegree WFS/WMS for testing the full dataset ETL

This was the summary of steps. At this point it may not be clear what each step exactly beholds. The sections below will expand
the steps further.

The running example in the steps is the INSPIRE Annex I Theme `TransportNetworks` from the data provider "NL.RWS", i.e. [Rijkswaterstaat](http://www.rijkswaterstaat.nl),
the Netherlands Ministry of Transport, Waterways and Public Works. See also the
[etl/NL.RWS folder](https://code.google.com/p/inspire-foss/source/browse/#svn%2Ftrunk%2Fetl%2FNL.RWS%253Fstate%253Dclosed).
The local NL.RWS data (model) used is called [Nationaal Wegen Bestand (NWB)](http://www.scribd.com/doc/45473661/Handleiding-nationaal-wegenbestand-NWB), the Dutch national (topological) road dataset.
This dataset will be called `NWB` from here on.

This actual NWB example was developed in analogy to
the `TransportNetworks` Theme developed under
"NL.Kadaster". See [etl/NL.Kadaster/TransportNetworks folder](https://code.google.com/p/inspire-foss/source/browse/#svn%2Ftrunk%2Fetl%2FNL.Kadaster%2FTransportNetworks).

## Step 1 - Mapping Specs ##
Define the mapping from your source data objects/attributes to target INSPIRE Annex I-III Theme GML Features/properties
in a document/Excel sheet.

This is literally a "paper exercise", as we will document how our local national model will map to
(an) INSPIRE data Theme model(s). Some local data like the Dutch Top10NL may map to multiple INSPIRE data themes, but
in most cases a single local data model will map to a single INSPIRE Theme.

For the NWB, [a specification can be found online](http://www.scribd.com/doc/45473661/Handleiding-nationaal-wegenbestand-NWB).
The related INSPIRE data theme comprises both the
[TransportNetworks data specification PDF](http://inspire-foss.googlecode.com/svn/trunk/doc/reference/inspire/INSPIRE_DataSpecification_TN_v3.1.pdf)
and the following (hierarchy of) Application Schema XSDs

  1. [RoadTransportNetwork](https://code.google.com/p/inspire-foss/source/browse/trunk/schemas/inspire/v3.0.1/RoadTransportNetwork.xsd)
  1. [TransportNetwork](https://code.google.com/p/inspire-foss/source/browse/trunk/schemas/inspire/v3.0.1/TransportNetwork.xsd)
  1. [Network](https://code.google.com/p/inspire-foss/source/browse/trunk/schemas/inspire/v3.0.1/Network.xsd)

Warning: getting through the PDF and the related XSD(s) is a tough read !

The outcome of this step can take any form, graphically. An often used template is that of an "Excel Mapping Table".
An example (Excel+PDF)
for NWB to `RoadTransportNetwork` [can be found in Subversion](https://code.google.com/p/inspire-foss/source/browse/#svn%2Ftrunk%2Fetl%2FNL.RWS%2FTransportNetworks%2Fdoc).

Note: for NWB a `wegvak` corresponds to an INSPIRE `RoadLink` but what about `wegvak junctions`. An obvious
candidate is `RoadNode`. Also there are certain `wegvakken` that may be mapped to INSPIRE `ERoads` (E-wegen).
This is an extercise for further development.

## Step 2 - Flatten ##
Convert your source DB data into any simple/flat feature format: CSV, ESRI Shapefile, `MapInfo` File, flat GML.

Often the source dataset resides in a production database such as Oracle Spatial or PostgreSQL/PostGIS and
direct access for ETL is not possible.

This step beholds extracting data from that production environment and making this available. Also
it is best to start with a small but representative geographic area from the entire country.

For NWB this step had already be performed, resulting in an extract for a small area north of the city
of Amsterdam. The format in which this data was delivered is ESRI Shapefile. Basically the NWB
is a single table (.shp file) with coordinates in the Dutch RD projection (EPSG:28992).

Note: if you are in the workshop using the InspireFossBoxSetup, you will find the NWB Shapefile in the directory
`inspire/data/NWB` under your home directory.

## Step 3 - Make GML ##
Convert and reproject data from 2. into simple (flat) feature GML in the EPSG:4258 (ETRS89) projection.

The purpose of this step is multifold:

  * reproject data from the source projection to an INSPIRE projection
  * make your data readable as GML
  * provide input for Step 4 (extract test samples)

This step is thus partly an Extract and partly a Transform (coordinate transform) within the ETL chain.

For NWB this step is performend using the shell script
[tn-extract.sh](https://code.google.com/p/inspire-foss/source/browse/trunk/etl/NL.RWS/bin/tn-extract.sh).
The heart of this script is the line:

```
$TO_GML_SCRIPT -t MULTILINESTRING nwb_wegvakken.shp transformed/nwb_wegvakken.gml
```

`$TO_GML_SCRIPT` refers to the script [to-gml.sh](https://code.google.com/p/inspire-foss/source/browse/trunk/etl/NL.RWS/bin/to-gml.sh)
which converts any flat file format like ERSI Shapefile or `MapInfo` to flat GML. The heart
of `to-gml.sh` is the GDAL `ogr2ogr` command:

```
   ogr2ogr -nlt $geotype -t_srs "$proj4258" -s_srs "$proj28992" -f "GML" $2 $1
```

where `$geotype` is `MULTILINESTRING` and  `$2` is `transformed/nwb_wegvakken.gml` and
`$1` is the input file `nwb_wegvakken.shp`.

Note: if you are in the workshop using the InspireFossBoxSetup, you will find the GML converted from NWB Shapefile in the directory
`inspire/data/NWB/transformed` under your home directory.

In some cases where you have direct access to the source database Steps 2+3 could be merged together
using a single `ogr2ogr` command, as GDAL/OGR also can handle databases such as Oracle and PostGIS as input.

## Step 4 - Test Samples ##
Get some representative sample GML from the file(s) generated in step 3 to be used to develop/test schema transformation with XSLT and
put this GML in a test directory.

For NWB the test directory is at
[etl/NL.RWS/TransportNetworks/test](https://code.google.com/p/inspire-foss/source/browse/#svn%2Ftrunk%2Fetl%2FNL.RWS%2FTransportNetworks%2Ftest).

The test sample GML file is
[wegvakken.gml](https://code.google.com/p/inspire-foss/source/browse/trunk/etl/NL.RWS/TransportNetworks/test/wegvakken.gml).

## Step 5 - XSLT Develop ##
This is the heart of transformation: here we develop the XSLT to transform from the
flat GML format resulting from Step 3 into full INSPIRE schema GML. As we want to develop
quickly, we take the test GML samples from Step 4 as source data.

This is also the step where part of the transformation is specific (to the local source data)
and part is generic/reusable. The main structure of the XSLT is depicted in the figure below.

![http://inspire-foss.googlecode.com/svn/trunk/doc/workshop/media/etl-design-xsl.png](http://inspire-foss.googlecode.com/svn/trunk/doc/workshop/media/etl-design-xsl.png)

What we see in this figure is two levels of reuse:

  1. among data providers, for example both Kadaster and RWS can reuse callable templates for [RoadTransportNetwork](https://code.google.com/p/inspire-foss/source/browse/trunk/etl/shared/xsl/annex1/RoadTransportNetwork.xsl).
  1. between themes: for example [GeographicalNames](https://code.google.com/p/inspire-foss/source/browse/trunk/etl/shared/xsl/annex1/GeographicalNames.xsl)

The three levels of XSL scripts depicted in the figure correspond bottom to top to the Steps 5a-5c below.


### Step 5a - XSLT - Callable templates ###
Here we will develop/reuse
generic XSLT Callable Templates for the target feature(s) generation
within [the shared ETL directory](https://code.google.com/p/inspire-foss/source/browse/#svn%2Ftrunk%2Fetl%2Fshared).

for NWB [etl/shared/xsl/RoadTransportNetwork.xsl](https://code.google.com/p/inspire-foss/source/browse/trunk/etl/shared/xsl/annex1/RoadTransportNetwork.xsl)
is used and [etl/shared/xsl/GeographicalNames.xsl](https://code.google.com/p/inspire-foss/source/browse/trunk/etl/shared/xsl/annex1/GeographicalNames.xsl).

One way to look at these XSLT scripts is as ordinary functions that generate
an GML construct with parameters filled in.

### Step 5b - XSLT - Extraction ###
Here we will write an XSLT that mainly
will extract attributes from the local source GML (see step 4.) and calling the XSLT callable templates
from step 5a.

For NWB the result is
[etl/NL.RWS/TransportNetworks/local-to-inspire-tn-ro.xsl](https://code.google.com/p/inspire-foss/source/browse/trunk/etl/NL.RWS/TransportNetworks/local-to-inspire-tn-ro.xsl).
With `tn-ro` being the XML Namespace for `RoadTransportNetwork`.

### Step 5c - XSLT - GML container ###
Here we will write an XSLT to generate
what is called a "spatial dataset GML container". This is mainly
the outer XML tags/attributes to hold all transformed features.

INSPIRE has defined a `SpatialDataset` as a container within
[BaseTypes.xsd](https://code.google.com/p/inspire-foss/source/browse/trunk/schemas/inspire/v3.0.1/BaseTypes.xsd).
Another container (not implemented here) that can be used could be a WFS-T transaction.

For NWB the result is
[etl/NL.RWS/TransportNetworks/local-to-inspire-tn-ro-sd.xsl](https://code.google.com/p/inspire-foss/source/browse/trunk/etl/NL.RWS/TransportNetworks/local-to-inspire-tn-ro-sd.xsl).

With `-sd-` stands for `SpatialDataset`.

### Step 5d - XSLT shell script ###
Here we develop the shell script to invoke the transformation described here in Steps 5a-5c.

For NWB the result is
[etl/NL.RWS/TransportNetworks/local-to-inspire-tn-ro-sd.sh](https://code.google.com/p/inspire-foss/source/browse/trunk/etl/NL.RWS/TransportNetworks/local-to-inspire-tn-ro-sd.sh).
Basically a simple script:

```
BASEDIR=`dirname $0`/..
BASEDIR=`(cd "$BASEDIR"; pwd)`

# use the common script
$BASEDIR/../shared/bin/xslt.sh $BASEDIR/TransportNetworks/local-to-inspire-tn-ro-sd.xsl $1  $2
```

`BASEDIR` is used to be able to execute the script from any other dir and still find the file
[etl/NL.RWS/TransportNetworks/local-to-inspire-tn-ro-sd.xsl](https://code.google.com/p/inspire-foss/source/browse/trunk/etl/NL.RWS/TransportNetworks/local-to-inspire-tn-ro-sd.xsl).

For testing our sample GML we use the script
[etl/NL.RWS/TransportNetworks/test/transform.sh](https://code.google.com/p/inspire-foss/source/browse/trunk/etl/NL.RWS/TransportNetworks/test/transform.sh)

The final GML result form the test file is:
[etl/NL.RWS/TransportNetworks/test/tn-roadnetwork.gml](https://code.google.com/p/inspire-foss/source/browse/trunk/etl/NL.RWS/TransportNetworks/test/tn-roadnetwork.gml)

## Step 6 - Validation ##
This step is mainly a shell script to invoke the standard Validator present in the project.
In practice Step 5 and Step 6 are used in an iterative fashion: develop some XSLT, generate INSPIRE GML, validate etc.

For NWB see:
[etl/NL.RWS/TransportNetworks/test/validate.sh](https://code.google.com/p/inspire-foss/source/browse/trunk/etl/NL.RWS/TransportNetworks/test/validate.sh).

## Step 7 - Load ##
This step is mainly a shell script to invoke the standard deegree FSLoader present in the project.
The advantage of FSLoader is that the deegree server does not need to be running.

Note that if you chose to use a WFS-T GML container in step 5c you can also use an
HTTP tool like `curl`.

For testing our sample GML we use the script
[etl/NL.RWS/TransportNetworks/test/load.sh](https://code.google.com/p/inspire-foss/source/browse/trunk/etl/NL.RWS/TransportNetworks/test/load.sh)

## Step 8 - Full ETL ##
Here we invoke the ETL on the entire source dataset.

For NWB we use the script:
[etl/NL.RWS/bin/tn-etl.sh](https://code.google.com/p/inspire-foss/source/browse/trunk/etl/NL.RWS/bin/tn-etl.sh).

## Step 9 - WFS/WMS test ##
This step is optional but it is always nice to see something. (TO BE FINALIZED)





