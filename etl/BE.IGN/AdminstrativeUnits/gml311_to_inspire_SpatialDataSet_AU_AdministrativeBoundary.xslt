<?xml version="1.0" encoding="UTF-8"?>
<!--
Transform a GML3.1.1 document to a INSPIRE AU SpatialDataset.
Author: Frans Knibbe, Geodan

Input: ESRI shapefile, transformed to a GML 3.1.1. file  by the FME
(ogr3ogr can also produce GML, but it's GML 2 and projection to EPSG:4258 
produces coordinates in the wrong order. Transforming ogr2ogr output should be possible 
but it would need some extra XSLT transformation)
Output: AdministrativeBoundary features according to the INSPIRE AdministrativeUnits application schema
-->
<xsl:stylesheet version="1.0" xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2" xmlns:fme="http://www.safe.com/gml/fme" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:wfs="http://www.opengis.net/wfs" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:AU="urn:x-inspire:specification:gmlas:AdministrativeUnits:3.0" xmlns:GN="urn:x-inspire:specification:gmlas:GeographicalNames:3.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="gml:FeatureCollection" xmlns:gml="http://www.opengis.net/gml">
		<base:SpatialDataSet xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2" xmlns:AU="urn:x-inspire:specification:gmlas:AdministrativeUnits:3.0" xmlns:GN="urn:x-inspire:specification:gmlas:GeographicalNames:3.0" xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:gml="http://www.opengis.net/gml/3.2" xsi:schemaLocation="urn:x-inspire:specification:gmlas:AdministrativeUnits:3.0 http://research.geodan.nl/esdin/schemas/v3.0/AdministrativeUnits.xsd" gml:id="EU.INSPIRE-FOSS">
			<base:identifier>
				<base:Identifier>
					<base:localId>0</base:localId>
					<base:namespace>BE.IGNB.Top250</base:namespace>
				</base:Identifier>
			</base:identifier>
			<xsl:element name="base:metadata">
				<xsl:attribute name="xsi:nil">true</xsl:attribute>
			</xsl:element>
			<xsl:for-each select="gml:featureMember" xmlns:gml="http://www.opengis.net/gml">
				<base:member>
					<AU:AdministrativeBoundary xmlns:gml="http://www.opengis.net/gml/3.2">
						<xsl:attribute name="gml:id">AB_<xsl:number/></xsl:attribute>
						<xsl:element name="AU:geometry">
							<gml:LineString>
								<xsl:attribute name="gml:id"><xsl:value-of select="concat('LineString_',generate-id())"/></xsl:attribute>
								<xsl:attribute name="srsName">urn:ogc:def:crs:EPSG::4258</xsl:attribute>
								<gml:posList>
									<xsl:value-of select="fme:PolbndL/gml:curveProperty/gml:LineString/gml:posList" xmlns:gml="http://www.opengis.net/gml"/>
								</gml:posList>
							</gml:LineString>
						</xsl:element>
						<xsl:element name="AU:inspireId">
							<base:Identifier>
								<base:localId>
									<xsl:value-of select="fme:PolbndL/@gml:id" xmlns:gml="http://www.opengis.net/gml"/>
								</base:localId>
								<base:namespace>BE.IGNB.Top250</base:namespace>
							</base:Identifier>
						</xsl:element>
						<xsl:element name="AU:country">
							<gmd:Country codeList="http://research.geodan.nl/sr/esdin/code_lists/CountryCode.xml" codeListValue="BE">BE</gmd:Country>
						</xsl:element>
						<xsl:element name="AU:nationalLevel">5thOrder</xsl:element>	
						<AU:legalStatus xsi:nil="true"/>
						<AU:technicalStatus xsi:nil="true"/>
						<AU:beginLifespanVersion xsi:nil="true"/>
						<AU:endLifespanVersion xsi:nil="true"/>
						<AU:admUnit xsi:nil="true"/>
					</AU:AdministrativeBoundary>
				</base:member>
			</xsl:for-each>
		</base:SpatialDataSet>
	</xsl:template>
</xsl:stylesheet>
