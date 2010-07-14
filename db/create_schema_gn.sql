/* 
This script creates a PostgreSQL schema for geographical names (GN) according to the INSPIRE specfication, version 3.0
Author(s): Frans Knibbe (Geodan)
Note:
- Voidable elements are not distinguished from nillable elements.

-- Revision: $Revision: 85 $
-- Date of last change: $LastChangedDate: 2010-07-14 16:36:13 +0200 (wo, 14 jul 2010) $
-- Last changed by: $LastChangedBy: frans $
*/

/* create and set the schema. Comment out the following two lines if the public schema is  used*/
create schema inspire_gn_v3_0;
set search_path = inspire_gn_v3_0,public;

/* start code lists */
create table namedplacetypevalue(
	code varchar(30) primary key
);
insert into namedplacetypevalue values ('administrativeUnit');
insert into namedplacetypevalue values ('building');
insert into namedplacetypevalue values ('hydrography');
insert into namedplacetypevalue values ('landcover');
insert into namedplacetypevalue values ('landform');
insert into namedplacetypevalue values ('populatedPlace');
insert into namedplacetypevalue values ('protectedSite');
insert into namedplacetypevalue values ('transportNetwork');
insert into namedplacetypevalue values ('other');

create table namestatusvalue(
	code varchar(30) primary key
);
insert into namestatusvalue values ('official');
insert into namestatusvalue values ('standardised');
insert into namestatusvalue values ('historical');
insert into namestatusvalue values ('other');

create table grammaticalgendervalue(
	code varchar(30) primary key
);
insert into grammaticalgendervalue values ('masculine');
insert into grammaticalgendervalue values ('feminine');
insert into grammaticalgendervalue values ('neuter');
insert into grammaticalgendervalue values ('common');

create table nativenessvalue(
	code varchar(30) primary key
);
insert into nativenessvalue values ('endonym');
insert into nativenessvalue values ('exonym');

create table grammaticalnumbervalue(
	code varchar(30) primary key
);
insert into grammaticalnumbervalue values ('singular');
insert into grammaticalnumbervalue values ('plural');
insert into grammaticalnumbervalue values ('dual');
/* end code lists */

---------> identifier
create sequence identifier_id;
create table identifier(
	id bigint primary key default nextval('identifier_id')
	,localid text not null
	,namespace text not null
	,versionid varchar(25)
);

---------> localtype
-- localtype is of type lcoalisedcharacterstring. for the definition, see iso-19139
create sequence localtype_id;
create table localtype(
	id int primary key default nextval('localtype_id')
	,language char(3) not null -- iso 639-2
	,country char(2)  -- iso 3166
	,characterencoding char(30) not null -- md_charactersetcode is defined in iso-19115
	,text text not null
);

---------> pronunciationofname
create sequence pronunciationofname_id;
create table pronunciationofname(
	id bigint primary key default nextval('pronunciationofname_id')
	,pronunciationsoundlink text
	,pronunciationipa text
);

---------> namedplace
create sequence namedplace_id;
create table namedplace(
	id bigint primary key default nextval('namedplace_id')
	,inspireid bigint not null references identifier(id)
	,leastdetailedviewingscale int
	,mostdetailedviewingscale int
	,beginlifespanversion timestamp with time zone
	,endlifespanversion timestamp with time zone
);
--select AddGeometryColumn('inspire_gn_v3_0','namedplace','geometry',4258,'GEOMETRY',2);
select AddGeometryColumn('namedplace','geometry',4258,'GEOMETRY',2);
alter table namedplace alter column geometry set not null;

---------> geographicalname
create sequence geographicalname_id;
create table geographicalname(
	id bigint primary key default nextval('geographicalname_id')
	,namedplace bigint not null references namedplace(id)
	,language char(3) 
	,nativeness varchar(30) references nativenessvalue(code)
	,namestatus varchar(30) references namestatusvalue(code)
	,sourceofname text
	,pronunciation bigint references pronunciationofname(id)
	,grammaticalgender varchar(30) references grammaticalgendervalue(code)
	,grammaticalnumber varchar(30) references grammaticalnumbervalue(code)
);

---------> spellingofname
create sequence spellingofname_id;
create table spellingofname(
	id bigint primary key default nextval('spellingofname_id')
	,geographicalname bigint not null references geographicalname(id)
	,text text not null
	,script text 
	,transliterationscheme text
);

---------> placetypes: relate namedplaces to place types
create sequence placetypes_id;
create table placetypes(
	id bigint primary key default nextval('placetypes_id')
	,namedplace bigint not null references namedplace(id)
	,namedplacetype char(30) not null references namedplacetypevalue(code)
);

---------> placelocaltypes: relate namedplaces to local place types
create sequence placelocaltypes_id;
create table placelocaltypes(
	id bigint primary key default nextval('placelocaltypes_id')
	,namedplace bigint not null references namedplace(id)
	,localtype int not null references localtype(id)
);

---------> placerelatedobjects: relate namedplace to relatedspatialobject
create sequence placerelatedobjects_id;
create table  placerelatedobjects(
	id bigint primary key default nextval('placerelatedobjects_id')
	,namedplace bigint not null references namedplace(id)
	,relatedspatialobject bigint not null references identifier(id)
);
