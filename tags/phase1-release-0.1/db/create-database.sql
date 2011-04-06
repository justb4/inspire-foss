drop database if exists inspire;
drop user if exists inspire;
create user inspire with password 'inspire' createdb;
create database :db_name with owner inspire template postgis;
\connect :db_name
alter schema public owner to inspire;
alter table geometry_columns owner to inspire;
alter table spatial_ref_sys owner to inspire;