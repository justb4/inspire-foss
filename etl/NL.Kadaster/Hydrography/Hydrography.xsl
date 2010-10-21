<?xml version="1.0" encoding="UTF-8"?>
<!--
  ~ Copyright (C) 2010  Het Kadaster - The Netherlands
  ~
  ~ This program is free software: you can redistribute it and/or modify
  ~ it under the terms of the GNU General Public License as published by
  ~ the Free Software Foundation, either version 3 of the License, or
  ~ (at your option) any later version.
  ~
  ~ This program is distributed in the hope that it will be useful,
  ~ but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  ~ GNU General Public License for more details.
  ~
  ~ You should have received a copy of the GNU General Public License
  ~ along with this program.  If not, see <http://www.gnu.org/licenses/>.
  -->

<!--

Generic XSL to generate HY-P-related elements.

Author:  Just van den Broecke, Just Objects B.V. for Dutch Kadaster

Requires:
	<xsl:include href="../xsl/constants.xsl"/>

	A callable template "createMultiSurface" for example
	<xsl:include href="../xsl/multipolygon-to-multisurface.xsl"/>
-->
<xsl:stylesheet version="1.0"
				xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2"
				xmlns:gml="http://www.opengis.net/gml/3.2"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:HY-P="urn:x-inspire:specification:gmlas:HydroPhysicalWaters:3.0">

	<xsl:include href="../GeographicalNames/GeographicalNames.xsl"/>

	<!-- Generate AdministrativeUnit element -->
	<xsl:template name="HY-P.StandingWater" priority="1">
		<xsl:param name="idPrefix"/>
		<xsl:param name="localId"/>

		<!-- Create gml Id by concatenating idPrefix and local id -->
		<xsl:variable name="gmlId">
			<xsl:value-of select="concat($idPrefix,'.',$localId)"/>
		</xsl:variable>

		<base:member>
			<HY-P:StandingWater gml:id="{$gmlId}">
				<HY-P:geographicalName xsi:nil="true" nilReason="UNPOPULATED"></HY-P:geographicalName>
				<HY-P:hydroId xsi:nil="true" nilReason="UNPOPULATED"></HY-P:hydroId>
				<HY-P:beginLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"></HY-P:beginLifespanVersion>
				<HY-P:endLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"></HY-P:endLifespanVersion>
				<HY-P:geometry>
					<!--Inlined geometry 'GEOMETRY_69fe457a-fcae-468b-abe2-93aafb44250c'-->

					<gml:Surface gml:id="{$gmlId}.Surface" srsName="EPSG:4258">
						<gml:patches>
							<gml:PolygonPatch>
								<gml:exterior>
									<gml:LinearRing>
										<gml:posList>51.46738903 4.74088458 51.46743465 4.74049644 51.46819379
											4.73919320
											51.46962795 4.73740615 51.47025006 4.73749757 51.47116558 4.73787830
											51.47123381
											4.73832498 51.47129516 4.73898926 51.47113105 4.73972005 51.47053568
											4.74075308
											51.46947917 4.74247123 51.46925445 4.74282733 51.46900233 4.74279736
											51.46859011
											4.74224803 51.46761397 4.74133252 51.46748018 4.74118842 51.46738903
											4.74088458
										</gml:posList>
									</gml:LinearRing>
								</gml:exterior>

							</gml:PolygonPatch>
						</gml:patches>
					</gml:Surface>
				</HY-P:geometry>

				<!-- Generate INSPIRE id -->
				<HY-P:inspireId>
					<xsl:call-template name="Base.InspireId">
						<xsl:with-param name="localId">
							<xsl:value-of select="$localId"/>
						</xsl:with-param>
						<xsl:with-param name="idPrefix">
							<xsl:value-of select="$idPrefix"/>
						</xsl:with-param>
					</xsl:call-template>
				</HY-P:inspireId>

				<HY-P:levelOfDetail xmlns:app4="http://www.isotc211.org/2005/gmd">
					<app4:MD_Resolution>
						<app4:equivalentScale>
							<app4:MD_RepresentativeFraction>
								<app4:denominator xmlns:app12="http://www.isotc211.org/2005/gco">
									<app12:Integer>250</app12:Integer>

								</app4:denominator>
							</app4:MD_RepresentativeFraction>
						</app4:equivalentScale>
					</app4:MD_Resolution>
				</HY-P:levelOfDetail>
				<HY-P:localType xmlns:app4="http://www.isotc211.org/2005/gmd">
					<app4:LocalisedCharacterString>Lac</app4:LocalisedCharacterString>
				</HY-P:localType>

				<HY-P:origin>manMade</HY-P:origin>
				<HY-P:persistence>Perennial</HY-P:persistence>
				<HY-P:tidal xsi:nil="true" nilReason="UNPOPULATED"></HY-P:tidal>
				<HY-P:drainsBasin xsi:nil="true"/>
				<HY-P:elevation xsi:nil="true" nilReason="UNPOPULATED" uom="m"></HY-P:elevation>
				<HY-P:meanDepth xsi:nil="true" nilReason="UNPOPULATED" uom="m"></HY-P:meanDepth>
				<HY-P:surfaceArea uom="sqrm">96897.6577988</HY-P:surfaceArea>

			</HY-P:StandingWater>
		</base:member>
	</xsl:template>

</xsl:stylesheet>
