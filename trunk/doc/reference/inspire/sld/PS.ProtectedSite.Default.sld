<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.1.0" xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sld="http://www.opengis.net/sld" xmlns:se="http://www.opengis.net/se">   
<sld:NamedLayer>
    <se:Name>PS.ProtectedSites</se:Name>
    <sld:UserStyle>
      <se:Name>PS.ProtectedSite.Default</se:Name>
      <sld:IsDefault>1</sld:IsDefault>
      <se:FeatureTypeStyle version="1.1.0" xmlns:PS="urn:x-inspire:specification:ProtectedSites:3.1">
        <se:Description>
          <se:Title>Protected Sites Default Style</se:Title>
          <se:Abstract>Point geometries are rendered as a square with a size of 6 pixels, with a 50% grey (#808080) fill and a black outline. Line geometries are rendered as a solid black line with a stroke width of 1 pixel. Polygon geometries are rendered using a 50% grey (#808080) fill and a solid black outline with a stroke width of 1 pixel.</se:Abstract>
        </se:Description>
        <se:FeatureTypeName>PS:ProtectedSite</se:FeatureTypeName>
        <se:Rule>
          <se:PolygonSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>PS:geometry</ogc:PropertyName>
            </se:Geometry>
          </se:PolygonSymbolizer>
          <se:LineSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>PS:geometry</ogc:PropertyName>
            </se:Geometry>
          </se:LineSymbolizer>
          <se:PointSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>PS:geometry</ogc:PropertyName>
            </se:Geometry>
          </se:PointSymbolizer>
        </se:Rule>
      </se:FeatureTypeStyle>
    </sld:UserStyle>
  </sld:NamedLayer>
</StyledLayerDescriptor>
