# http://wiki.openstreetmap.org/wiki/Tag:boundary%3Dadministrative#Statistics
# level=2 land 4=provincie 8=gemeente 9=stadsdeel 10=woonplaatsen 11=wijken

# area around amstelveen
wget -O au-xapi-osm.xml http://open.mapquestapi.com/xapi/api/0.6/*[boundary=administrative][admin_level=8][bbox=4.66,52.20,5.02,52.38]
