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

	<xsl:variable name="countryCodeList">http://schemas.kademo.nl/inspire/codelist-1004/CountryCode.xml</xsl:variable>
	<xsl:variable name="countryCodeValue">NL</xsl:variable>
	<xsl:variable name="locale">nl-NL</xsl:variable>
	<xsl:variable name="idNameSpace">NL.KAD</xsl:variable>
	<xsl:variable name="organisation">Het Kadaster</xsl:variable>
	<xsl:variable name="srsName">EPSG:4258</xsl:variable>
	<xsl:variable name="srsDimension">2</xsl:variable>

</xsl:stylesheet>
