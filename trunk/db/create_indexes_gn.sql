/*
-- Revision: $Revision: 85 $
-- Date of last change: $LastChangedDate: 2010-07-14 16:36:13 +0200 (wo, 14 jul 2010) $
-- Last changed by: $LastChangedBy: frans $
This script creates indexes  on the PostgreSQL schema for geographical names (GN) according to the INSPIRE specfication, version 3.0
Index creation is done is this separate script to allow index creation after a bulk insert.

Author(s): Frans Knibbe (Geodan)
*/

/* Set the schema search path. Comment out the following line if the public schema is  used. */
set search_path = inspire_gn_v3_0,public;

/* create indexes */
create index identifier_localid on identifier(localid);
create index identifier_namespace on identifier(namespace);
create index identifier_versionid on identifier(versionid);
create index identifier_identifier on identifier(localid,namespace,versionid);
create index localtype_language on localtype(language);
create index localtype_country on localtype(country);
create index localtype_characterencoding on localtype(characterencoding);
create index localtype_text on localtype(text);
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
create index namedplace_leastdetailedviewingscale on namedplace(leastdetailedviewingscale);
create index namedplace_mostdetailedviewingscale on namedplace(mostdetailedviewingscale);
create index namedplace_beginlifespanversion on namedplace(beginlifespanversion);
create index namedplace_endlifespanversion on namedplace(endlifespanversion);
create index namedplace_geometry on namedplace using gist (geometry);
create index placetypes_namedplace on placetypes(namedplace);
create index placetypes_namedplacetype on placetypes(namedplacetype);
create index placelocaltypes_namedplace on placelocaltypes(namedplace);
create index placelocaltypes_localtype on placelocaltypes(localtype);
create index placerelatedobjects_namedplace on placerelatedobjects(namedplace);
create index placerelatedobjects_relatedspatialobject on placerelatedobjects(relatedspatialobject);