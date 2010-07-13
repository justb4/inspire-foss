/*
-- Revision: $Revision: 83 $
-- Date of last change: $LastChangedDate: 2010-07-13 14:17:51 +0200 (di, 13 jul 2010) $
-- Last changed by: $LastChangedBy: frans $
This script creates indexes  on the PostgreSQL schema for geographical names (GN) according to the INSPIRE specfication, version 3.0
Index creation is done is this separate script to allow index creation after a bulk insert.

Author(s): Frans Knibbe (Geodan)
Date:  2010-06
*/

create index Identifier_localId on INSPIRE_GN_v3_0.Identifier(localId);
create index Identifier_namespace on INSPIRE_GN_v3_0.Identifier(namespace);
create index Identifier_versionId on INSPIRE_GN_v3_0.Identifier(versionId);
create index Identifier_identifier on INSPIRE_GN_v3_0.Identifier(localId,namespace,versionId);
create index LocalType_language on INSPIRE_GN_v3_0.LocalType(language);
create index LocalType_country on INSPIRE_GN_v3_0.LocalType(country);
create index LocalType_characterEncoding on INSPIRE_GN_v3_0.LocalType(characterEncoding);
create index LocalType_text on INSPIRE_GN_v3_0.LocalType(text);
create index SpellingOfName_text on INSPIRE_GN_v3_0.SpellingOfName(text);
create index SpellingOfName_script on INSPIRE_GN_v3_0.SpellingOfName(script);
create index SpellingOfName_transliterationScheme on INSPIRE_GN_v3_0.SpellingOfName(transliterationScheme);
create index SpellingOfName_geographicalName on INSPIRE_GN_v3_0.SpellingOfName(geographicalName);
-- to do:  create full text index on SpellingOfName(text)
create index PronunciationOfName_SoundLink on INSPIRE_GN_v3_0.PronunciationOfName(pronunciationSoundLink);
create index PronunciationOfName_IPA on INSPIRE_GN_v3_0.PronunciationOfName(pronunciationIPA);
create index GeographicalName_language on INSPIRE_GN_v3_0.GeographicalName(language);
create index GeographicalName_nativeness on INSPIRE_GN_v3_0.GeographicalName(nativeness);
create index GeographicalName_nameStatus on INSPIRE_GN_v3_0.GeographicalName(nameStatus);
create index GeographicalName_sourceOfName on INSPIRE_GN_v3_0.GeographicalName(sourceOfName);
create index GeographicalName_pronunciation on INSPIRE_GN_v3_0.GeographicalName(pronunciation);
create index GeographicalName_grammaticalGender on INSPIRE_GN_v3_0.GeographicalName(grammaticalGender);
create index GeographicalName_grammaticalNumber on INSPIRE_GN_v3_0.GeographicalName(grammaticalNumber);
create index GeographicalName_namedPlace on INSPIRE_GN_v3_0.GeographicalName(namedPlace);
create index NamedPlace_inspireId on INSPIRE_GN_v3_0.NamedPlace(inspireId);
create index NamedPlace_leastDetailedViewingScale on INSPIRE_GN_v3_0.NamedPlace(leastDetailedViewingScale);
create index NamedPlace_mostDetailedViewingscale on INSPIRE_GN_v3_0.NamedPlace(mostDetailedViewingscale);
create index NamedPlace_beginLifespanVersion on INSPIRE_GN_v3_0.NamedPlace(beginLifespanVersion);
create index NamedPlace_endLifespanVersion on INSPIRE_GN_v3_0.NamedPlace(endLifespanVersion);
create index NamedPlace_geometry on INSPIRE_GN_v3_0.NamedPlace using gist (geometry);
create index PlaceTypes_namedPlace on INSPIRE_GN_v3_0.PlaceTypes(namedPlace);
create index PlaceTypes_namedPlaceType on INSPIRE_GN_v3_0.PlaceTypes(namedPlaceType);
create index PlaceLocalTypes_namedPlace on INSPIRE_GN_v3_0.PlaceLocalTypes(namedPlace);
create index PlaceLocalTypes_localType on INSPIRE_GN_v3_0.PlaceLocalTypes(localType);
create index PlaceRelatedObjects_namedPlace on INSPIRE_GN_v3_0.PlaceRelatedObjects(namedPlace);
create index PlaceRelatedObjects_relatedSpatialObject on INSPIRE_GN_v3_0.PlaceRelatedObjects(relatedSpatialObject);