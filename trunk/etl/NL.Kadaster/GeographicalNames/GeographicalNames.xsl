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
		<gn:NamedPlace gml:id="GN_NamedPlace_47559421">
			<gn:beginLifespanVersion xsi:nil="true" nilReason="UNKNOWN"></gn:beginLifespanVersion>
			<gn:endLifespanVersion xsi:nil="true" nilReason="UNKNOWN"></gn:endLifespanVersion>
			<gn:geometry>
				<gml:MultiPoint srsName="EPSG:4258" gml:id='GN_NamedPlace_47559421_GEOM_0'>
					<gml:pointMembers>
						<gml:Point gml:id='GN_NamedPlace_47559421_GEOM_0_0'>
							<gml:pos>2.479925 50.148886</gml:pos>
						</gml:Point>
					</gml:pointMembers>
				</gml:MultiPoint>
			</gn:geometry>
			<gn:inspireId>
				<base:Identifier>
					<base:localId>FR_ldh_PAIHABIT0000000045825471</base:localId>
					<base:namespace>FR_IGNF_BDNYME</base:namespace>
					<base:versionId>1</base:versionId>
				</base:Identifier>
			</gn:inspireId>
			<gn:leastDetailedViewingResolution>
				<gmd:MD_Resolution>
					<gmd:equivalentScale>
						<gmd:MD_RepresentativeFraction>
							<gmd:denominator>
								<gco:Integer>5000</gco:Integer>
							</gmd:denominator>
						</gmd:MD_RepresentativeFraction>
					</gmd:equivalentScale>
				</gmd:MD_Resolution>
			</gn:leastDetailedViewingResolution>
			<gn:localType>
				<gmd:LocalisedCharacterString locale="fre">Lieu-dit habité</gmd:LocalisedCharacterString>
			</gn:localType>
			<gn:mostDetailedViewingResolution>
				<gmd:MD_Resolution>
					<gmd:equivalentScale>
						<gmd:MD_RepresentativeFraction>
							<gmd:denominator>
								<gco:Integer>1</gco:Integer>
							</gmd:denominator>
						</gmd:MD_RepresentativeFraction>
					</gmd:equivalentScale>
				</gmd:MD_Resolution>
			</gn:mostDetailedViewingResolution>
			<gn:name>
				<gn:GeographicalName>
					<gn:language>french</gn:language>
					<gn:nativeness>Endonym</gn:nativeness>
					<gn:nameStatus>official</gn:nameStatus>
					<gn:sourceOfName>BDNYME</gn:sourceOfName>
					<gn:pronunciation xsi:nil="true" nilReason="UNKNOWN"></gn:pronunciation>
					<gn:spelling>
						<gn:SpellingOfName>
							<gn:text>la folie</gn:text>
							<gn:script>Latn</gn:script>
						</gn:SpellingOfName>

					</gn:spelling>
					<gn:grammaticalGender xsi:nil="true" nilReason="UNKNOWN"></gn:grammaticalGender>
					<gn:grammaticalNumber xsi:nil="true" nilReason="UNKNOWN"></gn:grammaticalNumber>
				</gn:GeographicalName>
			</gn:name>
			<gn:relatedSpatialObject xsi:nil="true" nilReason="UNKNOWN"></gn:relatedSpatialObject>
			<gn:type>populatedPlace</gn:type>
		</gn:NamedPlace>
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
			<GN:NamedPlace gml:id="{$gmlId}" >
				<GN:beginLifespanVersion xsi:nil="true" nilReason="UNKNOWN"></GN:beginLifespanVersion>
				<GN:endLifespanVersion xsi:nil="true" nilReason="UNKNOWN"></GN:endLifespanVersion>
   
				<!-- fetch POINT geometry, filtering out any spaces and "," separtors-->
				<GN:geometry>
					<gml:Point srsName="urn:ogc:def:crs:EPSG::4258" gml:id="{$pointId}">
						<gml:pos><xsl:value-of select="translate(normalize-space($point),',',' ')"/></gml:pos>
					</gml:Point>
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

				<GN:localType><xsl:value-of select="$localType"/></GN:localType>

				<GN:name>
					<!-- Generate minimal GeographicalName -->
					<xsl:call-template name="GN.GeographicalName.Minimal">
						<xsl:with-param name="name">
							<xsl:value-of select="$name"/>
						</xsl:with-param>
					</xsl:call-template>
				</GN:name>

				<GN:relatedSpatialObject xsi:nil="true" nilReason="UNKNOWN"></GN:relatedSpatialObject>
				<GN:type><xsl:value-of select="$type"/></GN:type>

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
			<GN:nativeness>
				<xsl:value-of select="$nativeness"/>
			</GN:nativeness>
			<GN:nameStatus>
				<xsl:value-of select="$nameStatus"/>
			</GN:nameStatus>
			<GN:sourceOfName>
				<xsl:value-of select="$sourceOfName"/>
			</GN:sourceOfName>
			<GN:pronunciation xsi:nil="true"/>

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
