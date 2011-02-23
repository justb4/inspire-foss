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

Callable templates to generate elements for GeographicalNames theme.

Author:  Just van den Broecke, Just Objects B.V. for Dutch Kadaster

GeographicalNames appear in multiple INSPIRE  data themes. The callable
XSL templates are reusable by other data theme XSL templates.
See ../AdministrativeUnits/AdministrativeUnits.xsl for an example.

Requires local constants like "organisation", for example:
	<xsl:include href="../xsl/constants.xsl"/>

-->
<xsl:stylesheet version="1.0"
				xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2"
				xmlns:gmd="http://www.isotc211.org/2005/gmd"
				xmlns:gml="http://www.opengis.net/gml/3.2"
				xmlns:xlink="http://www.w3.org/1999/xlink"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:GN="urn:x-inspire:specification:gmlas:GeographicalNames:3.0">

<!--
Minimal version of a NamedPlace  (Dutch Kadaster)

    <GN:NamedPlace gml:id="NL.KAD.GN.NL.TOP10NL.103075153">
      <GN:beginLifespanVersion xsi:nil="true" nilReason="UNKNOWN"/>
      <GN:endLifespanVersion xsi:nil="true" nilReason="UNKNOWN"/>
      <GN:geometry>
        <gml:Point srsName="urn:ogc:def:crs:EPSG::4258" gml:id="NL.KAD.GN.NL.TOP10NL.103075153.PT">
          <gml:pos>6.155809601724485 52.024706052471238</gml:pos>
        </gml:Point>
      </GN:geometry>
      <GN:inspireId>
        <base:Identifier>
          <base:localId>NL.TOP10NL.103075153</base:localId>
          <base:namespace>NL.KAD.GN</base:namespace>
        </base:Identifier>
      </GN:inspireId>
      <GN:localType>
        <gmd:LocalisedCharacterString locale="nl-NL">streek, veld</gmd:LocalisedCharacterString>
      </GN:localType>
      <GN:name>
        <GN:GeographicalName>
          <GN:language xsi:nil="true"/>
          <GN:nativeness>endonym</GN:nativeness>
          <GN:nameStatus>official</GN:nameStatus>
          <GN:sourceOfName>Het Kadaster</GN:sourceOfName>
          <GN:pronunciation xsi:nil="true"/>
          <GN:spelling>
            <GN:SpellingOfName>
              <GN:text>De Grind</GN:text>
              <GN:script>Latn</GN:script>
            </GN:SpellingOfName>
          </GN:spelling>
          <GN:grammaticalGender xsi:nil="true"/>
          <GN:grammaticalNumber xsi:nil="true"/>
        </GN:GeographicalName>
      </GN:name>
      <GN:relatedSpatialObject xsi:nil="true" nilReason="UNKNOWN"/>
      <GN:type>landcover</GN:type>
    </GN:NamedPlace>
-->
	<!-- Generate NamedPlace element -->
	<xsl:template name="GN.NamedPlace" priority="1">
		<xsl:param name="idPrefix"/>
		<xsl:param name="localId"/>
		<xsl:param name="point"/>
		<xsl:param name="name"/>
		<xsl:param name="localType"/>
		<xsl:param name="type"/>

		<!-- Create gml Id by concatenating idPrefix and local id -->
		<xsl:variable name="gmlId"><xsl:value-of select="concat($idPrefix,'.',$localId)"/></xsl:variable>
		<xsl:variable name="pointId"><xsl:value-of select="concat($gmlId,'.PT')"/></xsl:variable>

		<base:member>
			<GN:NamedPlace gml:id="{$gmlId}">

				<xsl:call-template name="GML.Identifier">
					<xsl:with-param name="id">
						<xsl:value-of select="$gmlId"/>
					</xsl:with-param>
				</xsl:call-template>

				<GN:beginLifespanVersion xsi:nil="true" nilReason="UNKNOWN"></GN:beginLifespanVersion>
				<GN:endLifespanVersion xsi:nil="true" nilReason="UNKNOWN"></GN:endLifespanVersion>
   
				<!-- Generate Point geometry -->
				<GN:geometry>
					<!-- Generate gML3 Point with coordinates swapped -->
					<xsl:call-template name="createPoint">
						<xsl:with-param name="pointId">
							<xsl:value-of select="$pointId"/>
						</xsl:with-param>
						<xsl:with-param name="point">
							<xsl:value-of select="$point"/>
						</xsl:with-param>
					</xsl:call-template>
				</GN:geometry>

				<!-- Generate INSPIRE id -->
				<GN:inspireId>
					<xsl:call-template name="Base.InspireId">
						<xsl:with-param name="localId">
							<xsl:value-of select="$localId"/>
						</xsl:with-param>
						<xsl:with-param name="idPrefix">
							<xsl:value-of select="$idPrefix"/>
						</xsl:with-param>
					</xsl:call-template>
				</GN:inspireId>


				<GN:localType>
					<xsl:call-template name="GMD.LocalisedCharacterString">
						<xsl:with-param name="value">
							<xsl:value-of select="$localType"/>
						</xsl:with-param>
					</xsl:call-template>
				</GN:localType>

				<GN:name>
					<!-- Generate minimal GeographicalName -->
					<xsl:call-template name="GN.GeographicalName.Minimal">
						<xsl:with-param name="name">
							<xsl:value-of select="$name"/>
						</xsl:with-param>
					</xsl:call-template>
				</GN:name>

				<GN:relatedSpatialObject xsi:nil="true" nilReason="other:unpopulated"></GN:relatedSpatialObject>
				<GN:type codeSpace="{$namedPlaceTypeValueCodeSpace}"><xsl:value-of select="$type"/></GN:type>

			</GN:NamedPlace>
		</base:member>
	</xsl:template>

	<!-- Generate minimal GeographicalName element -->
	<xsl:template name="GN.GeographicalName.Minimal" priority="1">
		<xsl:param name="name"/>
		<xsl:param name="nativeness" select="'endonym'"/>
		<xsl:param name="nameStatus" select="'official'"/>
		<xsl:param name="sourceOfName" select="$organisation"/>
		<xsl:param name="script" select="'Latn'"/>

		<GN:GeographicalName>
			<GN:language xsi:nil="true"/>
			<GN:nativeness codeSpace="{$nativenessValueCodeSpace}">
				<xsl:value-of select="$nativeness"/>
			</GN:nativeness>
			<GN:nameStatus codeSpace="{$nameStatusValueCodeSpace}">
				<xsl:value-of select="$nameStatus"/>
			</GN:nameStatus>
			<GN:sourceOfName>
				<xsl:value-of select="$sourceOfName"/>
			</GN:sourceOfName>
			<GN:pronunciation xsi:nil="true" nilReason="other:unpopulated"/>

			<GN:spelling>
				<GN:SpellingOfName>
					<GN:text>
						<xsl:value-of select="$name"/>
					</GN:text>
					<GN:script>
						<xsl:value-of select="$script"/>
					</GN:script>
				</GN:SpellingOfName>
			</GN:spelling>
			<GN:grammaticalGender xsi:nil="true"/>
			<GN:grammaticalNumber xsi:nil="true"/>
		</GN:GeographicalName>
	</xsl:template>

</xsl:stylesheet>
