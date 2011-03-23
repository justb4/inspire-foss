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

Generate common elements for INSPIRE BaseTypes, GMD Metadata etc.

Author:  Just van den Broecke, Just Objects B.V. for Dutch Kadaster

Requires local constants like "$countryCodeValue", for example:
	<xsl:include href="constants.xsl"/>
-->
<xsl:stylesheet version="1.0"
				xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2"
				xmlns:gmd="http://www.isotc211.org/2005/gmd"
				xmlns:gml="http://www.opengis.net/gml/3.2"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- Replace one string with another in specified string. -->
	<xsl:template name="globalReplace">
		<xsl:param name="outputString"/>
		<xsl:param name="target"/>
		<xsl:param name="replacement"/>
		<xsl:choose>
			<xsl:when test="contains($outputString,$target)">

				<xsl:value-of select=
						"concat(substring-before($outputString,$target),
				   $replacement)"/>
				<xsl:call-template name="globalReplace">
					<xsl:with-param name="outputString"
									select="substring-after($outputString,$target)"/>
					<xsl:with-param name="target" select="$target"/>
					<xsl:with-param name="replacement"
									select="$replacement"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$outputString"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Remove the third dimension (every third coordinate) from space-separated (posList) coordinates. -->
	<xsl:template name="remove3D">
		<xsl:param name="outputString"/>
		<xsl:param name="sep"/>
		<xsl:choose>
			<xsl:when test="contains($outputString,$sep)">

				<!-- Output x,y -->
				<xsl:value-of select="substring-before($outputString,$sep)"/>
				<xsl:value-of select="' '"/>
				<xsl:value-of select="substring-before( substring-after($outputString,$sep), $sep)"/>
				<xsl:value-of select="' '"/>

				<!-- RECURSE: Skip current x,y,z-coordinate and proceed with remaining string (that starts with next x,y) -->
				<xsl:call-template name="remove3D">
					<xsl:with-param name="outputString"
									select="substring-after( substring-after( substring-after( $outputString, $sep), $sep), $sep)"/>
					<xsl:with-param name="sep" select="$sep"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
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

	<!-- Generate gml:identifier element -->
	<xsl:template name="GML.Identifier" priority="1">
		<xsl:param name="id"/>

		<gml:identifier codeSpace="{$gmlIdentifierCS}"><xsl:value-of select="concat($gmlIdentifierPrefix ,$id)"/></gml:identifier>

	</xsl:template>

	<!-- Generate gmd:Country element -->
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

</xsl:stylesheet>
