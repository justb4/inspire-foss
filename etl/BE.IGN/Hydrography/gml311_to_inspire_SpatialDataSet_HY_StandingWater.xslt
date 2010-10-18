<?xml version="1.0" encoding="UTF-8"?>
<!--
Transform a GML3.1.1 document to a INSPIRE SpatialDataset.
Author: Frans Knibbe, Geodan

Input: ESRI shapefile (InwatA), transformed to a GML 3.1.1. file  by the FME
(ogr3ogr can also produce GML, but it's GML 2 and projection to EPSG:4258 
produces coordinates in the wrong order. Transforming ogr2ogr output should be possible 
but it would need some extra XSLT transformation)
Output: StandingWater features according to the INSPIRE Hydrography application schema
-->
<xsl:stylesheet version="1.0" xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2" xmlns:fme="http://www.safe.com/gml/fme" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:wfs="http://www.opengis.net/wfs" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hy="urn:x-inspire:specification:gmlas:HydroBase:3.0" xmlns:hy-p="urn:x-inspire:specification:gmlas:HydroPhysicalWaters:3.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="gml:FeatureCollection" xmlns:gml="http://www.opengis.net/gml">
		<base:SpatialDataSet xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:hy="urn:x-inspire:specification:gmlas:HydroBase:3.0" xmlns:hy-p="urn:x-inspire:specification:gmlas:HydroPhysicalWaters:3.0" xmlns:gn="urn:x-inspire:specification:gmlas:GeographicalNames:3.0" xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:gml="http://www.opengis.net/gml/3.2" xsi:schemaLocation="urn:x-inspire:specification:gmlas:HydroPhysicalWaters:3.0 http://research.geodan.nl/esdin/schemas/v3.0/HydroPhysicalWaters.xsd" gml:id="EU.INSPIRE-FOSS">
			<base:identifier>
				<base:Identifier>
					<base:localId>0</base:localId>
					<base:namespace>BE.IGNB.Top250</base:namespace>
				</base:Identifier>
			</base:identifier>
			<xsl:element name="base:metadata">
				<xsl:attribute name="xsi:nil">true</xsl:attribute>
			</xsl:element>
			<xsl:for-each select="gml:featureMember[fme:InwatA/fme:F_CODE='BH130' or fme:InwatA/fme:F_CODE='BH080']" xmlns:gml="http://www.opengis.net/gml">
				<base:member>
					<hy-p:StandingWater xmlns:gml="http://www.opengis.net/gml/3.2">
						<xsl:attribute name="gml:id">WC_A_<xsl:number/></xsl:attribute>
						<xsl:choose>
							<xsl:when test="fme:InwatA/fme:MN1='UNK' or fme:InwatA/fme:MN1=''">
								<hy-p:geographicalName nilReason="UNPOPULATED" xsi:nil="true"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:element name="hy-p:geographicalName">
									<gn:GeographicalName>
										<gn:language>
											<xsl:value-of select="fme:InwatA/fme:LN1" xmlns:gml="http://www.opengis.net/gml"/>
										</gn:language>
										<gn:nativeness>endonym</gn:nativeness>
										<gn:nameStatus>official</gn:nameStatus>
										<gn:sourceOfName xsi:nil="true"/>
										<gn:pronunciation xsi:nil="true"/>
										<gn:spelling>
											<gn:SpellingOfName>
												<gn:text>
													<xsl:value-of select="fme:InwatA/fme:MN1" xmlns:gml="http://www.opengis.net/gml"/>
												</gn:text>
												<gn:script>Latn</gn:script>
											</gn:SpellingOfName>
										</gn:spelling>
										<gn:grammaticalGender xsi:nil="true"/>
										<gn:grammaticalNumber xsi:nil="true"/>
									</gn:GeographicalName>
								</xsl:element>
							</xsl:otherwise>
						</xsl:choose>
						<hy-p:hydroId nilReason="UNPOPULATED" xsi:nil="true"/>
						<hy-p:beginLifespanVersion nilReason="UNPOPULATED" xsi:nil="true"/>
						<hy-p:endLifespanVersion nilReason="UNPOPULATED" xsi:nil="true"/>
						<xsl:element name="hy-p:geometry">
							<gml:Surface>
								<xsl:attribute name="gml:id"><xsl:value-of select="concat('LineString_',generate-id())"/></xsl:attribute>
								<xsl:attribute name="srsName">urn:ogc:def:crs:EPSG::4258</xsl:attribute>
								<gml:patches>
									<gml:PolygonPatch>
										<gml:exterior>
											<gml:LinearRing>
												<gml:posList>
													<xsl:value-of select="fme:InwatA/gml:surfaceProperty/gml:Surface/gml:patches/gml:PolygonPatch/gml:exterior/gml:LinearRing/gml:posList" xmlns:gml="http://www.opengis.net/gml"/>
												</gml:posList>
											</gml:LinearRing>
										</gml:exterior>
									</gml:PolygonPatch>
								</gml:patches>
							</gml:Surface>
						</xsl:element>
						<xsl:element name="hy-p:inspireId">
							<base:Identifier>
								<base:localId>
									<xsl:value-of select="generate-id()"/>
								</base:localId>
								<base:namespace>BE.IGNB.Top250</base:namespace>
							</base:Identifier>
						</xsl:element>
						<hy-p:levelOfDetail>
							<gmd:MD_Resolution>
								<gmd:equivalentScale>
									<gmd:MD_RepresentativeFraction>
										<gmd:denominator>
											<gco:Integer>250</gco:Integer>
										</gmd:denominator>
									</gmd:MD_RepresentativeFraction>
								</gmd:equivalentScale>
							</gmd:MD_Resolution>
						</hy-p:levelOfDetail>
						<xsl:choose>
							<xsl:when test="fme:InwatA/fme:F_CODE='BH080'">
								<hy-p:localType>
									<gmd:LocalisedCharacterString>Lac</gmd:LocalisedCharacterString>
								</hy-p:localType>
							</xsl:when>
							<xsl:otherwise>
								<hy-p:localType>
									<gmd:LocalisedCharacterString>Réservoir</gmd:LocalisedCharacterString>
								</hy-p:localType>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="fme:InwatA/fme:F_CODE_='BH080'">
								<hy-p:origin>natural</hy-p:origin>
							</xsl:when>
							<xsl:otherwise>
								<hy-p:origin>manMade</hy-p:origin>
							</xsl:otherwise>
						</xsl:choose>
						<hy-p:persistence>Perennial</hy-p:persistence>
						<hy-p:tidal nilReason="UNPOPULATED" xsi:nil="true"/>
						<hy-p:drainsBasin xsi:nil="true"/>
						<hy-p:elevation nilReason="UNPOPULATED" uom="m" xsi:nil="true"/>
						<hy-p:meanDepth nilReason="UNPOPULATED" uom="m" xsi:nil="true"/>
						<hy-p:surfaceArea uom="sqrm">
							<xsl:value-of select="fme:InwatA/fme:Shape_Area" xmlns:gml="http://www.opengis.net/gml"/>
						</hy-p:surfaceArea>
					</hy-p:StandingWater>
				</base:member>
			</xsl:for-each>
		</base:SpatialDataSet>
	</xsl:template>
</xsl:stylesheet>
