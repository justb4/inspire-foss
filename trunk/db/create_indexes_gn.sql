/*
-- Revision: $Revision: 86 $
-- Date of last change: $LastChangedDate: 2010-07-16 17:08:52 +0200 (vr, 16 jul 2010) $
-- Last changed by: $LastChangedBy: frans $
This script creates indexes  on the PostgreSQL schema for geographical names (GN) according to the INSPIRE specfication, version 3.0
Index creation is done is this separate script to allow index creation after a bulk insert.

Author(s): Frans Knibbe (Geodan)
*/

/* Set the schema search path. Comment out the following line if the public schema is  used. */
set search_path = inspire_gn_v3_0,public;

/* create indexes */
create index inspireid_localid on inspireid(localid);
create index inspireid_namespace on inspireid(namespace);
create index inspireid_versionid on inspireid(versionid);
create index inspireid_identifier on inspireid(localid,namespace,versionid);
create index relatedspatialobject_localid on relatedspatialobject(localid);
create index relatedspatialobject_namespace on relatedspatialobject(namespace);
create index relatedspatialobject_namedplace on relatedspatialobject(namedplace);
create index relatedspatialobject_versionid on relatedspatialobject(versionid);
create index relatedspatialobject_identifier on relatedspatialobject(localid,namespace,versionid);
create index localtype_language on localtype(language);
create index localtype_country on localtype(country);
create index localtype_characterencoding on localtype(characterencoding);
create index localtype_text on localtype(text);
create index localtype_namedplace on localtype(namedplace);
create index spellingofname_text on spellingofname(text);
create index spellingofname_script on spellingofname(script);
create index spellingofname_transliterationscheme on spellingofname(transliterationscheme);
create index spellingofname_geographicalname on spellingofname(geographicalname);
-- to do:  create full text index on spellingofname(text)
create index pronunciationofname_soundlink on pronunciationofname(pronunciationsoundlink);
create index pronunciationofname_ipa on pronunciationofname(pronunciationipa);
create index geographicalname_language on geographicalname(language);
create index geographicalname_nativeness on geographicalname(nativeness);
create index geographicalname_namestatus on geographicalname(namestatus);
create index geographicalname_sourceofname on geographicalname(sourceofname);
create index geographicalname_pronunciation on geographicalname(pronunciation);
create index geographicalname_grammaticalgender on geographicalname(grammaticalgender);
create index geographicalname_grammaticalnumber on geographicalname(grammaticalnumber);
create index geographicalname_namedplace on geographicalname(namedplace);
create index namedplace_inspireid on namedplace(inspireid);
create index namedplace_leastdetailedviewingresolution on namedplace(leastdetailedviewingresolution);
create index namedplace_mostdetailedviewingresolutionon on namedplace(mostdetailedviewingresolution);
create index namedplace_beginlifespanversion on namedplace(beginlifespanversion);
create index namedplace_endlifespanversion on namedplace(endlifespanversion);
create index namedplace_geometry on namedplace using gist (geometry);
create index placetypes_namedplace on placetypes(namedplace);
create index placetypes_namedplacetype on placetypes(namedplacetype);
