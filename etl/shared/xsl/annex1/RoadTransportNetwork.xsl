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

	<xsl:include href="GeographicalNames.xsl"/>

	<!-- Generate TN element TN-RO.RoadArea -->
	<xsl:template name="TN-RO.RoadArea" priority="1">
		<xsl:param name="idPrefix"/>
		<xsl:param name="localId"/>
		<xsl:param name="name"/>
		<!-- TODO with-lower, width-upper vars -->

		<!-- Create gml Id by concatenating idPrefix and local id -->
		<xsl:variable name="gmlId">
			<xsl:value-of select="concat($idPrefix,'.',$localId)"/>
		</xsl:variable>

		<base:member>
			<TN-RO:RoadArea gml:id="{$gmlId}">

				<!-- START: From Network.xsd:NetworkElementType -->
				<xsl:call-template name="TN-RO.NetworkElementTypeProperties">
					<xsl:with-param name="idPrefix">
						<xsl:value-of select="$idPrefix"/>
					</xsl:with-param>
					<xsl:with-param name="localId">
						<xsl:value-of select="$localId"/>
					</xsl:with-param>
				</xsl:call-template>
				<!-- END: From Network.xsd:NetworkElementType -->

				<!-- START: From Network.xsd:NetworkAreaType -->
				<NET:geometry>
					<!-- This is locally specific -->
					<xsl:call-template name="createGeom">
						<xsl:with-param name="id">
							<xsl:value-of select="$gmlId"/>
						</xsl:with-param>
					</xsl:call-template>
				</NET:geometry>
				<!-- END: From Network.xsd:NetworkAreaType -->

				<!-- START: From CommonTransportElements.xsd:TransportAreaType -->
				<xsl:call-template name="TN.CommonTransportProperties">
					<xsl:with-param name="name">
						<xsl:value-of select="$name"/>
					</xsl:with-param>
				</xsl:call-template>
				<!-- END: From CommonTransportElements.xsd:TransportAreaType -->

			</TN-RO:RoadArea>
		</base:member>
	</xsl:template>

	<!-- Generate TN element TN-RO.RoadLink -->
	<xsl:template name="TN-RO.RoadLink" priority="1">
		<xsl:param name="idPrefix"/>
		<xsl:param name="localId"/>
		<xsl:param name="name"/>
		<!-- TODO with-lower, width-upper vars -->

		<!-- Create gml Id by concatenating idPrefix and local id -->
		<xsl:variable name="gmlId">
			<xsl:value-of select="concat($idPrefix,'.',$localId)"/>
		</xsl:variable>

		<base:member>
			<TN-RO:RoadLink gml:id="{$gmlId}">

				<!-- START: From Network.xsd:NetworkElementType -->
				<xsl:call-template name="TN-RO.NetworkElementTypeProperties">
					<xsl:with-param name="idPrefix">
						<xsl:value-of select="$idPrefix"/>
					</xsl:with-param>
					<xsl:with-param name="localId">
						<xsl:value-of select="$localId"/>
					</xsl:with-param>
				</xsl:call-template>
				<!-- END: From Network.xsd:NetworkElementType -->

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

				<!-- START: From CommonTransportElements.xsd:TransportLinkType -->
				<xsl:call-template name="TN.CommonTransportProperties">
					<xsl:with-param name="name">
						<xsl:value-of select="$name"/>
					</xsl:with-param>
				</xsl:call-template>
				<!-- END: From CommonTransportElements.xsd:TransportLinkType -->

			</TN-RO:RoadLink>
		</base:member>
	</xsl:template>

	<!-- Generate TN element TN-RO.RoadNode -->
	<xsl:template name="TN-RO.RoadNode" priority="1">
		<xsl:param name="idPrefix"/>
		<xsl:param name="localId"/>
		<xsl:param name="name"/>
		<xsl:param name="formOfRoadNode"/>

		<!-- Create gml Id by concatenating idPrefix and local id -->
		<xsl:variable name="gmlId">
			<xsl:value-of select="concat($idPrefix,'.',$localId)"/>
		</xsl:variable>

		<base:member>
			<TN-RO:RoadNode gml:id="{$gmlId}">

				<!-- START: From Network.xsd:NetworkElementType -->
				<xsl:call-template name="TN-RO.NetworkElementTypeProperties">
					<xsl:with-param name="idPrefix">
						<xsl:value-of select="$idPrefix"/>
					</xsl:with-param>
					<xsl:with-param name="localId">
						<xsl:value-of select="$localId"/>
					</xsl:with-param>
				</xsl:call-template>
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
				<NET:spokeEnd xsi:nil="true" nilReason="other:unpopulated"/>
				<NET:spokeStart xsi:nil="true" nilReason="other:unpopulated"/>  -->

				<!-- START: From CommonTransportElements.xsd:TransportNodeType -->
				<xsl:call-template name="TN.CommonTransportProperties">
					<xsl:with-param name="name">
						<xsl:value-of select="$name"/>
					</xsl:with-param>
				</xsl:call-template>
				<!-- END: From CommonTransportElements.xsd:TransportNodeType -->
				
				<TN-RO:formOfRoadNode codeSpace="{$formOfRoadNodeValueCodeSpace}">
					<xsl:value-of select="$formOfRoadNode"/>
				</TN-RO:formOfRoadNode>
  
			</TN-RO:RoadNode>
		</base:member>
	</xsl:template>

	<!-- Below are common templates -->

	<!-- Generate common Properties for TN-RO.RoadNode/Link/Area Types -->
	<xsl:template name="TN-RO.NetworkElementTypeProperties" priority="1">
		<xsl:param name="idPrefix"/>
		<xsl:param name="localId"/>

		<!-- Create gml Id by concatenating idPrefix and local id -->
		<xsl:variable name="gmlId">
			<xsl:value-of select="concat($idPrefix,'.',$localId)"/>
		</xsl:variable>

		<xsl:call-template name="GML.Identifier">
			<xsl:with-param name="id">
				<xsl:value-of select="$gmlId"/>
			</xsl:with-param>
		</xsl:call-template>

		<!-- START: From Network.xsd:NetworkElementType -->
		<NET:beginLifespanVersion xsi:nil="true" nilReason="other:unpopulated"/>
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
		<NET:endLifespanVersion xsi:nil="true" nilReason="other:unpopulated"/>
		<NET:inNetwork xsi:nil="true" nilReason="other:unpopulated"/>
		<!-- END: From Network.xsd:NetworkElementType -->

	</xsl:template>

	<!-- Generate optional Property for TN-RO.RoadNode/Link/Area Types -->
	<xsl:template name="TN.CommonTransportProperties" priority="1">
		<xsl:param name="name" select="''"/>

		<xsl:choose>
			<!-- Name is optional: only generate a GeographicalName when present otherwise make nil -->
			<xsl:when test="$name != ''">
				<TN:geographicalName>
					<!-- Generate minimal GeographicalName -->
					<xsl:call-template name="GN.GeographicalName.Minimal">
						<xsl:with-param name="name">
							<xsl:value-of select="$name"/>
						</xsl:with-param>
					</xsl:call-template>
				</TN:geographicalName>
			</xsl:when>
			<xsl:otherwise>
				<TN:geographicalName xsi:nil="true" nilReason="other:unpopulated"></TN:geographicalName>
			</xsl:otherwise>
		</xsl:choose>

		<TN:validFrom xsi:nil="true" nilReason="other:unpopulated"/>
		<TN:validTo xsi:nil="true" nilReason="other:unpopulated"/>


	</xsl:template>

</xsl:stylesheet>
