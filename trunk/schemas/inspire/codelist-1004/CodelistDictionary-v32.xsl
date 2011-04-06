<?xml version="1.0" encoding="iso-8859-1"?>
<!-- (c) 2009 interactive instruments GmbH -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:xlink="http://www.w3.org/1999/xlink">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>Codelist '<xsl:value-of select="/gml:Dictionary/gml:identifier"/>'</title>
			</head>
			<body>
				<h3>Codelist '<xsl:value-of select="/gml:Dictionary/gml:identifier"/>'</h3>
				<xsl:if test="/gml:Dictionary/gml:description">
					<p><xsl:value-of select="/gml:Dictionary/gml:description"/></p>
				</xsl:if>
				<table>
					<tr>
						<td>
							<u>Value</u>
						</td>
						<td width="10">
							<br/>
						</td>
						<td>
							<u>Code</u>
						</td>
						<td width="10">
							<br/>
						</td>
						<td>
							<u>Documentation</u>
						</td>
					</tr>
					<xsl:for-each select="//gml:Definition">
						<xsl:sort select="gml:name[count(@codeSpace)=1]" data-type="number"/>
						<tr>
							<td valign="top">
								<xsl:value-of select="gml:name[count(@codeSpace)=0]"/>
							</td>
							<td width="10">
								<br/>
							</td>
							<td valign="top">
								<xsl:value-of select="gml:identifier[count(@codeSpace)=1]"/>
							</td>
							<td width="10">
								<br/>
							</td>
							<td valign="top">
								<xsl:choose>
								<xsl:when test="substring-before(gml:description,'[DESC]')">
									<xsl:value-of select="substring-before(gml:description,'[DESC]')"/>
									<br/>NOTE: <xsl:value-of select="substring-after(gml:description,'[DESC]')"/>
								</xsl:when>
								<xsl:when test="gml:description">
									<xsl:value-of select="gml:description"/>
								</xsl:when>
								</xsl:choose>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
