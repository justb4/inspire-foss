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

<!-- This version uses gml:FeatureCollection as the root container-->
<xsl:stylesheet version="1.0" xmlns:app="http://www.deegree.org/app"
				xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2"
				xmlns:gml="http://www.opengis.net/gml/3.2"
				xmlns:wfs="http://www.opengis.net/wfs"
				xmlns:xlink="http://www.w3.org/1999/xlink"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:AD="urn:x-inspire:specification:gmlas:Addresses:3.0"
				xmlns:CP="urn:x-inspire:specification:gmlas:CadastralParcels:3.0"
				xmlns:GN="urn:x-inspire:specification:gmlas:GeographicalNames:3.0"
				xmlns:gmd="http://www.isotc211.org/2005/gmd">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

	<xsl:include href="outfilter_ad_geographicalname.xml"/>
	<xsl:include href="outfilter_gn_geographicalname.xml"/>
	<xsl:include href="outfilter_address.xml"/>
	<xsl:include href="outfilter_adminunitname.xml"/>
	<xsl:include href="outfilter_addressareaname.xml"/>
	<xsl:include href="outfilter_postaldescriptor.xml"/>
	<xsl:include href="outfilter_thoroughfarename.xml"/>
	<xsl:include href="outfilter_cp_parcel.xml"/>

	<xsl:template match="wfs:FeatureCollection">
			<gml:FeatureCollection
			gml:id="EU.INSPIRE-FOSS"
			xmlns:gml="http://www.opengis.net/gml/3.2" 
			xmlns:xlink="http://www.w3.org/1999/xlink"  
			xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2"  
			xmlns:gn="urn:x-inspire:specification:gmlas:GeographicalNames:3.0" 
			xsi:schemaLocation="urn:x-inspire:specification:gmlas:GeographicalNames:3.0 http://research.geodan.nl/esdin/schemas/v3.0/GeographicalNames.xsd">
			<!-- numberOfFeatures is not allowed in gml:FeatureCollection
			<xsl:choose>
				<xsl:when test="boolean( ./@numberOfFeatures )">
					<xsl:attribute name="numberOfFeatures">
						<xsl:value-of select="./@numberOfFeatures"/>
					</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="numberOfFeatures">
						<xsl:value-of select="count( gml:featureMember )"/>
					</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
-->

			<xsl:if test="boolean( ./@timeStamp )">
				<xsl:attribute name="timeStamp">
					<xsl:value-of select="./@timeStamp"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="boolean( ./@lockId )">
				<xsl:attribute name="lockId">
					<xsl:value-of select="./@lockId"/>
				</xsl:attribute>
			</xsl:if>
			<!--  		<xsl:copy-of select="./@xsi:schemaLocation" /> 	-->
			<gml:boundedBy>
				<gml:Envelope>
					<xsl:copy-of select="gml:boundedBy/gml:Envelope/@srsName" xmlns:gml="http://www.opengis.net/gml"/>
					<gml:lowerCorner>
						<xsl:value-of select="gml:boundedBy/gml:Envelope/gml:lowerCorner"
									  xmlns:gml="http://www.opengis.net/gml"/>
					</gml:lowerCorner>
					<gml:upperCorner>
						<xsl:value-of select="gml:boundedBy/gml:Envelope/gml:upperCorner"
									  xmlns:gml="http://www.opengis.net/gml"/>
					</gml:upperCorner>
				</gml:Envelope>
			</gml:boundedBy>

			<xsl:for-each select="gml:featureMember" xmlns:gml="http://www.opengis.net/gml">
				<gml:featureMember xmlns:gml="http://www.opengis.net/gml/3.2">
					<xsl:if test="boolean( AD:Address )">
						<xsl:call-template name="ADDRESS"/>
					</xsl:if>
					<xsl:if test="boolean( AD:AdminUnitName )">
						<xsl:call-template name="ADMINUNITNAME"/>
					</xsl:if>
					<xsl:if test="boolean( AD:AddressAreaName )">
						<xsl:call-template name="ADDRESSAREANAME"/>
					</xsl:if>
					<xsl:if test="boolean( AD:PostalDescriptor )">
						<xsl:call-template name="POSTALDESCRIPTOR"/>
					</xsl:if>
					<xsl:if test="boolean( AD:ThoroughfareName )">
						<xsl:call-template name="THOROUGHFARENAME"/>
					</xsl:if>
					<xsl:if test="boolean( CP:CadastralParcel )">
						<xsl:call-template name="PARCEL"/>
					</xsl:if>
					<xsl:if test="boolean( gn:NamedPlace )">
						<xsl:call-template name="NAMEDPLACE"/>
					</xsl:if>
					<!--					<xsl:if test="boolean( AD:Locator )">
											<xsl:call-template name="LOCATOR"/>
										</xsl:if> -->
				</gml:featureMember>
			</xsl:for-each>
		</gml:FeatureCollection>
	</xsl:template>
	<!--
	<xsl:template name="globalReplace">
		<xsl:param name="outputString"/>
		<xsl:param name="target"/>
		<xsl:param name="replacement"/>
		<xsl:choose>
			<xsl:when test="contains($outputString,$target)">
				<xsl:value-of select="concat(substring-before($outputString,$target),$replacement)"/>
				<xsl:call-template name="globalReplace">
					<xsl:with-param name="outputString" select="substring-after($outputString,$target)"/>
					<xsl:with-param name="target" select="$target"/>
					<xsl:with-param name="replacement" select="$replacement"/>
				 </xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				 <xsl:value-of select="$outputString"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
-->

</xsl:stylesheet>
