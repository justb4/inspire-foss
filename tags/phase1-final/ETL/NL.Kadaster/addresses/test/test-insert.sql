-- TEST DATA FOR BAG 

		
		-- x=144741.0
		-- y=523376.0
		INSERT INTO ad_address (id,valid_from,position)
		SELECT '0532200000002281','2004-10-19 10:23:54+02', ST_Transform(ST_GeomFromEWKT('SRID=28992;POINT(144741.0 523376.0)'), 4258)
		WHERE NOT EXISTS (SELECT id FROM ad_address WHERE id='0532200000002281');
	
		
		-- x=144760.0
		-- y=523379.0
		INSERT INTO ad_address (id,valid_from,position)
		SELECT '0532200000002467','2004-10-19 10:23:54+02', ST_Transform(ST_GeomFromEWKT('SRID=28992;POINT(144760.0 523379.0)'), 4258)
		WHERE NOT EXISTS (SELECT id FROM ad_address WHERE id='0532200000002467');
	
		
		-- x=82225.177
		-- y=435475.0
		INSERT INTO ad_address (id,valid_from,position)
		SELECT '0622200000037383','2004-10-19 10:23:54+02', ST_Transform(ST_GeomFromEWKT('SRID=28992;POINT(82225.177 435475.0)'), 4258)
		WHERE NOT EXISTS (SELECT id FROM ad_address WHERE id='0622200000037383');
	
		
		-- x=83129.321
		-- y=436838.226
		INSERT INTO ad_address (id,valid_from,position)
		SELECT '0622200000037771','2004-10-19 10:23:54+02', ST_Transform(ST_GeomFromEWKT('SRID=28992;POINT(83129.321 436838.226)'), 4258)
		WHERE NOT EXISTS (SELECT id FROM ad_address WHERE id='0622200000037771');
	
		
		-- x=82581.381
		-- y=439472.533
		INSERT INTO ad_address (id,valid_from,position)
		SELECT '0622200000041737','2004-10-19 10:23:54+02', ST_Transform(ST_GeomFromEWKT('SRID=28992;POINT(82581.381 439472.533)'), 4258)
		WHERE NOT EXISTS (SELECT id FROM ad_address WHERE id='0622200000041737');
	

		INSERT INTO gn_name (id, language, native_value)
		SELECT '1102','nld', ''
		WHERE NOT EXISTS (SELECT id FROM gn_name WHERE id='1102');

	

		INSERT INTO gn_spelling (id, gn_name_id, text)
		SELECT '1102','1102', 'Bovenkarspel'
		WHERE NOT EXISTS (SELECT id FROM gn_spelling WHERE id='1102');

	

		INSERT INTO ad_address_area (id, gn_name_id, name)
		SELECT '1102','1102', 'Bovenkarspel'
		WHERE NOT EXISTS (SELECT id FROM ad_address_area WHERE id='1102');

	

		INSERT INTO gn_name (id, language, native_value)
		SELECT '1015','nld', ''
		WHERE NOT EXISTS (SELECT id FROM gn_name WHERE id='1015');

	

		INSERT INTO gn_spelling (id, gn_name_id, text)
		SELECT '1015','1015', 'Vlaardingen'
		WHERE NOT EXISTS (SELECT id FROM gn_spelling WHERE id='1015');

	

		INSERT INTO ad_address_area (id, gn_name_id, name)
		SELECT '1015','1015', 'Vlaardingen'
		WHERE NOT EXISTS (SELECT id FROM ad_address_area WHERE id='1015');

	

		INSERT INTO gn_name (id, language, native_value)
		SELECT '0532300000000074','nld', 'Hoofdstraat'
		WHERE NOT EXISTS (SELECT id FROM gn_name WHERE id='0532300000000074');

	

		INSERT INTO gn_spelling (id, gn_name_id, text)
		SELECT '0532300000000074','0532300000000074', 'Hoofdstraat'
		WHERE NOT EXISTS (SELECT id FROM gn_spelling WHERE id='0532300000000074');

	

		INSERT INTO ad_thoroughfare (id, ad_address_area_id, gn_name_id, name)
		SELECT '0532300000000074','1102','0532300000000074', 'Hoofdstraat'
		WHERE NOT EXISTS (SELECT id FROM ad_thoroughfare WHERE id='0532300000000074');

	

		INSERT INTO gn_name (id, language, native_value)
		SELECT '0622300000000375','nld', 'Jaagpad'
		WHERE NOT EXISTS (SELECT id FROM gn_name WHERE id='0622300000000375');

	

		INSERT INTO gn_spelling (id, gn_name_id, text)
		SELECT '0622300000000375','0622300000000375', 'Jaagpad'
		WHERE NOT EXISTS (SELECT id FROM gn_spelling WHERE id='0622300000000375');

	

		INSERT INTO ad_thoroughfare (id, ad_address_area_id, gn_name_id, name)
		SELECT '0622300000000375','1015','0622300000000375', 'Jaagpad'
		WHERE NOT EXISTS (SELECT id FROM ad_thoroughfare WHERE id='0622300000000375');

	

		INSERT INTO gn_name (id, language, native_value)
		SELECT '0622300000000369','nld', '4e Industriestraat'
		WHERE NOT EXISTS (SELECT id FROM gn_name WHERE id='0622300000000369');

	

		INSERT INTO gn_spelling (id, gn_name_id, text)
		SELECT '0622300000000369','0622300000000369', '4e Industriestraat'
		WHERE NOT EXISTS (SELECT id FROM gn_spelling WHERE id='0622300000000369');

	

		INSERT INTO ad_thoroughfare (id, ad_address_area_id, gn_name_id, name)
		SELECT '0622300000000369','1015','0622300000000369', '4e Industriestraat'
		WHERE NOT EXISTS (SELECT id FROM ad_thoroughfare WHERE id='0622300000000369');

	

		INSERT INTO gn_name (id, language, native_value)
		SELECT '0622300000000338','nld', 'Holyweg'
		WHERE NOT EXISTS (SELECT id FROM gn_name WHERE id='0622300000000338');

	

		INSERT INTO gn_spelling (id, gn_name_id, text)
		SELECT '0622300000000338','0622300000000338', 'Holyweg'
		WHERE NOT EXISTS (SELECT id FROM gn_spelling WHERE id='0622300000000338');

	

		INSERT INTO ad_thoroughfare (id, ad_address_area_id, gn_name_id, name)
		SELECT '0622300000000338','1015','0622300000000338', 'Holyweg'
		WHERE NOT EXISTS (SELECT id FROM ad_thoroughfare WHERE id='0622300000000338');

	

		INSERT INTO ad_locator (id,ad_address_id,level,name)
		VALUES ('0532200000002281','0532200000002281','unitLevel','15') ;

	

		INSERT INTO ad_locator_designator (ad_locator_id,type,value)
		VALUES ('0532200000002281',2,'15') ;

	
		INSERT INTO ad_postal (id,post_code)
		SELECT '1611AA','1611AA'
		WHERE NOT EXISTS (SELECT id FROM ad_postal WHERE id='1611AA');

	

		INSERT INTO ad_component (ad_address_id, ad_postal_id, ad_thoroughfare_id, ad_address_area_id)
		VALUES ('0532200000002281','1611AA','0532300000000074', (SELECT ad_address_area_id FROM ad_thoroughfare WHERE id='0532300000000074')) ;

	
		UPDATE ad_address
		  SET
		    valid_from = '2009-01-06 00:00:00+02',
		    valid_to = '2299-12-31 00:00:00+02' 
		   WHERE id = '0532200000002281';
		
	

		INSERT INTO ad_locator (id,ad_address_id,level,name)
		VALUES ('0532200000002467','0532200000002467','unitLevel','17') ;

	

		INSERT INTO ad_locator_designator (ad_locator_id,type,value)
		VALUES ('0532200000002467',2,'17') ;

	
		INSERT INTO ad_postal (id,post_code)
		SELECT '1611AA','1611AA'
		WHERE NOT EXISTS (SELECT id FROM ad_postal WHERE id='1611AA');

	

		INSERT INTO ad_component (ad_address_id, ad_postal_id, ad_thoroughfare_id, ad_address_area_id)
		VALUES ('0532200000002467','1611AA','0532300000000074', (SELECT ad_address_area_id FROM ad_thoroughfare WHERE id='0532300000000074')) ;

	
		UPDATE ad_address
		  SET
		    valid_from = '2009-01-06 00:00:00+02',
		    valid_to = '2299-12-31 00:00:00+02' 
		   WHERE id = '0532200000002467';
		
	

		INSERT INTO ad_locator (id,ad_address_id,level,name)
		VALUES ('0622200000037771','0622200000037771','unitLevel','1') ;

	

		INSERT INTO ad_locator_designator (ad_locator_id,type,value)
		VALUES ('0622200000037771',2,'1') ;

	
		INSERT INTO ad_postal (id,post_code)
		SELECT '3134JK','3134JK'
		WHERE NOT EXISTS (SELECT id FROM ad_postal WHERE id='3134JK');

	

		INSERT INTO ad_component (ad_address_id, ad_postal_id, ad_thoroughfare_id, ad_address_area_id)
		VALUES ('0622200000037771','3134JK','0622300000000375', (SELECT ad_address_area_id FROM ad_thoroughfare WHERE id='0622300000000375')) ;

	
		UPDATE ad_address
		  SET
		    valid_from = '2007-05-02 00:00:00+02',
		    valid_to = '2299-12-31 00:00:00+02' 
		   WHERE id = '0622200000037771';
		
	

		INSERT INTO ad_locator (id,ad_address_id,level,name)
		VALUES ('0622200000037383','0622200000037383','unitLevel','15C') ;

	

		INSERT INTO ad_locator_designator (ad_locator_id,type,value)
		VALUES ('0622200000037383',2,'15') ;

	

		INSERT INTO ad_locator_designator (ad_locator_id,type,value)
		VALUES ('0622200000037383',3,'C') ;

	
		INSERT INTO ad_postal (id,post_code)
		SELECT '3133EK','3133EK'
		WHERE NOT EXISTS (SELECT id FROM ad_postal WHERE id='3133EK');

	

		INSERT INTO ad_component (ad_address_id, ad_postal_id, ad_thoroughfare_id, ad_address_area_id)
		VALUES ('0622200000037383','3133EK','0622300000000369', (SELECT ad_address_area_id FROM ad_thoroughfare WHERE id='0622300000000369')) ;

	
		UPDATE ad_address
		  SET
		    valid_from = '2007-05-02 00:00:00+02',
		    valid_to = '2299-12-31 00:00:00+02' 
		   WHERE id = '0622200000037383';
		
	

		INSERT INTO ad_locator (id,ad_address_id,level,name)
		VALUES ('0622200000041737','0622200000041737','unitLevel','25') ;

	

		INSERT INTO ad_locator_designator (ad_locator_id,type,value)
		VALUES ('0622200000041737',2,'25') ;

	
		INSERT INTO ad_postal (id,post_code)
		SELECT '3137KB','3137KB'
		WHERE NOT EXISTS (SELECT id FROM ad_postal WHERE id='3137KB');

	

		INSERT INTO ad_component (ad_address_id, ad_postal_id, ad_thoroughfare_id, ad_address_area_id)
		VALUES ('0622200000041737','3137KB','0622300000000338', (SELECT ad_address_area_id FROM ad_thoroughfare WHERE id='0622300000000338')) ;

	
		UPDATE ad_address
		  SET
		    valid_from = '2007-05-02 00:00:00+02',
		    valid_to = '2299-12-31 00:00:00+02' 
		   WHERE id = '0622200000041737';
		
	