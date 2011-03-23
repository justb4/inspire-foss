<?xml version="1.0" encoding="UTF-8"?>


<!--

Transform a local (RWS) GML document to a INSPIRE TN-RO SpatialDataset.

GNthor:  Just van den Broecke, Just Objects B.V. for Dutch Kadaster

Input: Shape file, transformed to a GML (v2) file by ogr2ogr (see bin/to-gml.sh).
Output: SpatialDataset with TransportNetworks from INSPIRE Annex I TN
-->
<xsl:stylesheet version="1.0"
				xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2"
				xmlns:gmd="http://www.isotc211.org/2005/gmd"
				xmlns:gml="http://www.opengis.net/gml/3.2"
				xmlns:gml2="http://www.opengis.net/gml"
				xmlns:ogr="http://ogr.maptools.org/"
				xmlns:xlink="http://www.w3.org/1999/xlink"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


	<!-- Use specific constants for NL.RWS -->
	<xsl:include href="../../shared/xsl/constants-nl.xsl"/>
    <xsl:include href="../../shared/xsl/constants-nl-rws.xsl"/>

	<!-- Use generic transform callable templates -->
	<xsl:include href="../../shared/xsl/common.xsl"/>

	<!-- Specific local transform from Dutch local GML2 to GN -->
	<xsl:include href="local-to-inspire-tn-ro.xsl"/>

 	<xsl:template match="/">
		<!-- Generate SpatialDataset -->
		<base:SpatialDataSet 
							 xmlns:TN-RO="urn:x-inspire:specification:gmlas:RoadTransportNetwork:3.0"
							 xmlns:TN="urn:x-inspire:specification:gmlas:CommonTransportElements:3.0"
							 xmlns:NET="urn:x-inspire:specification:gmlas:Network:3.2"
							 xmlns:GN="urn:x-inspire:specification:gmlas:GeographicalNames:3.0"
							 xmlns:gmd="http://www.isotc211.org/2005/gmd"
							 xmlns:xlink="http://www.w3.org/1999/xlink"
							 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
							 xmlns:gml2="http://www.opengis.net/gml"
							 xmlns:gml="http://www.opengis.net/gml/3.2"
							 xsi:schemaLocation="urn:x-inspire:specification:gmlas:BaseTypes:3.2 http://schemas.kademo.nl/inspire/v3.0.1/BaseTypes.xsd urn:x-inspire:specification:gmlas:GeographicalNames:3.0 http://schemas.kademo.nl/inspire/v3.0.1/GeographicalNames.xsd urn:x-inspire:specification:gmlas:RoadTransportNetwork:3.0 http://schemas.kademo.nl/inspire/v3.0.1/RoadTransportNetwork.xsd urn:x-inspire:specification:gmlas:CommonTransportElements:3.0 http://schemas.kademo.nl/inspire/v3.0.1/CommonTransportElements.xsd urn:x-inspire:specification:gmlas:Network:3.2 http://schemas.kademo.nl/inspire/v3.0.1/Network.xsd"
							 gml:id="{$idNameSpaceTheme}">

			<base:identifier>
				<xsl:call-template name="Base.InspireId">
					<xsl:with-param name="localId">
						<xsl:value-of select="0"/>
					</xsl:with-param>
					<xsl:with-param name="idPrefix">
						<xsl:value-of select="$idNameSpaceTheme"/>
					</xsl:with-param>
				</xsl:call-template>
			</base:identifier>

			<base:metadata xsi:nil="true"/>

			<!-- Loop through all features, selecting each only once (no duplicates)-->
			<xsl:apply-templates select="//gml2:featureMember/*"/>

		</base:SpatialDataSet>
	</xsl:template>

</xsl:stylesheet>
