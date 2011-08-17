ogr2ogr -nlt MULTIPOLYGON -f GML au-ogr-gml.xml PG:"host=localhost user=oaseuser dbname=osm password=oase" -sql "select osm_id, name, ST_Transform(way, 4258) from planet_osm_polygon where admin_level = '8'"


