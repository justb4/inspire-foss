/* 
This script creates a PostgreSQL schema for geographical names (GN) according to the INSPIRE specfication, version 3.0
Author(s): Frans Knibbe (Geodan)
Note:
- Voidable elements are not distinguished from nillable elements.

-- Revision: $Revision: 86 $
-- Date of last change: $LastChangedDate: 2010-07-16 17:08:52 +0200 (vr, 16 jul 2010) $
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

---------> MD_resolution (defined in ISO 19115)
create sequence md_resolution_id;
create table md_resolution(
	id int primary key default nextval('md_resolution_id')
	,equivalentscale int  -- EquivalentScale.Denomintator
	,distance real --see ISO 1903
	,constraint scale_or_distance_not_null check (equivalentscale is not null or distance is not null)
);

---------> pronunciationofname
create sequence pronunciationofname_id;
create table pronunciationofname(
	id bigint primary key default nextval('pronunciationofname_id')
	,pronunciationsoundlink text
	,pronunciationipa text
);

---------> inspireId
create sequence inspireid_id;
create table inspireid(
	id bigint primary key default nextval('inspireid_id')
	,localid text not null
	,namespace text not null
	,versionid varchar(25)
);
---------> namedplace
create sequence namedplace_id;
create table namedplace(
	id bigint primary key default nextval('namedplace_id')
	,inspireid bigint not null references inspireid(id)
	,leastdetailedviewingresolution int references md_resolution(id)
	,mostdetailedviewingresolution int references md_resolution(id)
	,beginlifespanversion timestamp with time zone
	,endlifespanversion timestamp with time zone
);
--select AddGeometryColumn('inspire_gn_v3_0','namedplace','geometry',4258,'GEOMETRY',2);
select AddGeometryColumn('namedplace','geometry',4258,'GEOMETRY',2);
alter table namedplace alter column geometry set not null;

---------> relatedSpatialObject
create sequence relatedspatialobject_id;
create table relatedspatialobject(
	id bigint primary key default nextval('relatedspatialobject_id')
	,namedplace bigint not null references namedplace(id)
	,localid text not null
	,namespace text not null
	,versionid varchar(25)
);

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

---------> localtype
-- localtype is of type lcoalisedcharacterstring. for the definition, see iso-19139
create sequence localtype_id;
create table localtype(
	id int primary key default nextval('localtype_id')
	,namedplace bigint not null references namedplace(id)
	,language char(3) not null -- iso 639-2
	,country char(2)  -- iso 3166
	,characterencoding char(30) not null -- md_charactersetcode is defined in iso-19115
	,text text not null
);

---------> placetypes: relate namedplaces to place types
create sequence placetypes_id;
create table placetypes(
	id bigint primary key default nextval('placetypes_id')
	,namedplace bigint not null references namedplace(id)
	,namedplacetype char(30) not null references namedplacetypevalue(code)
);