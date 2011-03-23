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
	<xsl:include href="../../shared/xsl/gml2-to-gml3.2.1-geometry.xsl"/>
-->
<xsl:stylesheet version="1.0"
				xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2"
				xmlns:gml="http://www.opengis.net/gml/3.2"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:HY-P="urn:x-inspire:specification:gmlas:HydroPhysicalWaters:3.0">

	<xsl:include href="../GeographicalNames/GeographicalNames.xsl"/>

	<!-- Generate Hydrography element HY-P.DamOrWeir -->
	<xsl:template name="HY-P.DamOrWeir" priority="1">
		<xsl:param name="idPrefix"/>
		<xsl:param name="localId"/>
		<xsl:param name="status"/>

		<!-- Create gml Id by concatenating idPrefix and local id -->
		<xsl:variable name="gmlId">
			<xsl:value-of select="concat($idPrefix,'.',$localId)"/>
		</xsl:variable>

		<base:member>
			<HY-P:DamOrWeir gml:id="{$gmlId}">
				<!--  Generate Base class ManMadeObject Elements -->
				<xsl:call-template name="HY-P.ManMadeObjectProperties">
					<xsl:with-param name="idPrefix">
						<xsl:value-of select="$idPrefix"/>
					</xsl:with-param>
					<xsl:with-param name="localId">
						<xsl:value-of select="$localId"/>
					</xsl:with-param>
					<xsl:with-param name="status">
						<xsl:value-of select="$status"/>
					</xsl:with-param>
				</xsl:call-template>

			</HY-P:DamOrWeir>
		</base:member>
	</xsl:template>

	<!-- Generate Hydrography element HY-P.Lock -->
	<xsl:template name="HY-P.Lock" priority="1">
		<xsl:param name="idPrefix"/>
		<xsl:param name="localId"/>
		<xsl:param name="status"/>

		<!-- Create gml Id by concatenating idPrefix and local id -->
		<xsl:variable name="gmlId">
			<xsl:value-of select="concat($idPrefix,'.',$localId)"/>
		</xsl:variable>

		<base:member>
			<HY-P:Lock gml:id="{$gmlId}">
				<!--  Generate Base class ManMadeObject Elements -->
				<xsl:call-template name="HY-P.ManMadeObjectProperties">
					<xsl:with-param name="idPrefix">
						<xsl:value-of select="$idPrefix"/>
					</xsl:with-param>
					<xsl:with-param name="localId">
						<xsl:value-of select="$localId"/>
					</xsl:with-param>
					<xsl:with-param name="status">
						<xsl:value-of select="$status"/>
					</xsl:with-param>
				</xsl:call-template>
			</HY-P:Lock>
		</base:member>
	</xsl:template>


	<!-- Generate Hydrography element HY-P.StandingWater -->
	<xsl:template name="HY-P.StandingWater" priority="1">
		<xsl:param name="name"/>
		<xsl:param name="idPrefix"/>
		<xsl:param name="localId"/>
		<xsl:param name="localType"/>
		<xsl:param name="elevation"/>

		<!-- Create gml Id by concatenating idPrefix and local id -->
		<xsl:variable name="gmlId">
			<xsl:value-of select="concat($idPrefix,'.',$localId)"/>
		</xsl:variable>

		<base:member>
			<HY-P:StandingWater gml:id="{$gmlId}">

				<!--  Generate Base class SurfaceWater Elements -->
				<xsl:call-template name="HY-P.SurfaceWaterProperties">
					<xsl:with-param name="name">
						<xsl:value-of select="$name"/>
					</xsl:with-param>
					<xsl:with-param name="idPrefix">
						<xsl:value-of select="$idPrefix"/>
					</xsl:with-param>
					<xsl:with-param name="localId">
						<xsl:value-of select="$localId"/>
					</xsl:with-param>
					<xsl:with-param name="localType">
						<xsl:value-of select="$localType"/>
					</xsl:with-param>
				</xsl:call-template>


				<!-- Properties below are specific to StandingWater -->

				<!-- TODO: make optional -->
				<HY-P:elevation uom="{$lengthUOM}">
					<xsl:value-of select="$elevation"/>
				</HY-P:elevation>

				<!-- meanDepth: nill -->
				<HY-P:meanDepth xsi:nil="true" nilReason="other:unpopulated" uom="{$lengthUOM}"></HY-P:meanDepth>

				<!-- not available: nill   <HY-P:surfaceArea uom="sqrm">96897.6577988</HY-P:surfaceArea>  -->
				<HY-P:surfaceArea xsi:nil="true" nilReason="other:unpopulated" uom="{$lengthUOM}"></HY-P:surfaceArea>

			</HY-P:StandingWater>
		</base:member>
	</xsl:template>

	<!-- Generate Hydrography element HY-P.StandingWater -->
	<xsl:template name="HY-P.Watercourse" priority="1">
		<xsl:param name="name"/>
		<xsl:param name="idPrefix"/>
		<xsl:param name="localId"/>
		<xsl:param name="localType"/>
		<!-- TODO with-lower, width-upper vars -->

		<!-- Create gml Id by concatenating idPrefix and local id -->
		<xsl:variable name="gmlId">
			<xsl:value-of select="concat($idPrefix,'.',$localId)"/>
		</xsl:variable>

		<base:member>
			<HY-P:Watercourse gml:id="{$gmlId}">

				<!--  Generate Base class SurfaceWater Elements -->
				<xsl:call-template name="HY-P.SurfaceWaterProperties">
					<xsl:with-param name="name">
						<xsl:value-of select="$name"/>
					</xsl:with-param>
					<xsl:with-param name="idPrefix">
						<xsl:value-of select="$idPrefix"/>
					</xsl:with-param>
					<xsl:with-param name="localId">
						<xsl:value-of select="$localId"/>
					</xsl:with-param>
					<xsl:with-param name="localType">
						<xsl:value-of select="$localType"/>
					</xsl:with-param>
				</xsl:call-template>

				<!-- Properties below are specific to Watercourse -->

				<!-- Leave out <condition> for now -->

				<!-- delineationKnown: not available: leave out -->
				<HY-P:delineationKnown xsi:nil="true" nilReason="other:unpopulated"></HY-P:delineationKnown>

				<!-- length: nill -->
				<HY-P:length xsi:nil="true" nilReason="other:unpopulated" uom="{$lengthUOM}"></HY-P:length>

				<!-- level: nill -->
				<HY-P:level xsi:nil="true" nilReason="other:unpopulated"></HY-P:level>

				<!-- Leave out <streamOrder> for now -->

				<!-- TODO width: nill -->
				<HY-P:width xsi:nil="true" nilReason="other:unpopulated"></HY-P:width>

			</HY-P:Watercourse>
		</base:member>
	</xsl:template>

	<!-- Generate common Properties for HY-P.Lock HY-P.DamOrWeir -->
	<xsl:template name="HY-P.ManMadeObjectProperties" priority="1">
		<xsl:param name="idPrefix"/>
		<xsl:param name="localId"/>
		<xsl:param name="status"/>

		<!-- Create gml Id by concatenating idPrefix and local id -->
		<xsl:variable name="gmlId">
			<xsl:value-of select="concat($idPrefix,'.',$localId)"/>
		</xsl:variable>

		<xsl:call-template name="GML.Identifier">
			<xsl:with-param name="id">
				<xsl:value-of select="$gmlId"/>
			</xsl:with-param>
		</xsl:call-template>

		<HY-P:geographicalName xsi:nil="true" nilReason="other:unpopulated"></HY-P:geographicalName>
		<HY-P:hydroId xsi:nil="true" nilReason="other:unpopulated"></HY-P:hydroId>
		<HY-P:beginLifespanVersion xsi:nil="true" nilReason="other:unpopulated"></HY-P:beginLifespanVersion>
		<HY-P:condition codeSpace="{$conditionOfFacilityValueCodeSpace}">
			<xsl:value-of select="$status"/>
		</HY-P:condition>
		<HY-P:endLifespanVersion xsi:nil="true" nilReason="other:unpopulated"></HY-P:endLifespanVersion>

		<HY-P:geometry>

			<!-- This is locally specific -->
			<xsl:call-template name="createGeom">
				<xsl:with-param name="id">
					<xsl:value-of select="$gmlId"/>
				</xsl:with-param>
			</xsl:call-template>

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
	</xsl:template>

	<!-- Generate Hydrography base elements for SurfaceWater common to HY-P.StandingWater and HY-P.Watercourse -->
	<xsl:template name="HY-P.SurfaceWaterProperties" priority="1">
		<xsl:param name="name"/>
		<xsl:param name="idPrefix"/>
		<xsl:param name="localId"/>
		<xsl:param name="localType"/>
		<!-- TODO with-lower, width-upper vars -->

		<!-- Create gml Id by concatenating idPrefix and local id -->
		<xsl:variable name="gmlId">
			<xsl:value-of select="concat($idPrefix,'.',$localId)"/>
		</xsl:variable>

		<xsl:call-template name="GML.Identifier">
			<xsl:with-param name="id">
				<xsl:value-of select="$gmlId"/>
			</xsl:with-param>
		</xsl:call-template>

		<xsl:choose>
			<!-- Name is optional: only generate a GeographicalName when present otherwise make nil -->
			<xsl:when test="$name != ''">
				<HY-P:geographicalName>
					<!-- Generate minimal GeographicalName -->
					<xsl:call-template name="GN.GeographicalName.Minimal">
						<xsl:with-param name="name">
							<xsl:value-of select="$name"/>
						</xsl:with-param>
					</xsl:call-template>
				</HY-P:geographicalName>
			</xsl:when>
			<xsl:otherwise>
				<HY-P:geographicalName xsi:nil="true" nilReason="other:unpopulated"></HY-P:geographicalName>
			</xsl:otherwise>
		</xsl:choose>

		<HY-P:hydroId xsi:nil="true" nilReason="other:unpopulated"></HY-P:hydroId>

		<!-- TODO: optional populate -->
		<HY-P:beginLifespanVersion xsi:nil="true" nilReason="other:unpopulated"></HY-P:beginLifespanVersion>
		<HY-P:endLifespanVersion xsi:nil="true" nilReason="other:unpopulated"></HY-P:endLifespanVersion>

		<HY-P:geometry>

			<!-- This is locally specific -->
			<xsl:call-template name="createGeom">
				<xsl:with-param name="id">
					<xsl:value-of select="$gmlId"/>
				</xsl:with-param>
			</xsl:call-template>

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

		<!--
				not required - leave out for now
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
				</HY-P:levelOfDetail>   -->

		<HY-P:localType>
			<xsl:call-template name="GMD.LocalisedCharacterString">
				<xsl:with-param name="value">
					<xsl:value-of select="$localType"/>
				</xsl:with-param>
			</xsl:call-template>
		</HY-P:localType>

		<!-- not available: nill <HY-P:origin>manMade</HY-P:origin>  -->
		<HY-P:origin xsi:nil="true" nilReason="other:unpopulated"></HY-P:origin>

		<!-- not available: nill  <HY-P:persistence>Perennial</HY-P:persistence> -->
		<HY-P:persistence xsi:nil="true" nilReason="other:unpopulated"></HY-P:persistence>

		<!-- not available: leave out -->
		<HY-P:tidal xsi:nil="true" nilReason="other:unpopulated"></HY-P:tidal>

		<!-- drainsBasin: nill -->
		<HY-P:drainsBasin xsi:nil="true" nilReason="other:unpopulated"/>

	</xsl:template>

</xsl:stylesheet>
