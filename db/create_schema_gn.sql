/* 
This script creates a PostgreSQL schema for geographical names (GN) according to the INSPIRE specfication, version 3.0
Author(s): Frans Knibbe (Geodan)
Date:  2010-06
Note:
- Voidable elements are not distinguished from nillable elements.

-- Revision: $Revision: 83 $
-- Date of last change: $LastChangedDate: 2010-07-13 14:17:51 +0200 (di, 13 jul 2010) $
-- Last changed by: $LastChangedBy: frans $
*/
create schema INSPIRE_GN_v3_0;

/* Start Code Lists */
create table INSPIRE_GN_v3_0.NamedPlaceTypeValue(
	code varchar(30) primary key
);
insert into INSPIRE_GN_v3_0.NamedPlaceTypeValue values ('administrativeUnit');
insert into INSPIRE_GN_v3_0.NamedPlaceTypeValue values ('building');
insert into INSPIRE_GN_v3_0.NamedPlaceTypeValue values ('hydrography');
insert into INSPIRE_GN_v3_0.NamedPlaceTypeValue values ('landcover');
insert into INSPIRE_GN_v3_0.NamedPlaceTypeValue values ('landform');
insert into INSPIRE_GN_v3_0.NamedPlaceTypeValue values ('populatedPlace');
insert into INSPIRE_GN_v3_0.NamedPlaceTypeValue values ('protectedSite');
insert into INSPIRE_GN_v3_0.NamedPlaceTypeValue values ('transportNetwork');
insert into INSPIRE_GN_v3_0.NamedPlaceTypeValue values ('other');

create table INSPIRE_GN_v3_0.NameStatusValue(
	code varchar(30) primary key
);
insert into INSPIRE_GN_v3_0.NameStatusValue values ('official');
insert into INSPIRE_GN_v3_0.NameStatusValue values ('standardised');
insert into INSPIRE_GN_v3_0.NameStatusValue values ('historical');
insert into INSPIRE_GN_v3_0.NameStatusValue values ('other');

create table INSPIRE_GN_v3_0.GrammaticalGenderValue(
	code varchar(30) primary key
);
insert into INSPIRE_GN_v3_0.GrammaticalGenderValue values ('masculine');
insert into INSPIRE_GN_v3_0.GrammaticalGenderValue values ('feminine');
insert into INSPIRE_GN_v3_0.GrammaticalGenderValue values ('neuter');
insert into INSPIRE_GN_v3_0.GrammaticalGenderValue values ('common');

create table INSPIRE_GN_v3_0.NativenessValue(
	code varchar(30) primary key
);
insert into INSPIRE_GN_v3_0.NativenessValue values ('endonym');
insert into INSPIRE_GN_v3_0.NativenessValue values ('exonym');

create table INSPIRE_GN_v3_0.GrammaticalNumberValue(
	code varchar(30) primary key
);
insert into INSPIRE_GN_v3_0.GrammaticalNumberValue values ('singular');
insert into INSPIRE_GN_v3_0.GrammaticalNumberValue values ('plural');
insert into INSPIRE_GN_v3_0.GrammaticalNumberValue values ('dual');
/* End Code Lists */

---------> Identifier
create sequence INSPIRE_GN_v3_0.Identifier_id;
create table INSPIRE_GN_v3_0.Identifier(
	id bigint primary key default nextval('INSPIRE_GN_v3_0.Identifier_id')
	,localId text not null
	,namespace text not null
	,versionId varchar(25)
);

---------> LocalType
-- LocalType is of type LcoalisedCharacterString. For the definition, see ISO-19139
create sequence INSPIRE_GN_v3_0.LocalType_id;
create table INSPIRE_GN_v3_0.LocalType(
	id int primary key default nextval('INSPIRE_GN_v3_0.LocalType_id')
	,language char(3) not null -- ISO 639-2
	,country char(2)  -- ISO 3166
	,characterEncoding char(30) not null -- MD_CharacterSetCode is defined in ISO-19115
	,text text not null
);

---------> PronunciationOfName
create sequence INSPIRE_GN_v3_0.PronunciationOfName_id;
create table INSPIRE_GN_v3_0.PronunciationOfName(
	id bigint primary key default nextval('INSPIRE_GN_v3_0.PronunciationOfName_id')
	,pronunciationSoundLink text
	,pronunciationIPA text
);

---------> NamedPlace
create sequence INSPIRE_GN_v3_0.NamedPlace_id;
create table INSPIRE_GN_v3_0.NamedPlace(
	id bigint primary key default nextval('INSPIRE_GN_v3_0.NamedPlace_id')
	,inspireId bigint not null references INSPIRE_GN_v3_0.Identifier(id)
	,leastDetailedViewingScale int
	,mostDetailedViewingscale int
	,beginLifespanVersion timestamp with time zone
	,endLifespanVersion timestamp with time zone
);
select AddGeometryColumn('inspire_gn_v3_0','namedplace','geometry',4258,'GEOMETRY',2);
alter table INSPIRE_GN_v3_0.NamedPlace alter column geometry set not null;

---------> GeographicalName
create sequence INSPIRE_GN_v3_0.GeographicalName_id;
create table INSPIRE_GN_v3_0.GeographicalName(
	id bigint primary key default nextval('INSPIRE_GN_v3_0.GeographicalName_id')
	,namedPlace bigint not null references INSPIRE_GN_v3_0.NamedPlace(id)
	,language char(3) 
	,nativeness varchar(30) references INSPIRE_GN_v3_0.NativenessValue(code)
	,nameStatus varchar(30) references INSPIRE_GN_v3_0.NameStatusValue(code)
	,sourceOfName text
	,pronunciation bigint references INSPIRE_GN_v3_0.PronunciationOfName(id)
	,grammaticalGender varchar(30) references INSPIRE_GN_v3_0.GrammaticalGenderValue(code)
	,grammaticalNumber varchar(30) references INSPIRE_GN_v3_0.GrammaticalNumberValue(code)
);

---------> SpellingOfName
create sequence INSPIRE_GN_v3_0.SpellingOfName_id;
create table INSPIRE_GN_v3_0.SpellingOfName(
	id bigint primary key default nextval('INSPIRE_GN_v3_0.SpellingOfName_id')
	,geographicalName bigint not null references INSPIRE_GN_v3_0.GeographicalName(id)
	,text text not null
	,script text 
	,transliterationScheme text
);

---------> PlaceTypes: Relate namedPlaces to place types
create sequence INSPIRE_GN_v3_0.PlaceTypes_id;
create table INSPIRE_GN_v3_0.PlaceTypes(
	id bigint primary key default nextval('INSPIRE_GN_v3_0.PlaceTypes_id')
	,namedPlace bigint not null references INSPIRE_GN_v3_0.NamedPlace(id)
	,namedPlaceType char(30) not null references INSPIRE_GN_v3_0.NamedPlaceTypeValue(code)
);

---------> PlaceLocalTypes: Relate namedPlaces to local place types
create sequence INSPIRE_GN_v3_0.PlaceLocalTypes_id;
create table INSPIRE_GN_v3_0.PlaceLocalTypes(
	id bigint primary key default nextval('INSPIRE_GN_v3_0.PlaceLocalTypes_id')
	,namedPlace bigint not null references INSPIRE_GN_v3_0.NamedPlace(id)
	,localType int not null references INSPIRE_GN_v3_0.LocalType(id)
);

---------> PlaceRelatedObjects: Relate NamedPlace to relatedSpatialObject
create sequence INSPIRE_GN_v3_0.PlaceRelatedObjects_id;
create table  INSPIRE_GN_v3_0.PlaceRelatedObjects(
	id bigint primary key default nextval('INSPIRE_GN_v3_0.PlaceRelatedObjects_id')
	,namedPlace bigint not null references INSPIRE_GN_v3_0.NamedPlace(id)
	,relatedSpatialObject bigint not null references INSPIRE_GN_v3_0.Identifier(id)
);
