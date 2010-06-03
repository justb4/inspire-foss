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

<xsl:stylesheet version="1.0" xmlns:app="http://www.deegree.org/app"
	xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2"
	xmlns:gml="http://www.opengis.net/gml"
	xmlns:wfs="http://www.opengis.net/wfs"
	 xmlns:xlink="http://www.w3.org/1999/xlink"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:AD="urn:x-inspire:specification:gmlas:Addresses:3.0"
	xmlns:CP="urn:x-inspire:specification:gmlas:CadastralParcels:3.0"
	xmlns:GN="urn:x-inspire:specification:gmlas:GeographicalNames:3.0"
		>
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

	<xsl:include href="outfilter_geographicalname.xml"/>
	<xsl:include href="outfilter_address.xml"/>
	<xsl:include href="outfilter_adminunitname.xml"/>
	<xsl:include href="outfilter_postaldescriptor.xml"/>
	<xsl:include href="outfilter_thoroughfarename.xml"/>
	<xsl:include href="outfilter_addressareaname.xml"/>
	<xsl:include href="outfilter_cp_parcel.xml"/>

	<!--	<xsl:include href="outfilter_locator.xml"/>  -->
	
	<xsl:template match="wfs:FeatureCollection">
		<wfs:FeatureCollection  xmlns:gml="http://www.opengis.net/gml"  xsi:schemaLocation="urn:x-inspire:specification:gmlas:Addresses:3.0 http://schemas.statkart.no/schemas/Inspire-copy-30/XSD/Addresses.xsd urn:x-inspire:specification:gmlas:CadastralParcels:3.0 http://schemas.kademo.nl/inspire/v3.0/CadastralParcels.xsd http://www.opengis.net/wfs http://schemas.opengis.net/wfs/1.1.0/wfs.xsd">
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
			<xsl:copy-of select="gml:boundedBy"/>
		
			<xsl:for-each select="gml:featureMember" xmlns:gml="http://www.opengis.net/gml">
				<gml:featureMember>
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
	<!--					<xsl:if test="boolean( AD:Locator )">
						<xsl:call-template name="LOCATOR"/>  
					</xsl:if> -->										
				</gml:featureMember>
			</xsl:for-each>
		</wfs:FeatureCollection>
	</xsl:template>

</xsl:stylesheet>
