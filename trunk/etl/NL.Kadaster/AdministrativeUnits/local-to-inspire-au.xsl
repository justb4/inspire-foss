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
Transform a GML3.1.1 document to a INSPIRE AU SpatialDataset
Author: Frans Knibbe, Geodan

Input: ESRI shapefile, transformed to a GML 3.1.1. file  by the FME
(ogr3ogr can also produce GML, but it's GML 2 and projection to EPSG:4258
produces coordinates in the wrong order. Transforming ogr2ogr output should be possible
but it would need some extra XSLT transformation)
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

	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

	<xsl:template match="/">
		<base:SpatialDataSet xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2"
							 xmlns:AU="urn:x-inspire:specification:gmlas:AdministrativeUnits:3.0"
							 xmlns:GN="urn:x-inspire:specification:gmlas:GeographicalNames:3.0"
							 xmlns:gmd="http://www.isotc211.org/2005/gmd"
							 xmlns:xlink="http://www.w3.org/1999/xlink"
							 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
							 xmlns:gml="http://www.opengis.net/gml/3.2"
							 xsi:schemaLocation="urn:x-inspire:specification:gmlas:BaseTypes:3.2 http://research.geodan.nl/esdin/schemas/v3.0/BaseTypes.xsd"
							 gml:id="EU.INSPIRE-FOSS">
			<base:identifier>
				<base:Identifier>
					<base:localId>0</base:localId>
					<base:namespace>BE.IGNB.Top250</base:namespace>
				</base:Identifier>
			</base:identifier>
			<base:metadata xsi:nil="true"/>

			<xsl:apply-templates select="//ogr:Ned_Burgem"/>
			<!-- <xsl:apply-templates select="//ogr:lki_vlakken"/>   -->
		</base:SpatialDataSet>
	</xsl:template>

	<xsl:template match="ogr:Ned_Burgem">

		<xsl:call-template name="createAdministrativeUnit">
			<xsl:with-param name="idPrefix">NL.KAD.AU.GEM.</xsl:with-param>
			<xsl:with-param name="localId">
				<xsl:value-of select="ogr:Gem_code"/>
			</xsl:with-param>
			<xsl:with-param name="name">
				<xsl:value-of select="ogr:Gem_naam"/>
			</xsl:with-param>
			<xsl:with-param name="nationalLevel">3rdOrder</xsl:with-param>
			<xsl:with-param name="nationalLevelName">gemeente</xsl:with-param>
			<xsl:with-param name="coordinates">
				<xsl:value-of select="ogr:geometryProperty//gml:coordinates" xmlns:gml="http://www.opengis.net/gml"/>
			</xsl:with-param>

			<!--  <xsl:with-param name="geometry">
				<xsl:value-of
						select="translate(translate(translate(normalize-space(ogr:geometryProperty),' ', '*'),',',' '),'*',',')"/>
			</xsl:with-param>     -->

		</xsl:call-template>

	</xsl:template>


	<!-- Generate AdministrativeUnit element -->
	<xsl:template name="createAdministrativeUnit" priority="1">
		<xsl:param name="idPrefix"/>
		<xsl:param name="localId"/>
		<xsl:param name="name"/>
		<xsl:param name="nationalLevel"/>
		<xsl:param name="nationalLevelName"/>
		<xsl:param name="coordinates"/>

		<base:member>
			<AU:AdministrativeUnit xmlns:gml="http://www.opengis.net/gml/3.2">
				<xsl:attribute name="gml:id">
					<xsl:value-of select="concat($idPrefix,$localId)"/>
				</xsl:attribute>
				<xsl:element name="AU:geometry">
					<gml:MultiSurface>
						<xsl:attribute name="gml:id">
							<xsl:value-of select="concat('MultiSurface_',$idPrefix,$localId)"/>
						</xsl:attribute>
						<xsl:attribute name="srsName">EPSG:4258</xsl:attribute>
						<gml:surfaceMember>
							<gml:Surface >
								<xsl:attribute name="gml:id">
									<xsl:value-of select="concat('Surface_',$idPrefix,$localId)"/>
								</xsl:attribute>
								<xsl:attribute name="srsName">EPSG:4258</xsl:attribute>
								<gml:patches>
									<gml:PolygonPatch interpolation="planar">
										<gml:exterior>
											<gml:LinearRing>
												<gml:coordinates>
													<xsl:value-of select="$coordinates" />
												</gml:coordinates>
											</gml:LinearRing>
										</gml:exterior>
									</gml:PolygonPatch>
								</gml:patches>
							</gml:Surface>
						</gml:surfaceMember>
					</gml:MultiSurface>
				</xsl:element>
				<xsl:element name="AU:nationalCode">
					<xsl:value-of select="$localId"/>
				</xsl:element>
				<xsl:element name="AU:inspireId">
					<base:Identifier>
						<base:localId><xsl:value-of select="$localId"/></base:localId>
						<base:namespace><xsl:value-of select="$idPrefix"/></base:namespace>
					</base:Identifier>
				</xsl:element>

				<xsl:element name="AU:nationalLevel"><xsl:value-of select="$nationalLevel"/></xsl:element>
				<xsl:element name="AU:nationalLevelName"><xsl:value-of select="$nationalLevelName"/></xsl:element>

				<xsl:element name="AU:country">
					<gmd:Country codeList="http://schemas.kademo.nl/inspire/codelist-1004/CountryCode.xml" codeListValue="NL">NL</gmd:Country>
				</xsl:element>

				<xsl:element name="AU:name">
					<GN:GeographicalName>
						<GN:language xsi:nil="true"/>
						<GN:nativeness>endonym</GN:nativeness>
						<GN:nameStatus>official</GN:nameStatus>
						<GN:sourceOfName>Het Kadaster</GN:sourceOfName>
						<GN:pronunciation xsi:nil="true"/>
						<GN:spelling>
							<GN:SpellingOfName>
								<GN:text><xsl:value-of select="$name"/></GN:text>
								<GN:script>Latn</GN:script>
							</GN:SpellingOfName>
						</GN:spelling>
						<GN:grammaticalGender xsi:nil="true"/>
						<GN:grammaticalNumber xsi:nil="true"/>
					</GN:GeographicalName>
				</xsl:element>

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


</xsl:stylesheet>
