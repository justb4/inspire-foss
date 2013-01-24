<?xml version="1.0" encoding="UTF-8"?>
<base:SpatialDataSet xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2" xmlns:AD="urn:x-inspire:specification:gmlas:Addresses:3.0" xmlns:GN="urn:x-inspire:specification:gmlas:GeographicalNames:3.0" xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:ogr="http://ogr.maptools.org/" xmlns:wfs="http://www.opengis.net/wfs" xsi:schemaLocation="urn:x-inspire:specification:gmlas:BaseTypes:3.2 http://inspire.ec.europa.eu/schemas/base/3.2/BaseTypes.xsd         urn:x-inspire:specification:gmlas:Addresses:3.0 http://inspire.ec.europa.eu/schemas/ad/3.0/Addresses.xsd         urn:x-inspire:specification:gmlas:GeographicalNames:3.0 http://inspire.ec.europa.eu/schemas/gn/3.0/GeographicalNames.xsd" gml:id="NL.KAD.BAG.AD">
  <base:identifier>
    <base:Identifier>
      <base:localId>0</base:localId>
      <base:namespace>NL.KAD.BAG.AD</base:namespace>
    </base:Identifier>
  </base:identifier>
  <base:metadata xsi:nil="true"/>
  <base:member>
    <AD:Address gml:id="NL.KAD.BAG.AD.Address.10200000101386">
      <gml:identifier codeSpace="http://inspire.jrc.ec.europa.eu/">urn:x-inspire:object:id:NL.KAD.BAG.AD.Address.10200000101386</gml:identifier>
      <AD:inspireId>
        <base:Identifier>
          <base:localId>10200000101386</base:localId>
          <base:namespace>NL.KAD.BAG.AD.Address</base:namespace>
        </base:Identifier>
      </AD:inspireId>
      <AD:position>
        <AD:GeographicPosition>
          <AD:geometry>
            <gml:Point gml:id="NL.KAD.BAG.AD.Address.10200000101386_P" srsName="urn:ogc:def:crs:EPSG::4258">
              <gml:pos>53.320901405269076 6.932018480388243</gml:pos>
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
              <AD:designator>1</AD:designator>
              <AD:type>2</AD:type>
            </AD:LocatorDesignator>
          </AD:designator>
          <AD:level>unitLevel</AD:level>
        </AD:AddressLocator>
      </AD:locator>
      <AD:validFrom>2010-05-11T00:00:00</AD:validFrom>
      <AD:validTo xsi:nil="true" nilReason="other:unpopulated"/>
      <AD:beginLifespanVersion xsi:nil="true" nilReason="other:unpopulated"/>
      <AD:endLifespanVersion xsi:nil="true" nilReason="other:unpopulated"/>
      <AD:component xlink:href="#NL.KAD.BAG.AD.ThoroughfareName.855300000001319"/>
      <AD:component xlink:href="#NL.KAD.BAG.AD.AddressAreaName.2312"/>
      <AD:component xlink:href="#NL.KAD.BAG.AD.PostalDescriptor.9934RA"/>
    </AD:Address>
  </base:member>
</base:SpatialDataSet>
