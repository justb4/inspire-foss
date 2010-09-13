<?xml version="1.0" encoding="UTF-8"?>
<FeatureTypeStyle xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:ad="urn:x-inspire:specification:gmlas:Addresses:3.0" xmlns:AD="urn:x-inspire:specification:gmlas:Addresses:3.0" xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2">

  <FeatureTypeName>ad:Address</FeatureTypeName>

  <Rule>
    <Title>INSPIRE Addresses (AD)</Title>
    <!-- <MaxScaleDenominator>32000</MaxScaleDenominator> -->

    <PointSymbolizer>

      <Geometry>
        <ogc:PropertyName>ad:position/AD:GeographicPosition/AD:geometry</ogc:PropertyName>
      </Geometry>

      <Graphic>
        <Mark>
          <WellKnownName>circle</WellKnownName>
          <Fill>
            <CssParameter name="fill">#111111</CssParameter>
            <CssParameter name="fill-opacity">1.0</CssParameter>
          </Fill>
        </Mark>
        <Size>11</Size>
      </Graphic>
    </PointSymbolizer>

    <PointSymbolizer>

      <Geometry>
        <ogc:PropertyName>ad:position/AD:GeographicPosition/AD:geometry</ogc:PropertyName>
      </Geometry>

      <Graphic>
        <Mark>
          <WellKnownName>circle</WellKnownName>
          <Fill>
            <CssParameter name="fill">#FF9900</CssParameter>
            <CssParameter name="fill-opacity">0.8</CssParameter>
          </Fill>
        </Mark>
        <Size>7</Size>
      </Graphic>
    </PointSymbolizer>

  </Rule>

  <Rule>
    <!-- <MaxScaleDenominator>32000</MaxScaleDenominator> -->
    <TextSymbolizer>

      <Geometry>
        <ogc:PropertyName>ad:position/AD:GeographicPosition/AD:geometry</ogc:PropertyName>
      </Geometry>

      <Label>
        <ogc:PropertyName>ad:inspireId/base:Identifier/base:localId</ogc:PropertyName>
      </Label>
      <Font>
        <CssParameter name="font-family">Arial</CssParameter>
        <CssParameter name="font-weight">Normal</CssParameter>
        <CssParameter name="font-size">10</CssParameter>
      </Font>
      <LabelPlacement>
        <PointPlacement>
          <Displacement>
            <DisplacementX>0</DisplacementX>
            <DisplacementY>-15</DisplacementY>
          </Displacement>
        </PointPlacement>
      </LabelPlacement>
      <Halo>
        <Radius>2</Radius>
        <Fill>
          <CssParameter name="fill">#FFFFFF</CssParameter>
        </Fill>
      </Halo>
      <Fill>
        <CssParameter name="fill">#990000</CssParameter>
      </Fill>
    </TextSymbolizer>
  </Rule>

</FeatureTypeStyle>
