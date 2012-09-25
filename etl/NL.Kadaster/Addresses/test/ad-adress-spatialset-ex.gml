<?xml version="1.0" encoding="UTF-8"?>
<base:SpatialDataSet xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2"
                     xmlns:ad="urn:x-inspire:specification:gmlas:Addresses:3.0"
                     xmlns:gn="urn:x-inspire:specification:gmlas:GeographicalNames:3.0"
                     xmlns:xlink="http://www.w3.org/1999/xlink"
                     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                     xmlns:gml="http://www.opengis.net/gml/3.2"
                     xsi:schemaLocation="urn:x-inspire:specification:gmlas:BaseTypes:3.2 http://inspire.ec.europa.eu/schemas/base/3.2/BaseTypes.xsd
                     urn:x-inspire:specification:gmlas:Addresses:3.0 http://inspire.ec.europa.eu/schemas/ad/3.0/Addresses.xsd
                     urn:x-inspire:specification:gmlas:GeographicalNames:3.0 http://inspire.ec.europa.eu/schemas/gn/3.0/GeographicalNames.xsd"
                     gml:id="NL.KAD.BAG.AD">
    <base:identifier>
        <base:Identifier>
            <base:localId>0</base:localId>
            <base:namespace>NL.KAD.BAG.AD</base:namespace>
        </base:Identifier>
    </base:identifier>
    <base:metadata xsi:nil="true"/>
    <base:member>
        <ad:Address gml:id="NL.KAD.BAG.AD.Address.362200000013563">
            <gml:identifier codeSpace="http://inspire.jrc.ec.europa.eu/">
                urn:x-inspire:object:id:NL.KAD.BAG.AD.Address.362200000013563
            </gml:identifier>
            <ad:inspireId>
                <base:Identifier>
                    <base:localId>362200000013563</base:localId>
                    <base:namespace>NL.KAD.BAG.AD.Address</base:namespace>
                </base:Identifier>
            </ad:inspireId>
            <ad:position>
                <ad:GeographicPosition>
                    <ad:geometry>
                        <gml:Point gml:id="NL.KAD.BAG.AD.Address.362200000013563_P"
                                   srsName="urn:ogc:def:crs:EPSG::4258">
                            <gml:pos>52.312419 4.852999</gml:pos>
                        </gml:Point>
                    </ad:geometry>
                    <ad:specification>entrance</ad:specification>
                    <ad:method>byOtherParty</ad:method>
                    <ad:default>true</ad:default>
                </ad:GeographicPosition>
            </ad:position>
            <ad:locator>
                <ad:AddressLocator>
                    <ad:designator>
                        <ad:LocatorDesignator>
                            <ad:designator>2</ad:designator>
                            <ad:type>2</ad:type>
                        </ad:LocatorDesignator>
                    </ad:designator>
                    <ad:level>unitLevel</ad:level>
                </ad:AddressLocator>
            </ad:locator>
            <ad:validFrom>2010-08-17T00:00:00</ad:validFrom>
            <ad:validTo xsi:nil="true" nilReason="other:unpopulated"/>
            <ad:beginLifespanVersion xsi:nil="true" nilReason="other:unpopulated"/>
            <ad:endLifespanVersion xsi:nil="true" nilReason="other:unpopulated"/>
            <ad:component xmlns:xlink="http://www.w3.org/1999/xlink"
                          xlink:href="#NL.KAD.BAG.AD.ThoroughfareName.362300000018600"/>
            <ad:component xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#NL.KAD.BAG.AD.AddressAreaName.1050"/>
            <ad:component xmlns:xlink="http://www.w3.org/1999/xlink"
                          xlink:href="#NL.KAD.BAG.AD.PostalDescriptor.1181PL"/>
        </ad:Address>
    </base:member>
    <!--Additional features (subfeatures of requested features)-->
    <base:member>
        <ad:ThoroughfareName gml:id="NL.KAD.BAG.AD.ThoroughfareName.362300000018600">
            <gml:identifier codeSpace="http://inspire.jrc.ec.europa.eu/">
                urn:x-inspire:object:id:NL.KAD.BAG.AD.ThoroughfareName.362300000018600
            </gml:identifier>
            <ad:inspireId>
                <base:Identifier>
                    <base:localId>362300000018600</base:localId>
                    <base:namespace>NL.KAD.BAG.AD.ThoroughfareName</base:namespace>
                </base:Identifier>
            </ad:inspireId>
            <ad:beginLifespanVersion xsi:nil="true" nilReason="other:unpopulated"/>
            <ad:endLifespanVersion xsi:nil="true" nilReason="other:unpopulated"/>
            <ad:validFrom>2010-03-30T00:00:00</ad:validFrom>
            <ad:validTo xsi:nil="true" nilReason="other:unpopulated"/>
            <ad:name>
                <gn:GeographicalName>
                    <gn:language xsi:nil="true"/>
                    <gn:nativeness codeSpace="http://schemas.kademo.nl/inspire/codelist-1004/NativenessValue.xml">
                        endonym
                    </gn:nativeness>
                    <gn:nameStatus codeSpace="http://schemas.kademo.nl/inspire/codelist-1004/NameStatusValue.xml">
                        official
                    </gn:nameStatus>
                    <gn:sourceOfName>Het Kadaster</gn:sourceOfName>
                    <gn:pronunciation nilReason="other:unpopulated" xsi:nil="true"/>
                    <gn:spelling>
                        <gn:SpellingOfName>
                            <gn:text>Van der Hoochlaan</gn:text>
                            <gn:script>Latn</gn:script>
                        </gn:SpellingOfName>
                    </gn:spelling>
                    <gn:grammaticalGender xsi:nil="true"/>
                    <gn:grammaticalNumber xsi:nil="true"/>
                </gn:GeographicalName>
            </ad:name>
        </ad:ThoroughfareName>
    </base:member>
    <base:member>
        <ad:AddressAreaName  gml:id="NL.KAD.BAG.AD.AddressAreaName.1050">
            <gml:identifier codeSpace="http://inspire.jrc.ec.europa.eu/">
                urn:x-inspire:object:id:NL.KAD.BAG.AD.AddressAreaName.1050
            </gml:identifier>
            <ad:inspireId>
                <base:Identifier>
                    <base:localId>1050</base:localId>
                    <base:namespace>NL.KAD.BAG.AD.AddressAreaName</base:namespace>
                </base:Identifier>
            </ad:inspireId>
            <ad:beginLifespanVersion xsi:nil="true" nilReason="other:unpopulated"/>
            <ad:endLifespanVersion xsi:nil="true" nilReason="other:unpopulated"/>
            <ad:validFrom>2007-05-30T00:00:00</ad:validFrom>
            <ad:validTo xsi:nil="true" nilReason="other:unpopulated"/>
            <ad:name>
                <gn:GeographicalName>
                    <gn:language xsi:nil="true"/>
                    <gn:nativeness codeSpace="http://schemas.kademo.nl/inspire/codelist-1004/NativenessValue.xml">
                        endonym
                    </gn:nativeness>
                    <gn:nameStatus codeSpace="http://schemas.kademo.nl/inspire/codelist-1004/NameStatusValue.xml">
                        official
                    </gn:nameStatus>
                    <gn:sourceOfName>Het Kadaster</gn:sourceOfName>
                    <gn:pronunciation nilReason="other:unpopulated" xsi:nil="true"/>
                    <gn:spelling>
                        <gn:SpellingOfName>
                            <gn:text>Amstelveen</gn:text>
                            <gn:script>Latn</gn:script>
                        </gn:SpellingOfName>
                    </gn:spelling>
                    <gn:grammaticalGender xsi:nil="true"/>
                    <gn:grammaticalNumber xsi:nil="true"/>
                </gn:GeographicalName>
            </ad:name>
            <ad:namedPlace xsi:nil="true"/>
        </ad:AddressAreaName>
    </base:member>
    <base:member>
        <ad:PostalDescriptor gml:id="NL.KAD.BAG.AD.PostalDescriptor.1181PL">
            <gml:identifier codeSpace="http://inspire.jrc.ec.europa.eu/">
                urn:x-inspire:object:id:NL.KAD.BAG.AD.PostalDescriptor.1181PL
            </gml:identifier>
            <ad:inspireId>
                <base:Identifier>
                    <base:localId>1181PL</base:localId>
                    <base:namespace>NL.KAD.BAG.AD.PostalDescriptor</base:namespace>
                </base:Identifier>
            </ad:inspireId>
            <ad:beginLifespanVersion xsi:nil="true" nilReason="other:unpopulated"/>
            <ad:endLifespanVersion xsi:nil="true" nilReason="other:unpopulated"/>
            <ad:validFrom xsi:nil="true" nilReason="other:unpopulated"/>
            <ad:validTo xsi:nil="true" nilReason="other:unpopulated"/>
            <ad:postCode>1181PL</ad:postCode>
        </ad:PostalDescriptor>
    </base:member>
</base:SpatialDataSet>
        