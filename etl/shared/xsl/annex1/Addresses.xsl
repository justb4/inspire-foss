<?xml version="1.0" encoding="UTF-8"?>
<!--
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

Generic XSL to generate AD-related elements.

Author:  Just van den Broecke, Just Objects B.V.

Requires:
	<xsl:include href="../xsl/constants.xsl"/>

	A callable template "createMultiSurface" for example
	<xsl:include href="../xsl/multipolygon-to-multisurface.xsl"/>
-->
<xsl:stylesheet version="1.0"
				xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2"
                xmlns:xlink="http://www.w3.org/1999/xlink"
				xmlns:gml="http://www.opengis.net/gml/3.2"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:AD="urn:x-inspire:specification:gmlas:Addresses:3.0">

	<!-- Reuse GN XSLT -->
	<xsl:include href="GeographicalNames.xsl"/>

	<!-- Generate Address element
	        <AD:Address gml:id="NL.KAD.BAG.0532200000007461">
            <AD:inspireId>
                <base:Identifier>
                    <base:localId>0532200000007461</base:localId>
                    <base:namespace>NL.KAD.BAG</base:namespace>
                </base:Identifier>
            </AD:inspireId>
            <AD:position>
                <AD:GeographicPosition>
                    <AD:geometry>
                        <gml:Point gml:id="NL.KAD.BAG.0532200000007461_P">
                            <gml:pos>5.242708641248198 52.698088258672094</gml:pos>
                        </gml:Point>
                    </AD:geometry>
                    <AD:specification>entrance</AD:specification>
                    <AD:method>byOtherParty</AD:method>
                    <AD:default>true</AD:default>
                </AD:GeographicPosition>
            </AD:position>
            <AD:locator>
                <AD:AddressLocator>
                    <AD:designator xmlns:gml="http://www.opengis.net/gml">
                        <AD:LocatorDesignator>
                            <AD:designator>113</AD:designator>
                            <AD:type>2</AD:type>
                        </AD:LocatorDesignator>
                    </AD:designator>
                    <AD:level>unitLevel</AD:level>
                </AD:AddressLocator>
            </AD:locator>
            <AD:validFrom xmlns:gml="http://www.opengis.net/gml">2009-01-05T23:00:00.000</AD:validFrom>
            <AD:validTo xmlns:gml="http://www.opengis.net/gml">2299-12-30T23:00:00.000</AD:validTo>
            <AD:beginLifespanVersion xsi:nil="true" nilReason="UNKNOWN"/>
            <AD:endLifespanVersion xsi:nil="true" nilReason="UNKNOWN"/>
            <AD:component xlink:href="#NL.KAD.AA.1102"/>
            <AD:component xlink:href="#NL.KAD.PD.1611AC"/>
            <AD:component xlink:href="#NL.KAD.TN.0532300000000074"/>
        </AD:Address>
	-->
	<xsl:template name="AD.Address" priority="1">
		<xsl:param name="idPrefix"/>
		<xsl:param name="localId"/>
        <!-- Position e.g. "5.242708641248198 52.698088258672094" -->
		<xsl:param name="pointPos"/>
        <xsl:param name="locatorDesignatorType"/>
        <xsl:param name="locatorDesignatorValue"/>
        <xsl:param name="locatorLevel"/>
        <xsl:param name="addressAreaLocalId"/>
        <xsl:param name="postCode"/>
        <xsl:param name="thoroughfareLocalId"/>


        <xsl:param name="validFrom"/>
        <xsl:param name="validTo"/>

		<!-- Create gml Id by concatenating idPrefix and local id -->
		<xsl:variable name="gmlId"><xsl:value-of select="concat($idPrefix,'.',$localId)"/></xsl:variable>
        <xsl:variable name="addressAreaRef"><xsl:value-of select="concat('#',$idNameSpace,'.AA.',$addressAreaLocalId)"/></xsl:variable>
        <xsl:variable name="postCodeRef"><xsl:value-of select="concat('#',$idNameSpace,'.PC.',$postCode)"/></xsl:variable>
        <xsl:variable name="thoroughfareRef"><xsl:value-of select="concat('#',$idNameSpace,'.TF.',$thoroughfareLocalId)"/></xsl:variable>

		<base:member>
			<AD:Address gml:id="{$gmlId}">

				<xsl:call-template name="GML.Identifier">
					<xsl:with-param name="id">
						<xsl:value-of select="$gmlId"/>
					</xsl:with-param>
				</xsl:call-template>

                <!-- Generate INSPIRE id -->
                <AD:inspireId>
                    <xsl:call-template name="Base.InspireId">
                        <xsl:with-param name="localId">
                            <xsl:value-of select="$localId"/>
                        </xsl:with-param>
                        <xsl:with-param name="idPrefix">
                            <xsl:value-of select="$idPrefix"/>
                        </xsl:with-param>
                    </xsl:call-template>
                </AD:inspireId>

				<!-- Generate POINT geometry -->
                <AD:position>
                    <AD:GeographicPosition>
                        <AD:geometry>
                            <gml:Point gml:id="{concat($gmlId, '_P')}">
                                <gml:pos><xsl:value-of select="$pointPos"/></gml:pos>
                            </gml:Point>
                        </AD:geometry>
                        <AD:specification>entrance</AD:specification>
                        <AD:method>byOtherParty</AD:method>
                        <AD:default>true</AD:default>
                    </AD:GeographicPosition>
                </AD:position>

                <AD:locator>
                    <AD:AddressLocator>
                        <AD:designator>
                            <AD:LocatorDesignator>
                                <AD:designator><xsl:value-of select="$locatorDesignatorValue"/></AD:designator>
                                <AD:type><xsl:value-of select="$locatorDesignatorType"/></AD:type>
                            </AD:LocatorDesignator>
                        </AD:designator>
                        <AD:level><xsl:value-of select="$locatorLevel"/></AD:level>
                    </AD:AddressLocator>
                </AD:locator>

                <!--  Generate common AD.LifecycleProperties Elements -->
                <xsl:call-template name="AD.LifecycleProperties">
                    <xsl:with-param name="validFrom">
                        <xsl:value-of select="$validFrom"/>
                    </xsl:with-param>
                    <xsl:with-param name="validTo">
                        <xsl:value-of select="$validTo"/>
                    </xsl:with-param>
                 </xsl:call-template>

                <AD:component xlink:href="{$addressAreaRef}"/>
                <AD:component xlink:href="{$postCodeRef}"/>
                <AD:component xlink:href="{$thoroughfareRef}"/>

			</AD:Address>
		</base:member>
	</xsl:template>

    <!-- Generate Addresses theme Feature types common Lifecycle Properties -->
    <xsl:template name="AD.LifecycleProperties" priority="1">
        <xsl:param name="validFrom"/>
        <xsl:param name="validTo"/>

        <xsl:choose>
            <!-- validFrom is optional: only generate a validFrom when present otherwise make nil -->
            <xsl:when test="$validFrom != ''">
                <AD:validFrom><xsl:value-of select="$validFrom"/></AD:validFrom>
            </xsl:when>
            <xsl:otherwise>
                 <AD:validFrom xsi:nil="true" nilReason="other:unpopulated"></AD:validFrom>
            </xsl:otherwise>
        </xsl:choose>

        <xsl:choose>
             <!-- validTo is optional: only generate a validFrom when present otherwise make nil -->
             <xsl:when test="$validTo != ''">
                 <AD:validTo><xsl:value-of select="$validTo"/></AD:validTo>
             </xsl:when>
             <xsl:otherwise>
                  <AD:validTo xsi:nil="true" nilReason="other:unpopulated"></AD:validTo>
             </xsl:otherwise>
         </xsl:choose>


        <!-- TODO: optional populate -->
        <AD:beginLifespanVersion xsi:nil="true" nilReason="other:unpopulated"></AD:beginLifespanVersion>
        <AD:endLifespanVersion xsi:nil="true" nilReason="other:unpopulated"></AD:endLifespanVersion>
    </xsl:template>
    
</xsl:stylesheet>
