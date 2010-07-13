/* 
Insert test data in the GN schema

Author(s): Frans Knibbe (Geodan)
Date:  2010-06
*/

insert into INSPIRE_GN_v3_0.Identifier(
	localId
	,namespace
) values (
	'1'
	,'NL.Geodan.Test'
);

insert into INSPIRE_GN_v3_0.NamedPlace(
	inspireId
	,geometry
) values (
	(select id from INSPIRE_GN_v3_0.Identifier where localId = '1')
	,ST_PointFromText('POINT(52.36 4.92)', 4258) -- Note the axis order: latitude, longitude
);

insert into INSPIRE_GN_v3_0.PlaceTypes(
	namedPlace 
	,namedPlaceType 
) values (
	(select id from INSPIRE_GN_v3_0.NamedPlace where inspireId = (select id from INSPIRE_GN_v3_0.Identifier where localId = '1'))
	,'administrativeUnit'
);

insert into INSPIRE_GN_v3_0.GeographicalName(
	namedPlace
	,language
	,nativeness
	,nameStatus
	,sourceOfName
	,grammaticalGender
	,grammaticalNumber
) values (
	(select currval('INSPIRE_GN_v3_0.NamedPlace_id'))
	,'dut'
	,'endonym'
	,'official'
	,'Geodan'
	,'neuter'
	,'singular'
);

insert into INSPIRE_GN_v3_0.SpellingOfName(
	geographicalName
	,text
	,script
) values (
	(select currval('INSPIRE_GN_v3_0.GeographicalName_id'))
	,'Amsterdam'
	,'Latn'
);

insert into INSPIRE_GN_v3_0.GeographicalName(
	namedPlace
	,language
	,nativeness
	,nameStatus
	,sourceOfName
	,grammaticalGender
	,grammaticalNumber
) values (
	(select currval('INSPIRE_GN_v3_0.NamedPlace_id'))
	,'dut'
	,'endonym'
	,'other'
	,'Geodan'
	,'neuter'
	,'singular'
);

insert into INSPIRE_GN_v3_0.SpellingOfName(
	geographicalName
	,text
	,script
) values (
	(select currval('INSPIRE_GN_v3_0.GeographicalName_id'))
	,'Mokum'
	,'Latn'
);


