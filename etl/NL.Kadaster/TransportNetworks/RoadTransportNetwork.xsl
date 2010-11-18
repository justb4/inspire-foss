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

Generic XSL to generate TN-RO-related elements.

Author:  Just van den Broecke, Just Objects B.V. for Dutch Kadaster

Requires:
	<xsl:include href="../xsl/constants.xsl"/>

	A callable template "createMultiSurface" for example
	<xsl:include href="../xsl/gml2-to-gml3.2.1-geometry.xsl"/>
-->
<xsl:stylesheet version="1.0"
				xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2"
				xmlns:gml="http://www.opengis.net/gml/3.2"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:NET="urn:x-inspire:specification:gmlas:Network:3.2"
				xmlns:TN="urn:x-inspire:specification:gmlas:CommonTransportElements:3.0"
				xmlns:TN-RO="urn:x-inspire:specification:gmlas:RoadTransportNetwork:3.0">

	<xsl:include href="../GeographicalNames/GeographicalNames.xsl"/>

	<!-- Generate TN element TN-RO.RoadLink -->
	<xsl:template name="TN-RO.RoadLink" priority="1">
		<xsl:param name="idPrefix"/>
		<xsl:param name="localId"/>
		<!-- TODO with-lower, width-upper vars -->

		<!-- Create gml Id by concatenating idPrefix and local id -->
		<xsl:variable name="gmlId">
			<xsl:value-of select="concat($idPrefix,'.',$localId)"/>
		</xsl:variable>

		<base:member>
			<TN-RO:RoadLink gml:id="{$gmlId}">

				<!-- START: From Network.xsd:NetworkElementType -->
				<NET:beginLifespanVersion xsi:nil="true" nilReason="UNKNOWN"/>
				<NET:inspireId>
					<!-- Generate INSPIRE id -->
					<xsl:call-template name="Base.InspireId">
						<xsl:with-param name="localId">
							<xsl:value-of select="$localId"/>
						</xsl:with-param>
						<xsl:with-param name="idPrefix">
							<xsl:value-of select="$idPrefix"/>
						</xsl:with-param>
					</xsl:call-template>
				</NET:inspireId>
				<NET:endLifespanVersion xsi:nil="true" nilReason="UNKNOWN"/>
				<NET:inNetwork xsi:nil="true" nilReason="UNKNOWN"/>

				<NET:centrelineGeometry>
					<!-- This is locally specific -->
					<xsl:call-template name="createGeom">
						<xsl:with-param name="id">
							<xsl:value-of select="$gmlId"/>
						</xsl:with-param>
					</xsl:call-template>
				</NET:centrelineGeometry>
				<NET:fictitious>true</NET:fictitious>
				<!-- END: From Network.xsd:NetworkElementType -->

				<!-- <NET:endNode xlink:href="#TNRO_RNode_00000013"></NET:endNode>
				<NET:startNode xlink:href="#TNRO_RNode_00000013"></NET:startNode> -->

				<!-- END: From CommonTransportElements.xsd:LinkType -->

				<!-- START: From CommonTransportElements.xsd:TransportLinkType -->
				<TN:validFrom xsi:nil="true" nilReason="UNKNOWN"/>
				<TN:validTo xsi:nil="true" nilReason="UNKNOWN"/>
				<!-- END: From CommonTransportElements.xsd:TransportLinkType -->

			</TN-RO:RoadLink>
		</base:member>
	</xsl:template>

	<!-- Generate TN element TN-RO.RoadNode -->
	<xsl:template name="TN-RO.RoadNode" priority="1">
		<xsl:param name="idPrefix"/>
		<xsl:param name="localId"/>
		<xsl:param name="formOfRoadNode"/>

		<!-- Create gml Id by concatenating idPrefix and local id -->
		<xsl:variable name="gmlId">
			<xsl:value-of select="concat($idPrefix,'.',$localId)"/>
		</xsl:variable>

		<base:member>
			<TN-RO:RoadNode gml:id="{$gmlId}">

				<!-- START: From Network.xsd:NetworkElementType -->
				<NET:beginLifespanVersion xsi:nil="true" nilReason="UNKNOWN"/>
				<NET:inspireId>
					<!-- Generate INSPIRE id -->
					<xsl:call-template name="Base.InspireId">
						<xsl:with-param name="localId">
							<xsl:value-of select="$localId"/>
						</xsl:with-param>
						<xsl:with-param name="idPrefix">
							<xsl:value-of select="$idPrefix"/>
						</xsl:with-param>
					</xsl:call-template>
				</NET:inspireId>
				<NET:endLifespanVersion xsi:nil="true" nilReason="UNKNOWN"/>
				<NET:inNetwork xsi:nil="true" nilReason="UNKNOWN"/>
				<!-- END: From Network.xsd:NetworkElementType -->

				<!-- START: From CommonTransportElements.xsd:LinkType -->
				<NET:geometry>
					<!-- This is locally specific -->
					<xsl:call-template name="createGeom">
						<xsl:with-param name="id">
							<xsl:value-of select="$gmlId"/>
						</xsl:with-param>
					</xsl:call-template>
				</NET:geometry>

				<!-- 
				<NET:spokeEnd xsi:nil="true" nilReason="UNKNOWN"/>
				<NET:spokeStart xsi:nil="true" nilReason="UNKNOWN"/>  -->

				<!-- END: From CommonTransportElements.xsd:LinkType -->
				<!-- START: From CommonTransportElements.xsd:TransportLinkType -->
				<TN:validFrom xsi:nil="true" nilReason="UNKNOWN"/>
				<TN:validTo xsi:nil="true" nilReason="UNKNOWN"/>
				<!-- END: From CommonTransportElements.xsd:TransportLinkType -->
				<TN-RO:formOfRoadNode>
					<xsl:value-of select="$formOfRoadNode"/>
				</TN-RO:formOfRoadNode>
  
			</TN-RO:RoadNode>
		</base:member>
	</xsl:template>

	<!-- below is old stuff from HY for reuse and ref -->

	<!-- Generate Hydrography element TN-RO.DamOrWeir -->
	<xsl:template name="TN-RO.DamOrWeir" priority="1">
		<xsl:param name="idPrefix"/>
		<xsl:param name="localId"/>
		<xsl:param name="status"/>

		<!-- Create gml Id by concatenating idPrefix and local id -->
		<xsl:variable name="gmlId">
			<xsl:value-of select="concat($idPrefix,'.',$localId)"/>
		</xsl:variable>

		<base:member>
			<TN-RO:DamOrWeir gml:id="{$gmlId}">
				<!--  Generate Base class ManMadeObject Elements -->
				<xsl:call-template name="TN-RO.ManMadeObjectProperties">
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

			</TN-RO:DamOrWeir>
		</base:member>
	</xsl:template>

	<!-- Generate Hydrography element TN-RO.Lock -->
	<xsl:template name="TN-RO.Lock" priority="1">
		<xsl:param name="idPrefix"/>
		<xsl:param name="localId"/>
		<xsl:param name="status"/>

		<!-- Create gml Id by concatenating idPrefix and local id -->
		<xsl:variable name="gmlId">
			<xsl:value-of select="concat($idPrefix,'.',$localId)"/>
		</xsl:variable>

		<base:member>
			<TN-RO:Lock gml:id="{$gmlId}">
				<!--  Generate Base class ManMadeObject Elements -->
				<xsl:call-template name="TN-RO.ManMadeObjectProperties">
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
			</TN-RO:Lock>
		</base:member>
	</xsl:template>


	<!-- Generate Hydrography element TN-RO.StandingWater -->
	<xsl:template name="TN-RO.StandingWater" priority="1">
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
			<TN-RO:StandingWater gml:id="{$gmlId}">

				<!--  Generate Base class SurfaceWater Elements -->
				<xsl:call-template name="TN-RO.SurfaceWaterProperties">
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
				<TN-RO:elevation uom="m">
					<xsl:value-of select="$elevation"/>
				</TN-RO:elevation>

				<!-- meanDepth: nill -->
				<TN-RO:meanDepth xsi:nil="true" nilReason="UNPOPULATED" uom="m"></TN-RO:meanDepth>

				<!-- not available: nill   <TN-RO:surfaceArea uom="sqrm">96897.6577988</TN-RO:surfaceArea>  -->
				<TN-RO:surfaceArea xsi:nil="true" nilReason="UNPOPULATED" uom="m"></TN-RO:surfaceArea>

			</TN-RO:StandingWater>
		</base:member>
	</xsl:template>


	<!-- Generate common Properties for TN-RO.Lock TN-RO.DamOrWeir -->
	<xsl:template name="TN-RO.ManMadeObjectProperties" priority="1">
		<xsl:param name="idPrefix"/>
		<xsl:param name="localId"/>
		<xsl:param name="status"/>

		<!-- Create gml Id by concatenating idPrefix and local id -->
		<xsl:variable name="gmlId">
			<xsl:value-of select="concat($idPrefix,'.',$localId)"/>
		</xsl:variable>

		<TN-RO:geographicalName xsi:nil="true" nilReason="UNPOPULATED"></TN-RO:geographicalName>
		<TN-RO:hydroId xsi:nil="true" nilReason="UNPOPULATED"></TN-RO:hydroId>
		<TN-RO:beginLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"></TN-RO:beginLifespanVersion>
		<TN-RO:condition>
			<xsl:value-of select="$status"/>
		</TN-RO:condition>
		<TN-RO:endLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"></TN-RO:endLifespanVersion>

		<TN-RO:geometry>

			<!-- This is locally specific -->
			<xsl:call-template name="createGeom">
				<xsl:with-param name="id">
					<xsl:value-of select="$gmlId"/>
				</xsl:with-param>
			</xsl:call-template>

		</TN-RO:geometry>


		<!-- Generate INSPIRE id -->
		<TN-RO:inspireId>
			<xsl:call-template name="Base.InspireId">
				<xsl:with-param name="localId">
					<xsl:value-of select="$localId"/>
				</xsl:with-param>
				<xsl:with-param name="idPrefix">
					<xsl:value-of select="$idPrefix"/>
				</xsl:with-param>
			</xsl:call-template>
		</TN-RO:inspireId>
	</xsl:template>

	<!-- Generate Hydrography base elements for SurfaceWater common to TN-RO.StandingWater and TN-RO.Watercourse -->
	<xsl:template name="TN-RO.SurfaceWaterProperties" priority="1">
		<xsl:param name="name"/>
		<xsl:param name="idPrefix"/>
		<xsl:param name="localId"/>
		<xsl:param name="localType"/>
		<!-- TODO with-lower, width-upper vars -->

		<!-- Create gml Id by concatenating idPrefix and local id -->
		<xsl:variable name="gmlId">
			<xsl:value-of select="concat($idPrefix,'.',$localId)"/>
		</xsl:variable>

		<xsl:choose>
			<!-- Name is optional: only generate a GeographicalName when present otherwise make nil -->
			<xsl:when test="$name != ''">
				<TN-RO:geographicalName>
					<!-- Generate minimal GeographicalName -->
					<xsl:call-template name="GN.GeographicalName.Minimal">
						<xsl:with-param name="name">
							<xsl:value-of select="$name"/>
						</xsl:with-param>
					</xsl:call-template>
				</TN-RO:geographicalName>
			</xsl:when>
			<xsl:otherwise>
				<TN-RO:geographicalName xsi:nil="true" nilReason="UNPOPULATED"></TN-RO:geographicalName>
			</xsl:otherwise>
		</xsl:choose>

		<TN-RO:hydroId xsi:nil="true" nilReason="UNPOPULATED"></TN-RO:hydroId>

		<!-- TODO: optional populate -->
		<TN-RO:beginLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"></TN-RO:beginLifespanVersion>
		<TN-RO:endLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"></TN-RO:endLifespanVersion>

		<TN-RO:geometry>

			<!-- This is locally specific -->
			<xsl:call-template name="createGeom">
				<xsl:with-param name="id">
					<xsl:value-of select="$gmlId"/>
				</xsl:with-param>
			</xsl:call-template>

		</TN-RO:geometry>

		<!-- Generate INSPIRE id -->
		<TN-RO:inspireId>
			<xsl:call-template name="Base.InspireId">
				<xsl:with-param name="localId">
					<xsl:value-of select="$localId"/>
				</xsl:with-param>
				<xsl:with-param name="idPrefix">
					<xsl:value-of select="$idPrefix"/>
				</xsl:with-param>
			</xsl:call-template>
		</TN-RO:inspireId>

		<!--
				not required - leave out for now
				<TN-RO:levelOfDetail xmlns:app4="http://www.isotc211.org/2005/gmd">
					<app4:MD_Resolution>
						<app4:equivalentScale>
							<app4:MD_RepresentativeFraction>
								<app4:denominator xmlns:app12="http://www.isotc211.org/2005/gco">
									<app12:Integer>250</app12:Integer>

								</app4:denominator>
							</app4:MD_RepresentativeFraction>
						</app4:equivalentScale>
					</app4:MD_Resolution>
				</TN-RO:levelOfDetail>   -->

		<TN-RO:localType xmlns:app4="http://www.isotc211.org/2005/gmd">
			<app4:LocalisedCharacterString>
				<xsl:value-of select="$localType"/>
			</app4:LocalisedCharacterString>
		</TN-RO:localType>

		<!-- not available: nill <TN-RO:origin>manMade</TN-RO:origin>  -->
		<TN-RO:origin xsi:nil="true" nilReason="UNPOPULATED"></TN-RO:origin>

		<!-- not available: nill  <TN-RO:persistence>Perennial</TN-RO:persistence> -->
		<TN-RO:persistence xsi:nil="true" nilReason="UNPOPULATED"></TN-RO:persistence>

		<!-- not available: leave out -->
		<TN-RO:tidal xsi:nil="true" nilReason="UNPOPULATED"></TN-RO:tidal>

		<!-- drainsBasin: nill -->
		<TN-RO:drainsBasin xsi:nil="true" nilReason="UNPOPULATED"/>

	</xsl:template>

</xsl:stylesheet>
