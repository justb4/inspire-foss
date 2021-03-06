<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.1.0" xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sld="http://www.opengis.net/sld" xmlns:se="http://www.opengis.net/se">      
<sld:NamedLayer>
    <se:Name>CP.CadastralParcel</se:Name>
    <sld:UserStyle>
      <se:Name>CP.CadastralParcel.OutlinesOnly</se:Name>
      <sld:IsDefault>0</sld:IsDefault>
      <se:FeatureTypeStyle version="1.1.0">
        <se:Description>
          <se:Title>Cadastral Parcel - outlines only</se:Title>
          <se:Abstract> Parcel outline carried by the attribute geometry. Parcel outlines: black (#000000) line 1 pixel.    </se:Abstract>
        </se:Description>
        <se:FeatureTypeName>CadastralParcel</se:FeatureTypeName>
        <se:Rule>
          <se:MinScaleDenominator>1</se:MinScaleDenominator>
          <se:MaxScaleDenominator>40000</se:MaxScaleDenominator>
          <se:PolygonSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Stroke>
	 <se:SvgParameter name="stroke">#000000</se:SvgParameter>
	 <se:SvgParameter name="stroke-width">1</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
      </se:FeatureTypeStyle>
    </sld:UserStyle>
  </sld:NamedLayer>
</StyledLayerDescriptor>

