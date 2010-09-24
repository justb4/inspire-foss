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
