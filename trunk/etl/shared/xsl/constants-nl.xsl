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

Constants for The Netherlands Kadaster, used in all Transformation XSL scripts

Author:  Just van den Broecke, Just Objects B.V. for Dutch Kadaster

-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

	<!-- Base URI under which all CodeList XML files are contained -->
	<xsl:variable name="codeListURIBase">http://schemas.kademo.nl/inspire/codelist-1004/</xsl:variable>

	<!-- CodeSpace URIs, mainly used for AU and GN -->
	<xsl:variable name="adminHierarchyCodeSpace"><xsl:value-of select="concat($codeListURIBase, 'AdministrativeHierarchyLevel.xml')"/></xsl:variable>
	<xsl:variable name="conditionOfFacilityValueCodeSpace"><xsl:value-of select="concat($codeListURIBase, 'ConditionOfFacilityValue.xml')"/></xsl:variable>
	<xsl:variable name="formOfRoadNodeValueCodeSpace"><xsl:value-of select="concat($codeListURIBase, 'FormOfRoadNodeValue.xml')"/></xsl:variable>
	<xsl:variable name="namedPlaceTypeValueCodeSpace"><xsl:value-of select="concat($codeListURIBase, 'NamedPlaceTypeValue.xml')"/></xsl:variable>
	<xsl:variable name="nameStatusValueCodeSpace"><xsl:value-of select="concat($codeListURIBase, 'NameStatusValue.xml')"/></xsl:variable>
	<xsl:variable name="nativenessValueCodeSpace"><xsl:value-of select="concat($codeListURIBase, 'NativenessValue.xml')"/></xsl:variable>

	<xsl:variable name="gmlIdentifierCS">http://inspire.jrc.ec.europa.eu/</xsl:variable>
	<xsl:variable name="gmlIdentifierPrefix">urn:x-inspire:object:id:</xsl:variable>
	<xsl:variable name="countryCodeList"><xsl:value-of select="concat($codeListURIBase, 'CountryCode.xml')"/></xsl:variable>
	<xsl:variable name="countryCodeValue">NL</xsl:variable>
	<xsl:variable name="locale">http://schemas.kademo.nl/etc/NL.xml</xsl:variable>
	<xsl:variable name="srsName">urn:ogc:def:crs:EPSG::4258</xsl:variable>
	<xsl:variable name="srsDimension">2</xsl:variable>
	<xsl:variable name="areaUOM">m2</xsl:variable>
	<xsl:variable name="lengthUOM">m</xsl:variable>
	<!--
	TODO figure out the right UOM domain
	<xsl:variable name="areaUOM">urn:ogc:def:uom:OGC::m2</xsl:variable>
	<xsl:variable name="lengthUOM">urn:ogc:def:uom:OGC::m</xsl:variable>  -->

</xsl:stylesheet>
