val_wfs=../../../tools/validator/bin/validate-wfs.sh

# GetFeature (ExM:AdministrativeUnit):

$val_wfs 'http://inspire.kademo.nl/deegree3/services?request=GetFeature&version=1.1.0&service=WFS&typeName=XLAU:AdministrativeUnit&namespace=xmlns(XLAU=urn:x-exml:specification:gmlas:ExMLargeAdministrativeUnits:1.0)&maxFeatures=25&outputFormat=text/xml;%20subtype=gml/3.2.1'

# GetFeature (ExM:CadastralParcel):

$val_wfs 'http://inspire.kademo.nl/deegree3/services?request=GetFeature&version=1.1.0&service=WFS&typeName=XLCP:CadastralParcel&namespace=xmlns(XLCP=urn:x-exml:specification:gmlas:ExMLargeCadastralParcels:1.0)&maxFeatures=50&outputFormat=text/xml;%20subtype=gml/3.2.1'

# GetFeature (ExM Hydrography XHY-P:Lock):

$val_wfs 'http://inspire.kademo.nl/deegree3/services?request=GetFeature&version=1.1.0&service=WFS&typeName=XLHY-P:Lock&namespace=xmlns(XLHY-P=urn:x-exml:specification:gmlas:ExMLargePhysicalWaters:1.0)&maxFeatures=50&outputFormat=text/xml;%20subtype=gml/3.2.1'

# GetFeature (ExM Hydrography XHY-P:Watercourse):

$val_wfs 'http://inspire.kademo.nl/deegree3/services?request=GetFeature&version=1.1.0&service=WFS&typeName=XLHY-P:Watercourse&namespace=xmlns(XLHY-P=urn:x-exml:specification:gmlas:ExMLargePhysicalWaters:1.0)&maxFeatures=50&outputFormat=text/xml;%20subtype=gml/3.2.1'

# GetFeature (ExM Hydrography XHY-P:StandingWater):

$val_wfs 'http://inspire.kademo.nl/deegree3/services?request=GetFeature&version=1.1.0&service=WFS&typeName=XLHY-P:StandingWater&namespace=xmlns(XLHY-P=urn:x-exml:specification:gmlas:ExMLargePhysicalWaters:1.0)&maxFeatures=50&outputFormat=text/xml;%20subtype=gml/3.2.1'

# GetFeature (ExM Hydrography XHY-P:DamOrWeir):

$val_wfs 'http://inspire.kademo.nl/deegree3/services?request=GetFeature&version=1.1.0&service=WFS&typeName=XLHY-P:DamOrWeir&namespace=xmlns(XLHY-P=urn:x-exml:specification:gmlas:ExMLargePhysicalWaters:1.0)&maxFeatures=50&outputFormat=text/xml;%20subtype=gml/3.2.1'

# GetFeature (ExM TransportNetwork XTN-RO:RoadNode):

$val_wfs 'http://inspire.kademo.nl/deegree3/services?request=GetFeature&version=1.1.0&service=WFS&typeName=XLTN-R:RoadNode&namespace=xmlns(XLTN-R=urn:x-exml:specification:gmlas:ExMLargeRoadTransportNetwork:1.0)&maxFeatures=20&outputFormat=text/xml;%20subtype=gml/3.2.1'

# GetFeature (ExM TransportNetwork XTN-RO:RoadLink):

$val_wfs 'http://inspire.kademo.nl/deegree3/services?request=GetFeature&version=1.1.0&service=WFS&typeName=XLTN-R:RoadLink&namespace=xmlns(XLTN-R=urn:x-exml:specification:gmlas:ExMLargeRoadTransportNetwork:1.0)&maxFeatures=20&outputFormat=text/xml;%20subtype=gml/3.2.1'

# GetFeature (ExM TransportNetwork XTN-RO:RoadArea):

$val_wfs 'http://inspire.kademo.nl/deegree3/services?request=GetFeature&version=1.1.0&service=WFS&typeName=XLTN-R:RoadArea&namespace=xmlns(XLTN-R=urn:x-exml:specification:gmlas:ExMLargeRoadTransportNetwork:1.0)&maxFeatures=20&outputFormat=text/xml;%20subtype=gml/3.2.1'
