DELETE FROM ad_address;
DELETE FROM ad_admin_unit;
DELETE FROM ad_postal;
DELETE FROM ad_thoroughfare;
DELETE FROM ad_locator;
DELETE FROM ad_locator_designator;
DELETE FROM ad_component;
DELETE FROM gn_spelling;
DELETE FROM gn_name;

INSERT INTO gn_name (id, language, native_value) VALUES ('1181','nld', 'Amstelveen') ;
INSERT INTO gn_name (id, language, native_value) VALUES ('nl','nld', 'Nederland') ;
INSERT INTO gn_name (id, language, native_value) VALUES ('1181pl','nld', 'GN:1181PL') ;
INSERT INTO gn_name (id, language, native_value) VALUES ('0855300000002367','nld', 'GN:van der Hoochlaan') ;

INSERT INTO gn_spelling (id, gn_name_id, text) VALUES ('1', '1181', 'Amstelveen') ;
INSERT INTO gn_spelling (id, gn_name_id, text) VALUES ('2', 'nl', 'Nederland') ;
INSERT INTO gn_spelling (id, gn_name_id, text) VALUES ('3', '1181pl', '1181PL') ;
INSERT INTO gn_spelling (id, gn_name_id, text) VALUES ('4', '0855300000002367', 'van der Hoochlaan') ;

--INSERT INTO ad_address (id,valid_from,position) VALUES ('0532010000000001','2004-10-19 10:23:54+02', ST_GeomFromEWKT('SRID=4258;POINT(4.921875 52.558594)') );
INSERT INTO ad_address (id,valid_from,position) VALUES ('0532010000000001','2004-10-19 10:23:54+02', ST_Transform(ST_GeomFromEWKT('SRID=28992;POINT(30000 300000)'), 4258) );
-- INSERT INTO ad_address (valid_from,position) VALUES ('2005-08-20 12:35:56+02', ST_GeomFromEWKT('SRID=4258;POINT(4.875183 52.294922)') );

INSERT INTO ad_admin_unit (id,gn_name_id, name,level) VALUES ('1181','1181', 'Amstelveen', 2) ;
INSERT INTO ad_admin_unit (id,gn_name_id, name,level) VALUES ('nl', 'nl', 'Nederland', 1) ;

INSERT INTO ad_postal (id,gn_name_id, post_name,post_code) VALUES ('1181pl', '1181pl', 'post_name 1181PL', '1181PL') ;
INSERT INTO ad_thoroughfare (id,gn_name_id, ad_admin_unit_id,name) VALUES ('0855300000002367','0855300000002367', '1181', 'van der Hoochlaan') ;

INSERT INTO ad_component (ad_address_id,ad_admin_unit_id,ad_postal_id,ad_thoroughfare_id) VALUES ('0532010000000001','1181','1181pl','0855300000002367') ;
INSERT INTO ad_component (ad_address_id,ad_admin_unit_id) VALUES ('0532010000000001','nl') ;

INSERT INTO ad_locator (id,ad_address_id,level) VALUES ('0532010000000001','0532010000000001','unitLevel') ;
INSERT INTO ad_locator_designator (ad_locator_id,type,value) VALUES ('0532010000000001',2,'3') ;
INSERT INTO ad_locator_designator (ad_locator_id,type,value) VALUES ('0532010000000001',3,'hs') ;
