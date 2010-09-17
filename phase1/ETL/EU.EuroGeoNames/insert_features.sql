/* 
-- Revision: $Revision: 92 $
-- Date of last change: $LastChangedDate: 2010-08-10 18:58:19 +0200 (di, 10 aug 2010) $
-- Last changed by: $LastChangedBy: frans $

This script transforms EGN data to GN 
Author(s): Frans Knibbe (Geodan)
Date:  2010-06
*/

/*
Notes:
GN place = EGN complexGeometry
GN name = EGN names with the same adminstrator, language, status and complexGeometry 
GN: Different spellings should only be used for names rendered in different scripts.

*/

/* set the schema. Comment out the following line if the public schema is  used*/
set search_path = inspire_gn_v3_0,public;

-- create a helper toble for the mapping wth the egn classification
create table classificationmapping as 
select 
	feature_classification_id as egnid
	,plain_text as egndescription
from feature_classification fc join
	pt_free_text pt on fc.feature_type = pt_free_text_id join
	pt_free_text_loc_char_string_rel ptrel on pt.pt_free_text_id = ptrel.pt_free_text join 
	localised_character_string ls on ptrel.localised_character_string = ls.localised_character_string_id join
	md_characterset_code md on md.md_characterset_code_id = ls.character_encoding
where language = 'eng';
alter table classificationmapping add column gncode char(30) references namedplacetypevalue(code);
update classificationmapping set gncode = 'administrativeUnit' where egnid in (1,2,3);
update classificationmapping set gncode = 'building' where egnid in (8,9,10,11,12);
update classificationmapping set gncode = 'hydrography' where egnid in (24,25,26,27,28,29,30);
update classificationmapping set gncode = 'landform' where egnid in (18,19,20,21,22,23);
update classificationmapping set gncode = 'populatedPlace' where egnid in (5,6,7);
update classificationmapping set gncode = 'protectedSite' where egnid in (31,32,33);
update classificationmapping set gncode = 'transportNetwork' where egnid in (13,14,15,16,17); 
update classificationmapping set gncode = 'other' where egnid in (4,34); 

insert into inspireid (
	id
	,localid
	,namespace
) 
select 
	complex_geometry_id
	,complex_geometry_id
	,'egn'
from complex_geometry;

insert into namedplace (
	id
	,inspireid
	,geometry
)
select 
	complex_geometry_id -- id
	,complex_geometry_id -- inspireid
	,geometry -- geometry
from 
	complex_geometry;

---------------------------------------
-- localisedcharacterstring
---------------------------------------
insert into localisedcharacterstring(
	id
	,language
	,country
	,characterencoding
	,text
) select distinct
	localised_character_string_id
	,language
	,country
	,text 
	,plain_text 
from feature_classification_local 
left join pt_free_text pt on feature_description_local = pt_free_text_id
left join pt_free_text_loc_char_string_rel ptrel on pt.pt_free_text_id = ptrel.pt_free_text
left join localised_character_string ls on ptrel.localised_character_string = ls.localised_character_string_id
left join md_characterset_code md on md.md_characterset_code_id = ls.character_encoding;

---------------------------------------
-- localtype
---------------------------------------
insert into localtype(
	namedplace 
	,localisedcharacterstring
) 
select distinct
	spatial_object
	,localised_character_string_id
from 
	location_instance li 
	left join feature_classification_local fcl on li.location_type_local = fcl.feature_classification_local_id
	left join pt_free_text pt on feature_description_local = pt_free_text_id
	left join pt_free_text_loc_char_string_rel ptrel on pt.pt_free_text_id = ptrel.pt_free_text
	left join localised_character_string ls on ptrel.localised_character_string = ls.localised_character_string_id
	left join md_characterset_code md on md.md_characterset_code_id = ls.character_encoding
where 
	li.location_type_local is not null;

---------------------------------------
-- placetypes
---------------------------------------
insert into placetypes(
	namedplace 
	,namedplacetype
) select 
  spatial_object
  ,gncode
from 
	location_instance li join
	classificationmapping cm on li.location_type = cm.egnid;

---------------------------------------
-- geographicalname
---------------------------------------
insert into geographicalname (
	id
	,namedplace
	,language
	,nativeness
	,namestatus
	,sourceofname
	,grammaticalgender
	,grammaticalnumber
)
select
	name_id
	,spatial_object
	,language
	,case when t_names.status in (1,2) then 'endonym' when t_names.status = 3 then 'exonym' end as nativeness
	,case when t_names.status = 1 then 'official' when t_names.status = 2 then 'other' when t_names.status = 3 then 'standardised' else 'other' end as status
	,administrator as source_of_name
	,case when gender = 1 then 'neuter' when gender = 2 then 'masculine' when gender = 3 then 'feminine' when gender = 4 then 'common' end as grammatical_gender
	,case when grammatical_number = 1 then 'plural' when grammatical_number = 2 then 'singular' when grammatical_number = 3 then 'dual' end as grammatical_number
from 
	(select
		min(location_instance_name_id) as name_id
		,spatial_object
		,language
		,status
		,administrator
	from 
		location_instance_name lin
		inner join location_instance li on lin.location_instance = li.location_instance_id 
		inner join localised_character_string ls on name = ls.localised_character_string_id
	group by 
		spatial_object
		,administrator
		,language
		,status
	) t_names 
	inner join location_instance_name lin2 on lin2.location_instance_name_id = t_names.name_id
;

---------------------------------------
-- spellingofname
---------------------------------------
-- in egn each spelling of a name is a different location_instance_name in EGN. they are linked via the spatial object.
insert into spellingofname(
	id
	,geographicalname
	,text 
	,script  
	,transliterationscheme 
)
select 
	spelling_id
	,name_id
	,text
	,script
	,transliteration_scheme
from (
	(select
		location_instance_name_id as spelling_id
		,plain_text as text
		,script
		,transliteration_scheme
		,spatial_object
		,administrator
		,language
		,status
	from
		location_instance_name lin
		inner join location_instance li on lin.location_instance = li.location_instance_id 
		inner join localised_character_string ls on name = ls.localised_character_string_id
	) t_spelling
	inner join
	(select
		min(location_instance_name_id) as name_id
		,spatial_object
		,language
		,status
		,administrator
	from 
		location_instance_name lin
		inner join location_instance li on lin.location_instance = li.location_instance_id 
		inner join localised_character_string ls on name = ls.localised_character_string_id
	group by 
		spatial_object
		,administrator
		,language
		,status
	) t_names
	on 
		t_spelling.spatial_object = t_names.spatial_object and
		t_spelling.administrator = t_names.administrator and
		t_spelling.language = t_names.language and
		t_spelling.status = t_names.status
);

	-- HIER BEN IK
