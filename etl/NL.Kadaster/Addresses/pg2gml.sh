sql="SELECT na.identificatie,na.huisnummer,na.huisletter,na.huisnummertoevoeging,ST_Force_2D(vbo.geopunt) FROM verblijfsobjectactueelbestaand as vbo INNER JOIN nummeraanduidingactueelbestaand as na ON (vbo.hoofdadres = na.identificatie)"

# sql="SELECT * FROM verblijfsobject"


ogr2ogr -t_srs "EPSG:4258" -s_srs "EPSG:28992" -f "GML" "/vsistdout/" -dsco "FORMAT=GML3"  -lco "DIM=2" PG:"host=localhost user=postgres dbname=bag password=postgres port=5432"  -sql "$sql"  -nln address -nlt POINT |\
xsltproc local-to-inspire-ad-sd.xsl -
