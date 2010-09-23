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

Transform a local GML document to a INSPIRE AU SpatialDataset.

Author:  Just van den Broecke, Just Objects B.V. for Dutch Kadaster

Input: MapInfo file, transformed to a GML (v2) file by ogr2ogr (see mapinfo-to-gml.sh).
Output: SpatialDataset with AdministrativeUnit from INSPIRE Annex I AU
-->
<xsl:stylesheet version="1.0"
				xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2"
				xmlns:gmd="http://www.isotc211.org/2005/gmd"
				xmlns:gml="http://www.opengis.net/gml/3.2"
				xmlns:ogr="http://ogr.maptools.org/"
				xmlns:wfs="http://www.opengis.net/wfs"
				xmlns:xlink="http://www.w3.org/1999/xlink"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:AU="urn:x-inspire:specification:gmlas:AdministrativeUnits:3.0"
				xmlns:GN="urn:x-inspire:specification:gmlas:GeographicalNames:3.0">


	<xsl:include href="../xsl/constants.xsl"/>

	<xsl:template match="/">
		<base:SpatialDataSet xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2"
							 xmlns:AU="urn:x-inspire:specification:gmlas:AdministrativeUnits:3.0"
							 xmlns:GN="urn:x-inspire:specification:gmlas:GeographicalNames:3.0"
							 xmlns:gmd="http://www.isotc211.org/2005/gmd"
							 xmlns:xlink="http://www.w3.org/1999/xlink"
							 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
							 xmlns:gml="http://www.opengis.net/gml/3.2"
							 xsi:schemaLocation="urn:x-inspire:specification:gmlas:BaseTypes:3.2 http://schemas.kademo.nl/inspire/v3.0.1/BaseTypes.xsd urn:x-inspire:specification:gmlas:AdministrativeUnits:3.0 http://schemas.kademo.nl/inspire/v3.0.1/AdministrativeUnits.xsd urn:x-inspire:specification:gmlas:GeographicalNames:3.0 http://schemas.kademo.nl/inspire/v3.0.1/GeographicalNames.xsd"
							 gml:id="{$idNameSpace}">
			<base:identifier>
				<base:Identifier>
					<base:localId>0</base:localId>
					<base:namespace>
						<xsl:value-of select="$idNameSpace"/>
					</base:namespace>
				</base:Identifier>
			</base:identifier>

			<base:metadata xsi:nil="true"/>

			<xsl:apply-templates select="//ogr:Ned_Burgem"/>
			<!-- <xsl:apply-templates select="//ogr:lki_vlakken"/>   -->
		</base:SpatialDataSet>
	</xsl:template>

	<xsl:template match="ogr:Ned_Burgem">

		<xsl:call-template name="AU.AdministrativeUnit">
			<xsl:with-param name="idPrefix">
				<xsl:value-of select="concat($idNameSpace, '.','GEM')"/>
			</xsl:with-param>
			<xsl:with-param name="localId">
				<xsl:value-of select="ogr:Gem_code"/>
			</xsl:with-param>
			<xsl:with-param name="name">
				<xsl:value-of select="ogr:Gem_naam"/>
			</xsl:with-param>
			<xsl:with-param name="nationalLevel">3rdOrder</xsl:with-param>
			<xsl:with-param name="nationalLevelName">gemeente</xsl:with-param>
			<xsl:with-param name="coordinates">
				<xsl:value-of
						select="translate(translate(normalize-space(ogr:geometryProperty/gml:MultiPolygon/gml:polygonMember/gml:Polygon/gml:outerBoundaryIs/gml:LinearRing/gml:coordinates),',0 ',' '),',',' ')"
						xmlns:gml="http://www.opengis.net/gml"/>
			</xsl:with-param>
		</xsl:call-template>

	</xsl:template>


	<!-- Generate AdministrativeUnit element -->
	<xsl:template name="AU.AdministrativeUnit" priority="1">
		<xsl:param name="idPrefix"/>
		<xsl:param name="localId"/>
		<xsl:param name="name"/>
		<xsl:param name="nationalLevel"/>
		<xsl:param name="nationalLevelName"/>
		<xsl:param name="coordinates"/>

		<base:member>
			<AU:AdministrativeUnit gml:id="{concat($idPrefix,'.',$localId)}">
				<AU:geometry>
					<xsl:call-template name="GML.MultiSurface.Polygon">
						<xsl:with-param name="id">
							<xsl:value-of select="concat($idPrefix,'.',$localId)"/>
						</xsl:with-param>
						<xsl:with-param name="exteriorPosList">
							<xsl:value-of select="$coordinates"/>
						</xsl:with-param>
					</xsl:call-template>
				</AU:geometry>

				<AU:nationalCode>
					<xsl:value-of select="$localId"/>
				</AU:nationalCode>

				<AU:inspireId>
					<xsl:call-template name="Base.InspireId">
						<xsl:with-param name="localId">
							<xsl:value-of select="$localId"/>
						</xsl:with-param>
						<xsl:with-param name="idPrefix">
							<xsl:value-of select="$idPrefix"/>
						</xsl:with-param>
					</xsl:call-template>
				</AU:inspireId>

				<AU:nationalLevel>
					<xsl:value-of select="$nationalLevel"/>
				</AU:nationalLevel>

				<AU:nationalLevelName>
					<xsl:call-template name="GMD.LocalisedCharacterString">
						<xsl:with-param name="value">
							<xsl:value-of select="$nationalLevelName"/>
						</xsl:with-param>
					</xsl:call-template>
				</AU:nationalLevelName>

				<AU:country>
					<xsl:call-template name="GMD.Country"/>
				</AU:country>

				<AU:name>
					<xsl:call-template name="GN.GeographicalName.Minimal">
						<xsl:with-param name="name">
							<xsl:value-of select="$name"/>
						</xsl:with-param>
					</xsl:call-template>
				</AU:name>

				<AU:residenceOfAuthority xsi:nil="true"/>
				<AU:beginLifespanVersion xsi:nil="true"/>
				<AU:endLifespanVersion xsi:nil="true"/>
				<AU:NUTS xsi:nil="true"/>
				<AU:condominium xsi:nil="true"/>
				<AU:lowerLevelUnit xsi:nil="true"/>
				<AU:upperLevelUnit xsi:nil="true"/>
				<AU:administeredBy xsi:nil="true"/>
				<AU:coAdminister xsi:nil="true"/>
				<AU:boundary xsi:nil="true"/>
			</AU:AdministrativeUnit>
		</base:member>
	</xsl:template>


	<!-- Generate InspireId element -->
	<xsl:template name="Base.InspireId" priority="1">
		<xsl:param name="localId"/>
		<xsl:param name="idPrefix"/>

		<base:Identifier>
			<base:localId>
				<xsl:value-of select="$localId"/>
			</base:localId>
			<base:namespace>
				<xsl:value-of select="$idPrefix"/>
			</base:namespace>
		</base:Identifier>
	</xsl:template>

	<!-- Generate ggmd:Country element -->
	<xsl:template name="GMD.Country" priority="1">
		<gmd:Country codeList="{$countryCodeList}" codeListValue="{$countryCodeValue}">
			<xsl:value-of select="$countryCodeValue"/>
		</gmd:Country>

	</xsl:template>

	<!-- Generate gmd:LocalisedCharacterString element -->
	<xsl:template name="GMD.LocalisedCharacterString" priority="1">
		<xsl:param name="value"/>

		<gmd:LocalisedCharacterString locale="{$locale}">
			<xsl:value-of select="$value"/>
		</gmd:LocalisedCharacterString>

	</xsl:template>

	<!-- Generate GML MultiSurface Polygon element -->
	<xsl:template name="GML.MultiSurface.Polygon" priority="1">
		<xsl:param name="id"/>
		<xsl:param name="exteriorPosList"/>

		<gml:MultiSurface gml:id="{concat('MultiSurface_',$id)}" srsName="{$srsName}">
			<gml:surfaceMember>
				<gml:Surface gml:id="{concat('Surface_',$id)}" srsName="{$srsName}">
					<gml:patches>
						<!-- see http://xml.fmi.fi/namespace/meteorology/conceptual-model/meteorological-objects/2009/03/26/docindex146.html#id541 -->
						<gml:PolygonPatch interpolation="planar">
							<gml:exterior>
								<gml:LinearRing>
									<gml:posList srsName="{$srsName}" srsDimension="{$srsDimension}">
										<xsl:value-of select="$exteriorPosList"/>
									</gml:posList>
								</gml:LinearRing>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</gml:surfaceMember>
		</gml:MultiSurface>

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
			<GN:nativeness><xsl:value-of select="$nativeness"/></GN:nativeness>
			<GN:nameStatus><xsl:value-of select="$nameStatus"/></GN:nameStatus>
			<GN:sourceOfName><xsl:value-of select="$sourceOfName"/></GN:sourceOfName>
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
