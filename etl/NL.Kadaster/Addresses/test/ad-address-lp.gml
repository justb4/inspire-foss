<?xml version="1.0" encoding="UTF-8"?>
<base:SpatialDataSet xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2" xmlns:AD="urn:x-inspire:specification:gmlas:Addresses:3.0" xmlns:GN="urn:x-inspire:specification:gmlas:GeographicalNames:3.0" xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:ogr="http://ogr.maptools.org/" xmlns:wfs="http://www.opengis.net/wfs" xsi:schemaLocation="urn:x-inspire:specification:gmlas:BaseTypes:3.2 http://schemas.kademo.nl/inspire/v3.0.1/BaseTypes.xsd         urn:x-inspire:specification:gmlas:Addresses:3.0 http://schemas.kademo.nl/inspire/v3.0.1/Addresses.xsd         urn:x-inspire:specification:gmlas:GeographicalNames:3.0 http://schemas.kademo.nl/inspire/v3.0.1/GeographicalNames.xsd" gml:id="NL.KAD.BAG.AD">
  <base:identifier>
    <base:Identifier>
      <base:localId>0</base:localId>
      <base:namespace>NL.KAD.BAG.AD</base:namespace>
    </base:Identifier>
  </base:identifier>
  <base:metadata xsi:nil="true"/>
  <base:member>
    <AD:Address gml:id="NL.KAD.BAG.AD.Address.3200000133986">
      <gml:identifier codeSpace="http://inspire.jrc.ec.europa.eu/">urn:x-inspire:object:id:NL.KAD.BAG.AD.Address.3200000133986</gml:identifier>
      <AD:inspireId>
        <base:Identifier>
          <base:localId>3200000133986</base:localId>
          <base:namespace>NL.KAD.BAG.AD.Address</base:namespace>
        </base:Identifier>
      </AD:inspireId>
      <AD:position>
        <AD:GeographicPosition>
          <AD:geometry>
            <gml:Point gml:id="NL.KAD.BAG.AD.Address.3200000133986_P" srsName="urn:ogc:def:crs:EPSG::4258">
              <gml:pos>53.321302097806445 6.849894966945724</gml:pos>
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
              <AD:designator>5</AD:designator>
              <AD:type>2</AD:type>
            </AD:LocatorDesignator>
          </AD:designator>
          <AD:level>unitLevel</AD:level>
        </AD:AddressLocator>
      </AD:locator>
      <AD:validFrom>2010-07-20T00:00:00</AD:validFrom>
      <AD:validTo xsi:nil="true" nilReason="other:unpopulated"/>
      <AD:beginLifespanVersion xsi:nil="true" nilReason="other:unpopulated"/>
      <AD:endLifespanVersion xsi:nil="true" nilReason="other:unpopulated"/>
      <AD:component xlink:href="#NL.KAD.BAG.AD.AddressAreaName.2312"/>
      <AD:component xlink:href="#NL.KAD.BAG.AD.PostalDescriptor.9901AA"/>
      <AD:component xlink:href="#NL.KAD.BAG.AD.ThoroughfareName.855300000001319"/>
    </AD:Address>
  </base:member>
</base:SpatialDataSet>
