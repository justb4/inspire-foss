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

<xsl:stylesheet version="1.0" xmlns:wfs="http://www.opengis.net/wfs"
				xmlns:ogc="http://www.opengis.net/ogc" xmlns:app="http://www.deegree.org/app"
				xmlns:CP="urn:x-inspire:specification:gmlas:CadastralParcels:3.0"
				xmlns:AD="urn:x-inspire:specification:gmlas:Addresses:3.0"
				xmlns:GN="urn:x-inspire:specification:gmlas:GeographicalNames:3.0"
				xmlns:gml="http://www.opengis.net/gml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:java="java" exclude-result-prefixes="java">
	<xsl:template match="/">
		<xsl:apply-templates select="wfs:GetFeature"/>
	</xsl:template>
	<xsl:template match="wfs:GetFeature">
		<wfs:GetFeature>
			<xsl:copy-of select="./@*"/>
			<xsl:apply-templates select="wfs:Query"/>
		</wfs:GetFeature>
	</xsl:template>
	<xsl:template match="wfs:Query">
		<xsl:variable name="TN">
			<xsl:value-of select="substring-after( @typeName, ':' )"/>
		</xsl:variable>
		<xsl:variable name="NS">
			<xsl:value-of select="substring-before( @typeName, ':' )"/>
		</xsl:variable>
		<wfs:Query>
			<xsl:copy-of select="./@srsName"/>
			<xsl:attribute name="typeName">
				<xsl:value-of select="concat( $NS, ':', $TN )"/>
			</xsl:attribute>
			<xsl:apply-templates select="ogc:Filter"/>
		</wfs:Query>
	</xsl:template>
	<xsl:template match="ogc:Filter">
		<ogc:Filter xmlns:ogc="http://www.opengis.net/ogc" xmlns:gml="http://www.opengis.net/gml">
			<xsl:choose>
				<xsl:when test="count( ogc:FeatureId ) = 1 or count( ogc:GmlObjectId ) = 1">
					<xsl:apply-templates select="ogc:FeatureId | ogc:GmlObjectId"/>
				</xsl:when>
				<xsl:when test="count( ogc:FeatureId ) > 1 or count( ogc:GmlObjectId ) > 1">
					<ogc:Or>
						<xsl:apply-templates select="ogc:FeatureId | ogc:GmlObjectId"/>
					</ogc:Or>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="node()|@*"/>
				</xsl:otherwise>
			</xsl:choose>
		</ogc:Filter>
	</xsl:template>
	<xsl:template match="node()|@*">
		<xsl:variable name="TMP">
			<xsl:value-of select="local-name(.) "/>
		</xsl:variable>
		<xsl:copy>
			<xsl:choose>
				<xsl:when test="$TMP = 'PropertyName' ">
					<xsl:if test="local-name(.) = 'PropertyName'">
						<xsl:choose>
							<xsl:when test="contains(node(),'AD:AdminUnitName')">
								<xsl:variable name="PN">
									<xsl:value-of
											select="concat('AD:component/AD:AddressComponent/AD:adminUnitName/AD:AdminUnitName', substring-after(node(), 'AD:AdminUnitName'))"/>
								</xsl:variable>
								<xsl:choose>
									<xsl:when test="contains($PN,'GN:text')">
										<xsl:value-of
												select="concat(substring-before($PN,'GN:GeographicalName'),'AD:GeographicalName/AD:spelling/AD:SpellingOfName/AD:text')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$PN"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="contains(node(),'AD:AddressAreaName')">
								<xsl:variable name="PN">
									<xsl:value-of
											select="concat('AD:component/AD:AddressComponent/AD:addressAreaName/AD:AddressAreaName', substring-after(node(), 'AD:AddressAreaName'))"/>
								</xsl:variable>
								<xsl:choose>
									<xsl:when test="contains($PN,'GN:text')">
										<xsl:value-of
												select="concat(substring-before($PN,'GN:GeographicalName'),'AD:GeographicalName/AD:spelling/AD:SpellingOfName/AD:text')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$PN"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="contains(node(),'AD:PostalDescriptor')">
								<xsl:variable name="PN">
									<xsl:value-of
											select="concat('AD:component/AD:AddressComponent/AD:postalDescriptor/AD:PostalDescriptor', substring-after(node(), 'AD:PostalDescriptor'))"/>
								</xsl:variable>
								<xsl:choose>
									<xsl:when test="contains($PN,'GN:text')">
										<xsl:value-of
												select="concat(substring-before($PN,'GN:GeographicalName'),'AD:GeographicalName/AD:spelling/AD:SpellingOfName/AD:text')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$PN"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="contains(node(),'AD:ThoroughfareName')">
								<xsl:variable name="PN">
									<xsl:value-of
											select="concat('AD:component/AD:AddressComponent/AD:thoroughfareName/AD:ThoroughfareName', substring-after(node(), 'AD:ThoroughfareName'))"/>
								</xsl:variable>
								<xsl:choose>
									<xsl:when test="contains($PN,'GN:text')">
										<xsl:value-of
												select="concat(substring-before($PN,'GN:GeographicalName'),'AD:GeographicalName/AD:spelling/AD:SpellingOfName/AD:text')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$PN"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="node()"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="node()|@*"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
