/* 
Insert test data in the GN schema

Author(s): Frans Knibbe (Geodan)
Date:  2010-06
*/

/* Set the schema search path. Comment out the following line if the public schema is  used. */
set search_path = inspire_gn_v3_0,public;

insert into md_resolution(
	id
	,equivalentscale
) values (
	1
	,5000
);

insert into md_resolution(
	id
	,equivalentscale
) values (
	2
	,1000000
);

insert into md_resolution(
	id
	,distance
) values (
	3
	,10,7
);

-- Amsterdam
insert into inspireid(
	localid
	,namespace
) values (
	'1'
	,'NL.Geodan.Test'
);

insert into namedplace(
	inspireid
	,geometry
	,leastdetailedviewingresolution
	,mostdetailedviewingresolution
) values (
	(select id from inspireid where localid = '1')
	,st_pointfromtext('POINT(52.36 4.92)', 4258) -- note the axis order: latitude, longitude
	,1
	,2
);

insert into placetypes(
	namedplace 
	,namedplacetype 
) values (
	(select id from namedplace where inspireid = (select id from inspireid where localid = '1'))
	,'administrativeUnit'
);

insert into geographicalname(
	namedplace
	,language
	,nativeness
	,namestatus
	,sourceofname
	,grammaticalgender
	,grammaticalnumber
) values (
	(select currval('namedplace_id'))
	,'dut'
	,'endonym'
	,'official'
	,'Geodan'
	,'neuter'
	,'singular'
);

insert into spellingofname(
	geographicalname
	,text
	,script
) values (
	(select currval('geographicalname_id'))
	,'Amsterdam'
	,'Latn'
);

insert into geographicalname(
	namedplace
	,language
	,nativeness
	,namestatus
	,sourceofname
	,grammaticalgender
	,grammaticalnumber
) values (
	(select currval('namedplace_id'))
	,'dut'
	,'endonym'
	,'other'
	,'Geodan'
	,'neuter'
	,'singular'
);

insert into spellingofname(
	geographicalname
	,text
	,script
) values (
	(select currval('geographicalname_id'))
	,'Mokum'
	,'Latn'
);

-- Rotterdam
insert into inspireid(
	localid
	,namespace
) values (
	'2'
	,'NL.Geodan.Test'
);

insert into namedplace(
	inspireid
	,geometry
	,leastdetailedviewingresolution
	,mostdetailedviewingresolution
) values (
	(select id from inspireid where localid = '2')
	,st_pointfromtext('POINT(51.92 4.5)', 4258) -- note the axis order: latitude, longitude
	,1
	,3
);

insert into placetypes(
	namedplace 
	,namedplacetype 
) values (
	(select id from namedplace where inspireid = (select id from inspireid where localid = '2'))
	,'administrativeUnit'
);

insert into placetypes(
	namedplace 
	,namedplacetype 
) values (
	(select id from namedplace where inspireid = (select id from inspireid where localid = '2'))
	,'populatedPlace'
);

insert into geographicalname(
	namedplace
	,language
	,nativeness
	,namestatus
	,sourceofname
	,grammaticalgender
	,grammaticalnumber
) values (
	(select currval('namedplace_id'))
	,'dut'
	,'endonym'
	,'official'
	,'Geodan'
	,'neuter'
	,'singular'
);

insert into spellingofname(
	geographicalname
	,text
	,script
) values (
	(select currval('geographicalname_id'))
	,'Rotterdam'
	,'Latn'
);

insert into localisedcharacterstring (
	language
	,country
	,characterencoding
	,text
) values 
(
'dut'
,'NL'
,'utf8'
,'Provinciehoofdstad'
);

insert into localtype (
 namedplace
 ,localisedcharacterstring
) values
(
	(select id from namedplace where inspireid = (select id from inspireid where localid = '2'))
	,	(select currval('localisedcharacterstring_id'))
);

insert into localisedcharacterstring (
	language
	,country
	,characterencoding
	,text
) values 
(
'dut'
,'NL'
,'utf8'
,'Stad'
);

insert into localtype (
 namedplace
 ,localisedcharacterstring
) values
(
	(select id from namedplace where inspireid = (select id from inspireid where localid = '2'))
	,	(select currval('localisedcharacterstring_id'))
);
