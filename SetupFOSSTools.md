# Introduction #

The software from the inspire-foss project does not consist of an executable program. Rather there are various scripts and configurations that use a variety of Free and Open Source Software tools and components. This section lists the various tools required, with some guidance how to set things up. This setup has been tested/performed on Unix-like systems like Mac OSX and Ubuntu Linux. All tools are also available for the Windows OS-family (XP, 7 etc).

Note that there is also a [VirtualBox](http://www.virtualbox.org/) appliance for the entire inspire-foss environment listed below
based on Ubuntu 10.10. This will be distributed later.

# The Tools #

Below are all required and optional tools needed to run inspire-foss scripts.

## Core Tools ##

  * [Java](http://java.sun.com), recent version 6 or higher
  * [Subversion](http://subversion.tigris.org/) (SVN) client latest
  * [Apache Maven2](http://maven.apache.org), a build/run tool
  * [Unix shell](http://en.wikipedia.org/wiki/Unix_shell), the "glue", ties all functions together
  * [Apache Ant](http://ant.apache.org), a build/run tool (OPTIONAL)


## Transformation and ETL ##

  * [GDAL/OGR with PROJ](http://gdal.org), 1.7.3 or higher
  * [XSLTProc](http://http://xmlsoft.org/XSLT/xsltproc.html) fast XSLT processor
  * [iconv](http://www.gnu.org/software/libiconv/documentation/libiconv/iconv.1.html), character conversion (OPTIONAL)

Transformed data (GML) is published to a PostGIS DB via
the deegree tool `FSLoader`. See below how to install.

## Database ##

  * [PostgreSQL](http://postgres.org), 8.3 or higher
  * [PostGIS](http://refractions.postgis.net), recent version
  * [phppgadmin](http://sourceforge.net/projects/phppgadmin), recent version (OPTIONAL)

## Web Services ##

  * [deegree](http://deegree.org), latest, is downloaded automatically via Maven
  * [Apache HTTP server](http://apache.org), latest, downloaded OPTIONAL

# Installation #

## Linux (Ubuntu/Debian) ##

Most tools are easily installed using the `apt` program. Below some specifics.

## Core Tools ##

Usually Java from OpenJDK comes pre-installed on recent Ubuntu distributions. To install Java from Sun, ahem Oracle, see
http://stackoverflow.com/questions/3747789/how-to-install-sun-jdk-on-ubuntu-10-10-maverick-meerkat

Update `/etc/apt/sources.list` (uncomment `partners` stuff). Then
```
apt-get install sun-java6-bin sun-java6-jdk sun-java6-jre
```

If still openjdk prevails (do `java -version`), reconfigure alternatives
```
update-java-alternatives -l (list)
update-alternatives --config java
```

Others
```
apt-get install maven2
apt-get install subversion
```

## Transformation and ETL ##

Installing a recent GDAL version is trickier, as Ubuntu/Debian
repositories may contain older versions. Also (at least for the Netherlands) some tweaking of Proj is required.

Best is to use packages from [ubuntugis](https://launchpad.net/~ubuntugis) . To enable
add lines below to  new file `/etc/apt/sources.d/ubuntugis.list`

```
deb http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu maverick main 
deb-src http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu maverick main 
deb http://ppa.launchpad.net/ubuntugis/ubuntugis-testing/ubuntu maverick main 
deb-src http://ppa.launchpad.net/ubuntugis/ubuntugis-testing/ubuntu maverick main 
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 314DF160
apt-get update
```

Install GDAL:
```
apt-get install gdal-bin python-gdal
```

Update `/usr/share/proj` for these projections, at least check if they are as below.

```

<28992> +proj=sterea +lat_0=52.15616055555555 +lon_0=5.38763888888889 +k=0.999908 +x_0=155000 +y_0=463000 +ellps=bessel +units=m +towgs84=565.2369,50.0087,465.658,-0.406857330322398,0.350732676542563,-1.8703473836068,4.0812 +no_defs <>

<4258> +proj=longlat +ellps=GRS80 +datum=WGS84 +no_defs  <>

<900913> +proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +no_defs
```

`xsltproc` and `iconv` is usually available in a standard install.

The deegree `FSLoader` can be installed by executing 2 scripts
in the directory `/tools/loader/deegree-tools`:

```
./get-deegree-tools.sh
./install-deegree-tools.sh
```

(TODO: use Maven).

## Database ##

```
apt-get install postgresql-8.4-postgis`
```

Below a setup for using PostGIS and the inspire DB.

```
# create PostGIS template DB
su postgres
createdb postgis
createlang plpgsql postgis

psql -d postgis -f /usr/share/postgresql/8.4/contrib/postgis-1.5/postgis.sql
psql -d postgis -f /usr/share/postgresql/8.4/contrib/postgis-1.5/spatial_ref_sys.sql
psql -d postgis -f /usr/share/postgresql/8.4/contrib/postgis_comments.sql

# setup inspire DB
createuser inspire (superuser "Y")

# creates database "inspire_blob" with owner "inspire"
/webapps/deegree3/src/main/resources/create-database.sh

passwd postgres (postgres)

# set password inspire user (for VM)
# as user postgre run:
psql
alter user postgres with password 'postgres';
alter user inspire with password 'inspire';

```

NB also check if the `spatial_ref_sys` contains the proper "proj-settings" for your EPSG codes (see GDAL/proj tweaks above).

`phppgadmin` is optional to manage a PostgreSQL DB via a web client.

```
apt-get install phppgadmin
```

(May replace `apache2 mpm worker` with `prefork`)

## Web Services ##

Apache webserver (only if you need `phppgadmin` and the WMS viewer)

```
apt-get install apache2
```

[deegree](http://deegree.org) is downloaded automatically via Maven
when running the deegree server. In the directory `/webapps/deegree3` execute `runnit.sh` or directly via Maven:

```
mvn clean install tomcat:run
```