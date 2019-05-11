#! /bin/bash

# PostgreSql: https://help.ubuntu.com/community/PostgreSQL
# PostGIS: http://trac.osgeo.org/postgis/wiki/UsersWikiPostGIS24UbuntuPGSQL10Apt


gitusername="Hexaminer"
gituseremail="16254422+hexaminer@users.noreply.github.com"

postgresPassword='raspberry'

sudo apt-get update | sudo apt-get install git -y
git config --global user.name $gitusername
git config --global user.email $gituseremail
git config --global color.ui auto

sudo apt-get install postgresql postgresql-contrib  postgresql-9.6-pgrouting postgresql-9.6-pgrouting-scripts postgresql-9.6-postgis-2.3 postgresql-9.6-postgis-2.3-scripts -y 

sudo sed -i -e "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/9.6/main/postgresql.conf
sudo -u postgres psql template1 -c "ALTER USER postgres with encrypted password '$postgresPassword';"

sudo bash -c "printf '\n # My Own Settings  \n' >>   /etc/postgresql/9.6/main/pg_hba.conf"
sudo bash -c "printf 'host    all             all             192.168.1.10/24           md5' >>   /etc/postgresql/9.6/main/pg_hba.conf"

sudo -u postgres psql -c "CREATE EXTENSION adminpack;"
sudo -u postgres psql -c 'CREATE DATABASE gisdb;'
sudo -u postgres psql gisdb -c 'CREATE SCHEMA postgis;
ALTER DATABASE gisdb SET search_path=public, postgis, contrib;'
sudo -u postgres psql gisdb -c 'CREATE EXTENSION postgis SCHEMA postgis;
CREATE EXTENSION postgis_topology;
CREATE EXTENSION postgis_sfcgal SCHEMA postgis;
CREATE EXTENSION fuzzystrmatch;
CREATE EXTENSION address_standardizer;
CREATE EXTENSION address_standardizer_data_us;
CREATE EXTENSION postgis_tiger_geocoder;
SELECT postgis_full_version();

CREATE  EXTENSION pgrouting SCHEMA postgis;
SELECT * FROM pgr_version();
'





