<?xml version="1.0" encoding="UTF-8"?>
<!--
Transform a GML3.1.1 document created using FME to a INSPIRE ProtectedSite FeatureCollection.
Author: Stefano Parodi. Datasiel.

Input: Oracle Spatial Layer transformed to a GML 3.1.1. using FME
-->
<xsl:stylesheet version="1.0" xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2" xmlns:fme="http://www.safe.com/gml/fme" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:gml31="http://www.opengis.net/gml" xmlns:wfs="http://www.opengis.net/wfs" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:PS="urn:x-inspire:specification:gmlas:ProtectedSites:3.0">
        <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
        <xsl:template match="gml31:FeatureCollection">
			<gml:FeatureCollection xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gn="urn:x-inspire:specification:gmlas:GeographicalNames:3.0" xmlns:PS="urn:x-inspire:specification:gmlas:ProtectedSites:3.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:wfs="http://www.opengis.net/wfs" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:gml="http://www.opengis.net/gml/3.2" gml:id="IT.RLIG.SIC" xsi:schemaLocation="urn:x-inspire:specification:gmlas:ProtectedSites:3.0 http://www.cartografiarl.regione.liguria.it/XmlSchemas/inspire/ProtectedSites.xsd">
                <gml:boundedBy>
                    <gml:Envelope srsName="EPSG:4258">
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
							<PS:ProtectedSite xmlns:gml="http://www.opengis.net/gml/3.2">
								<xsl:attribute name="gml:id"><xsl:value-of select="concat('PS_',generate-id())"/></xsl:attribute>
<!-- geometry (multisurface) --> 
								<xsl:for-each select="fme:ProtectedSite/gml31:multiSurfaceProperty">
									<PS:geometry>
										<xsl:for-each select="gml31:MultiSurface">
											<gml:MultiSurface srsName="EPSG:4258" srsDimension="2">
                        <xsl:attribute name="gml:id">
                            <xsl:value-of select="generate-id(.)"/>
                        </xsl:attribute>
												<xsl:for-each select="gml31:surfaceMember">
													<gml:surfaceMember>
														<xsl:for-each select="gml31:Surface">
															<gml:Surface>
                              <xsl:attribute name="gml:id">
                                  <xsl:value-of select="generate-id(.)"/>
                              </xsl:attribute>
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
									</PS:geometry>
								</xsl:for-each>
<!-- geometry (surface) -->
								<xsl:for-each select="fme:ProtectedSite/gml31:surfaceProperty">
									<PS:geometry>
														<xsl:for-each select="gml31:Surface">
															<gml:Surface srsName="EPSG:4258" srsDimension="2">
                                <xsl:attribute name="gml:id">
                                    <xsl:value-of select="generate-id(.)"/>
                                </xsl:attribute>
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
									</PS:geometry>
								</xsl:for-each>								
<!-- inspireID -->
								<PS:inspireID>
									<base:Identifier>
										<base:localId><xsl:value-of select="fme:ProtectedSite/fme:localId" xmlns:gml="http://www.opengis.net/gml"/></base:localId>
										<base:namespace><xsl:value-of select="fme:ProtectedSite/fme:idNameSpace" xmlns:gml="http://www.opengis.net/gml"/></base:namespace>
									</base:Identifier>
								</PS:inspireID>
<!-- legalFoundationDate -->
								<xsl:choose>
									<xsl:when test="fme:ProtectedSite/fme:legalFoundationDate != ''">
										<PS:legalFoundationDate>
												<xsl:call-template name="FormatDate">
													  <xsl:with-param name="DateTime" select="fme:ProtectedSite/fme:legalFoundationDate"/>
												</xsl:call-template>
										</PS:legalFoundationDate>
									</xsl:when>
									<xsl:otherwise>
										<PS:legalFoundationDate nilReason="Unknown" xsi:nil="true"/>
									</xsl:otherwise>
								</xsl:choose>
<!-- legalFoundationDocument -->
								<xsl:choose>
									<xsl:when test="fme:ProtectedSite/fme:legalFoundationDocumentTitle != ''">
										<PS:legalFoundationDocument>
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
										</PS:legalFoundationDocument>
									</xsl:when>
									<xsl:otherwise>
										<PS:legalFoundationDocument nilReason="Unknown" xsi:nil="true"/>
									</xsl:otherwise>
								</xsl:choose>
<!-- siteDesignation -->
								<xsl:choose>
									<xsl:when test="count(fme:ProtectedSite/fme:siteDesignationList) > 0">
                    <xsl:for-each select="fme:ProtectedSite/fme:siteDesignationList">
									    <PS:siteDesignation>
										    <PS:DesignationType>
											    <PS:designationScheme><xsl:value-of select="fme:DESIGNATION_SCHEMA" /></PS:designationScheme>
											    <PS:designation><xsl:value-of select="fme:DESIGNATION" /></PS:designation>
											    <PS:percentageUnderDesignation>100</PS:percentageUnderDesignation>
										    </PS:DesignationType>
									    </PS:siteDesignation>
								    </xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<PS:siteDesignation nilReason="Unknown" xsi:nil="true"/>
									</xsl:otherwise>
								</xsl:choose>
<!-- siteName -->
								<PS:siteName>
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
								</PS:siteName>
<!-- siteClassification -->
								<xsl:choose>
									<xsl:when test="count(fme:ProtectedSite/fme:siteClassificationList) > 0">
								    <xsl:for-each select="fme:ProtectedSite/fme:siteClassificationList">
									    <PS:siteProtectionClassification><xsl:value-of select="fme:CLASSIFICATION" /></PS:siteProtectionClassification>
								    </xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<PS:siteProtectionClassification nilReason="Unknown" xsi:nil="true"/>
									</xsl:otherwise>
								</xsl:choose>
							</PS:ProtectedSite>
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
