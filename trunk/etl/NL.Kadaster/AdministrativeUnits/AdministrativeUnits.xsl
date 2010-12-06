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

Generic XSL to generate AU-related elements.

Author:  Just van den Broecke, Just Objects B.V. for Dutch Kadaster

Requires:
	<xsl:include href="../xsl/constants.xsl"/>

	A callable template "createMultiSurface" for example
	<xsl:include href="../xsl/multipolygon-to-multisurface.xsl"/>
-->
<xsl:stylesheet version="1.0"
				xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2"
				xmlns:gml="http://www.opengis.net/gml/3.2"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:AU="urn:x-inspire:specification:gmlas:AdministrativeUnits:3.0">

	<!-- Reuse GN XSLT -->
	<xsl:include href="../GeographicalNames/GeographicalNames.xsl"/>

	<!-- Generate AdministrativeUnit element -->
	<xsl:template name="AU.AdministrativeUnit" priority="1">
		<xsl:param name="idPrefix"/>
		<xsl:param name="localId"/>
		<xsl:param name="name"/>
		<xsl:param name="nationalLevel"/>
		<xsl:param name="nationalLevelName"/>

		<!-- Create gml Id by concatenating idPrefix and local id -->
		<xsl:variable name="gmlId"><xsl:value-of select="concat($idPrefix,'.',$localId)"/></xsl:variable>

		<base:member>
			<AU:AdministrativeUnit gml:id="{$gmlId}">

				<!-- Generate (complex) MultiSurface geometry -->
				<AU:geometry>
					<!-- This is locally specific -->
					<xsl:call-template name="createMultiSurface">
						<xsl:with-param name="id">
							<xsl:value-of select="$gmlId"/>
						</xsl:with-param>
					</xsl:call-template>
				</AU:geometry>

				<!-- Local code e.g. numeric code for municipality-->
				<AU:nationalCode>
					<xsl:value-of select="$localId"/>
				</AU:nationalCode>

				<!-- Generate INSPIRE id -->
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

				<!-- nationalLevel is one of {1thOrder, 2ndOrder, ...} -->
				<AU:nationalLevel>
					<xsl:value-of select="$nationalLevel"/>
				</AU:nationalLevel>

				<!-- Local name for nationalLevel e.g. "gemeente", "provincie"-->
				<AU:nationalLevelName>
					<xsl:call-template name="GMD.LocalisedCharacterString">
						<xsl:with-param name="value">
							<xsl:value-of select="$nationalLevelName"/>
						</xsl:with-param>
					</xsl:call-template>
				</AU:nationalLevelName>

				<!-- Use globally defined country code -->
				<AU:country>
					<xsl:call-template name="GMD.Country"/>
				</AU:country>

				<AU:name>
					<!-- Generate minimal GeographicalName -->
					<xsl:call-template name="GN.GeographicalName.Minimal">
						<xsl:with-param name="name">
							<xsl:value-of select="$name"/>
						</xsl:with-param>
					</xsl:call-template>
				</AU:name>

				<!-- Keep nil for now. -->
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
