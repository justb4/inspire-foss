drop database if exists :db_name;
create database :db_name with owner inspire template postgis;
\connect :db_name
alter schema public owner to inspire;
alter table geometry_columns owner to inspire;
alter table spatial_ref_sys owner to inspire;