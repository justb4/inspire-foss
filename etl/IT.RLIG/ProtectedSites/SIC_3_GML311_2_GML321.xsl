<?xml version="1.0" encoding="UTF-8"?>
<!--
Transform a GML3.1.1 document created using FME to a INSPIRE ProtectedSite FeatureCollection.
Author: Stefano Parodi. Datasiel.

Input: Oracle Spatial Layer (CTEMI:PS_SIC), transformed to a GML 3.1.1. using FME
-->
<xsl:stylesheet version="1.0" xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2" xmlns:fme="http://www.safe.com/gml/fme" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:gml31="http://www.opengis.net/gml" xmlns:wfs="http://www.opengis.net/wfs" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ps="urn:x-inspire:specification:gmlas:ProtectedSites:3.0">
        <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
        <xsl:template match="gml31:FeatureCollection">
			<gml:FeatureCollection xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gn="urn:x-inspire:specification:gmlas:GeographicalNames:3.0" xmlns:ps="urn:x-inspire:specification:gmlas:ProtectedSites:3.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:wfs="http://www.opengis.net/wfs" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:gml="http://www.opengis.net/gml/3.2" gml:id="IT.RLIG.SIC" xsi:schemaLocation="urn:x-inspire:specification:gmlas:ProtectedSites:3.0 ">
                <gml:boundedBy>
                    <gml:Envelope srsName="urn:ogc:def:crs:EPSG:4258">
                       <gml:lowerCorner>
                           <xsl:value-of select="gml31:boundedBy/gml31:Envelope/gml31:lowerCorner" />
                       </gml:lowerCorner>
                       <gml:upperCorner>
                           <xsl:value-of select="gml31:boundedBy/gml31:Envelope/gml31:upperCorner" />
                       </gml:upperCorner>
                    </gml:Envelope>
                </gml:boundedBy>
                
				<xsl:for-each select="gml:featureMember" xmlns:gml="http://www.opengis.net/gml">
						<gml:featureMember xmlns:gml="http://www.opengis.net/gml/3.2">
							<ps:ProtectedSite xmlns:gml="http://www.opengis.net/gml/3.2">
								<xsl:attribute name="gml:id"><xsl:value-of select="concat('PS_',generate-id())"/></xsl:attribute>
<!-- geometry -->
								<xsl:for-each select="fme:ProtectedSite/gml31:multiSurfaceProperty">
									<ps:geometry>
										<xsl:for-each select="gml31:MultiSurface">
											<gml:MultiSurface srsName="EPSG:4258" srsDimension="2">
												<xsl:for-each select="gml31:surfaceMember">
													<gml:surfaceMember>
														<xsl:for-each select="gml31:Surface">
															<gml:Surface>
																<xsl:for-each select="gml31:patches">
																	<gml:patches>
																		<xsl:for-each select="gml31:PolygonPatch">
																			<gml:PolygonPatch>
																				<xsl:for-each select="gml31:exterior">
																					<gml:exterior>
																						<xsl:for-each select="gml31:LinearRing">
																							<gml:LinearRing>
																								<xsl:for-each select="gml31:posList">
																									<gml:posList>
																										<xsl:value-of select="."/>
																									</gml:posList>
																								</xsl:for-each>
																							</gml:LinearRing>
																						</xsl:for-each>
																					</gml:exterior>
																				</xsl:for-each>
																				<xsl:for-each select="gml31:interior">
																					<gml:interior>
																						<xsl:for-each select="gml31:LinearRing">
																							<gml:LinearRing>
																								<xsl:for-each select="gml31:posList">
																									<gml:posList>
																										<xsl:value-of select="."/>
																									</gml:posList>
																								</xsl:for-each>
																							</gml:LinearRing>
																						</xsl:for-each>
																					</gml:interior>
																				</xsl:for-each>
																			</gml:PolygonPatch>
																		</xsl:for-each>
																	</gml:patches>
																</xsl:for-each>
															</gml:Surface>
														</xsl:for-each>
													</gml:surfaceMember>
												</xsl:for-each>

											</gml:MultiSurface>
										</xsl:for-each>

<!--
										<xsl:copy-of select="node()|@*"/>
-->
									</ps:geometry>
								</xsl:for-each>
<!-- inspireID -->
								<ps:inspireID>
									<base:Identifier>
										<base:namespace><xsl:value-of select="fme:ProtectedSite/fme:idNameSpace" xmlns:gml="http://www.opengis.net/gml"/></base:namespace>
										<base:localId><xsl:value-of select="fme:ProtectedSite/fme:localId" xmlns:gml="http://www.opengis.net/gml"/></base:localId>
									</base:Identifier>
								</ps:inspireID>
<!-- legalFoundationDate -->
								<xsl:choose>
									<xsl:when test="fme:ProtectedSite/fme:legalFoundationDate != ''">
										<ps:legalFoundationDate>
												<xsl:call-template name="FormatDate">
													  <xsl:with-param name="DateTime" select="fme:ProtectedSite/fme:legalFoundationDate"/>
												</xsl:call-template>
										</ps:legalFoundationDate>
									</xsl:when>
									<xsl:otherwise>
										<ps:legalFoundationDate nilReason="other:unpopulated" xsi:nil="true"/>
									</xsl:otherwise>
								</xsl:choose>
<!-- legalFoundationDocument -->
								<xsl:choose>
									<xsl:when test="fme:ProtectedSite/fme:legalFoundationDocumentTitle != ''">
										<ps:legalFoundationDocument>
											<gmd:CI_Citation>
												<gmd:title>
													<gco:CharacterString><xsl:value-of select="fme:ProtectedSite/fme:legalFoundationDocumentTitle" /></gco:CharacterString>
												</gmd:title>
												<gmd:date>
													<gmd:CI_Date>
														<gmd:date>
															<gco:DateTime>
																	<xsl:call-template name="FormatDate">
																			  <xsl:with-param name="DateTime" select="fme:ProtectedSite/fme:legalFoundationDocumentDate"/>
																	</xsl:call-template>
															</gco:DateTime>
														</gmd:date>
														<gmd:dateType>
															<gmd:CI_DateTypeCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/ML_gmxCodelists.xml#CI_DateTypeCode" codeListValue="creation">creation</gmd:CI_DateTypeCode>
														</gmd:dateType>
													</gmd:CI_Date>
												</gmd:date>
											</gmd:CI_Citation>
										</ps:legalFoundationDocument>
									</xsl:when>
									<xsl:otherwise>
										<ps:legalFoundationDocument nilReason="other:unpopulated" xsi:nil="true"/>
									</xsl:otherwise>
								</xsl:choose>
<!-- siteDesignation -->
								<xsl:for-each select="fme:ProtectedSite/fme:siteDesignationList">
									<ps:siteDesignation>
										<ps:DesignationType>
											<ps:designationScheme><xsl:value-of select="fme:DESIGNATION_SCHEMA" /></ps:designationScheme>
											<ps:designation><xsl:value-of select="fme:DESIGNATION" /></ps:designation>
											<ps:percentageUnderDesignation>100</ps:percentageUnderDesignation>
										</ps:DesignationType>
									</ps:siteDesignation>
								</xsl:for-each>
<!-- siteName -->
								<ps:siteName>
									<!-- See document "INSPIRE Data Specification on Geographical names" -->
									<gn:GeographicalName>
										<gn:language>ITA</gn:language>
										<gn:nativeness/>
										<gn:nameStatus/>
										<gn:sourceOfName/>
										<gn:pronunciation>
											<gn:PronunciationOfName>
												<gn:pronunciationIPA/>
											</gn:PronunciationOfName>
										</gn:pronunciation>
										<gn:spelling>
											<gn:SpellingOfName>
												<gn:text><xsl:value-of select="fme:ProtectedSite/fme:siteName" /></gn:text>
												<gn:script>Latn</gn:script>
											</gn:SpellingOfName>
										</gn:spelling>
									</gn:GeographicalName>
								</ps:siteName>
<!-- siteClassification -->
								<xsl:for-each select="fme:ProtectedSite/fme:siteClassificationList">
									<ps:siteProtectionClassification><xsl:value-of select="fme:CLASSIFICATION" /></ps:siteProtectionClassification>
								</xsl:for-each>

							</ps:ProtectedSite>
						</gml:featureMember>
				</xsl:for-each>
			 </gml:FeatureCollection>
        </xsl:template>
<!--  -->
<!-- Template per formattare le date nel formato 2000-01-01T00:00:00Z -->
<!--  -->
		<xsl:template name="FormatDate">
			<xsl:param name="DateTime" />
			<xsl:variable name="year">
			  <xsl:value-of select="substring($DateTime,1,4)" />
			</xsl:variable>
			<xsl:variable name="month">
			  <xsl:value-of select="substring($DateTime,5,2)" />
			</xsl:variable>
			<xsl:variable name="day">
			  <xsl:value-of select="substring($DateTime,7,2)" />
			</xsl:variable>
			<xsl:value-of select="$year"/>-<xsl:value-of select="$month"/>-<xsl:value-of select="$day"/>T00:00:00Z</xsl:template>

</xsl:stylesheet>
