<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.1.0" xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sld="http://www.opengis.net/sld" xmlns:se="http://www.opengis.net/se">
  <sld:NamedLayer>
    <se:Name>AU.AdministrativeBoundary</se:Name>
    <sld:UserStyle>
      <se:Name> AU.AdministrativeBoundary.Default </se:Name>
      <sld:IsDefault>1</sld:IsDefault>
      <se:FeatureTypeStyle version="1.1.0">
        <se:Description>
          <se:Title> Administrative Boundary Default Style</se:Title>
          <se:Abstract> The administrative boundary is rendered using a red (#FF0033) line.</se:Abstract>
        </se:Description>
        <se:FeatureTypeName>AdministrativeUnit</se:FeatureTypeName>
        <se:Rule>
          <se:LineSymbolizer>
            <se:Geometry>
             <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Stroke>
		<se:SvgParameter name="stroke">#FF0033</se:SvgParameter>
		<se:SvgParameter name="stroke-width">4</se:SvgParameter>
	    </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
      </se:FeatureTypeStyle>
    </sld:UserStyle>
  </sld:NamedLayer>
</StyledLayerDescriptor>
