DROP TABLE IF EXISTS gn_spelling;
DROP TABLE IF EXISTS gn_name;
DROP TABLE IF EXISTS ad_component;
DROP TABLE IF EXISTS ad_thoroughfare;
DROP TABLE IF EXISTS ad_postal;
DROP TABLE IF EXISTS ad_admin_unit;
DROP TABLE IF EXISTS ad_address_area;
DROP TABLE IF EXISTS ad_locator_designator;
DROP TABLE IF EXISTS ad_locator;
DROP TABLE IF EXISTS ad_address;
DROP TABLE IF EXISTS cp_parcel;

-- Table: gn_name

create table gn_name (
  id text primary key,
  spelling text,
  language char(3), -- ISO 639-2:2007?
  native_value text,
  status text,
  source_of_name text
);

-- ALTER TABLE gn_name ADD CONSTRAINT gn_name_named_place_fkey FOREIGN KEY (named_place) REFERENCES named_place (named_place_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION;

 -- Table: gn_spelling
 create table gn_spelling (
    id text primary key,
    gn_name_id text references gn_name(id) not null,
    text text,
    script text
 );

 -- ALTER TABLE gn_spelling ADD CONSTRAINT gn_spelling_gn_name_fkey FOREIGN KEY (gn_name_id) REFERENCES gn_name (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION;
 CREATE INDEX gn_spelling_gn_name_id_idx ON gn_spelling USING btree (gn_name_id);

-- Table: ad_admin_unit

CREATE TABLE ad_admin_unit
(
  id text primary key,
  gn_name_id text references gn_name(id),
  name text,
  level integer
);

-- Table: ad_address

CREATE TABLE ad_address
(
  id text primary key,
  valid_from timestamp with time zone not null,
  valid_to timestamp with time zone
);

select AddGeometryColumn('','ad_address','position',4258,'POINT',2);
alter table ad_address alter column position set not null;
create index position_sidx on ad_address using gist (position);


-- Table: ad_address_area

CREATE TABLE ad_address_area
(
  id text primary key,
  -- ad_admin_unit_id text references ad_admin_unit(id), LATER ??
  gn_name_id text references gn_name(id),
  name text
);

-- Table: ad_thoroughfare

CREATE TABLE ad_thoroughfare
(
  id text primary key,
  -- ad_admin_unit_id text references ad_admin_unit(id), LATER ??
  ad_address_area_id text references ad_address_area(id),
  gn_name_id text references gn_name(id),
  name text
);

-- Table: ad_postal

CREATE TABLE ad_postal
(
  id text primary key,
  gn_name_id text references gn_name(id),
  post_name text,
  post_code text
);



-- Table: ad_component

CREATE sequence component_id_seq;

CREATE TABLE ad_component
(
  id integer primary key default nextval('component_id_seq'),
  ad_address_id text references ad_address(id) not null,
  ad_admin_unit_id text references ad_admin_unit(id),
  ad_address_area_id text references ad_address_area(id),
  ad_postal_id text references ad_postal(id),
  ad_thoroughfare_id text references ad_thoroughfare(id)
);


alter sequence component_id_seq owned by ad_component.id;
create index component_ad_address_id_idx on ad_component (ad_address_id);
create index component_admunitname_idx on ad_component (ad_admin_unit_id);
create index component_address_area_idx on ad_component (ad_address_area_id);
create index component_postal_idx on ad_component (ad_postal_id);
create index component_tf_idx on ad_component (ad_thoroughfare_id);

-- Table: ad_locator
CREATE TABLE ad_locator
(
  id text primary key,
  ad_address_id text references ad_address(id) not null,
  level text not null,
  name text
);

create index ad_locator_ad_address_id_idx on ad_locator(ad_address_id);

-- Table: ad_locator_designator
CREATE sequence ad_locator_designator_id_seq;

CREATE TABLE ad_locator_designator
(
  id integer primary key default nextval('ad_locator_designator_id_seq'),
  ad_locator_id text references ad_locator(id),
  type integer,
  value text
);

create index locator_designator_idx on ad_locator_designator(ad_locator_id);
alter sequence ad_locator_designator_id_seq owned by ad_locator_designator.id;


-- Table: cp_parcel

CREATE TABLE cp_parcel
(
  id text primary key,
  label text,
  national_ref text
);

select AddGeometryColumn('','cp_parcel','geometry',4258,'MULTIPOLYGON',2);
alter table cp_parcel alter column geometry set not null;
create index geometry on cp_parcel using gist (geometry);

ALTER TABLE ad_address OWNER TO inspire;
ALTER TABLE ad_thoroughfare OWNER TO inspire;
ALTER TABLE ad_postal OWNER TO inspire;
ALTER TABLE ad_admin_unit OWNER TO inspire;
ALTER TABLE ad_address_area OWNER TO inspire;
ALTER TABLE ad_component OWNER TO inspire;
ALTER TABLE ad_locator OWNER TO inspire;
ALTER TABLE ad_locator_designator OWNER TO inspire;
ALTER TABLE gn_name OWNER TO inspire;
ALTER TABLE gn_spelling OWNER TO inspire;
ALTER TABLE cp_parcel OWNER TO inspire;
