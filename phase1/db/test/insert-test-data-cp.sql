DELETE FROM cp_parcel;

INSERT INTO cp_parcel (id, geometry, label, national_ref) VALUES ('12345',
   ST_Transform(ST_GeomFromEWKT('SRID=28992;MULTIPOLYGON(((30000 300000,31000 310000,32000 310000,31000 300000,30000 300000)))'), 4258), 'label1', 'natref1' );
