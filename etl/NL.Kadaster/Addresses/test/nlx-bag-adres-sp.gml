SELECT na.identificatie,na.huisnummer,na.huisletter,na.huisnummertoevoeging,na.gerelateerdeopenbareruimte,na.postcode,na.gerelateerdewoonplaats,translate(to_char(na.begindatumtijdvakgeldigheid, 'YYYY-MM-DD HH24:MI:SS'),' ', 'T') as begindatumtijdvakgeldigheid,translate(to_char(na.einddatumtijdvakgeldigheid, 'YYYY-MM-DD HH24:MI:SS'), ' ', 'T') as einddatumtijdvakgeldigheid,ST_Force_2D(ST_Centroid(ao.geovlak)) FROM standplaatsactueelbestaand as ao INNER JOIN nummeraanduidingactueelbestaand as na ON (ao.hoofdadres = na.identificatie)
<?xml version="1.0" encoding="utf-8" ?>
<!--
  ~ This program is free software: you can redistribute it and/or modify
  ~ it under the terms of the GNU General Public License as published by
  ~ the Free Software Foundation, either version 3 of the License, or
  ~ (at your option) any later version.
  ~
  ~ This program is distributed in the hope that it will be useful,
  ~ but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  ~ GNU General Public License for more details.
  ~
  ~ You should have received a copy of the GNU General Public License
  ~ along with this program.  If not, see <http://www.gnu.org/licenses/>.
  -->

<ogr:FeatureCollection
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://ogr.maptools.org/ .xsd"
     xmlns:ogr="http://ogr.maptools.org/"
     xmlns:gml="http://www.opengis.net/gml">
  <ogr:featureMember>
    <ogr:adres gml:id="adres.0">
      <gml:boundedBy><gml:Envelope srsName="urn:ogc:def:crs:EPSG::4258"><gml:lowerCorner>53.320901405269076 6.932018480388243</gml:lowerCorner><gml:upperCorner>53.320901405269076 6.932018480388243</gml:upperCorner></gml:Envelope></gml:boundedBy>
      <ogr:geometryProperty><gml:Point srsName="urn:ogc:def:crs:EPSG::4258"><gml:pos>53.320901405269076 6.932018480388243</gml:pos></gml:Point></ogr:geometryProperty>
      <ogr:identificatie>10200000101386</ogr:identificatie>
      <ogr:huisnummer>1</ogr:huisnummer>
      <ogr:gerelateerdeopenbareruimte>855300000001319</ogr:gerelateerdeopenbareruimte>
      <ogr:postcode>9934RA</ogr:postcode>
      <ogr:begindatumtijdvakgeldigheid>2010-05-11T00:00:00</ogr:begindatumtijdvakgeldigheid>
    </ogr:adres>
  </ogr:featureMember>
</ogr:FeatureCollection>
