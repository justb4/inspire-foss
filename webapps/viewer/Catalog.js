/*
 * Copyright (C) 2010  Het Kadaster - The Netherlands
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

Ext.namespace("GeoViewer");
Ext.namespace("GeoViewer.Map");
Ext.namespace("GeoViewer.Catalog");
Ext.namespace("GeoViewer.User");

OpenLayers.Util.onImageLoadErrorColor = "transparent";
OpenLayers.ProxyHost = "/cgi-bin/proxy.cgi?url=";

Ext.BLANK_IMAGE_URL = 'http://kademo.nl/lib/ext/3.1.0/resources/images/default/s.gif';

var MY_LOCATIONS = {
	TILBURG: new OpenLayers.LonLat(5.0850, 51.5639),
	LIMBURG: new OpenLayers.LonLat(5.891, 50.775),
	AMERSFOORT: new OpenLayers.LonLat(5.2861, 52.1613),
	LOSSER: new OpenLayers.LonLat(6.84, 52.30)
};

/** Use NL RD projection/resolutions options. */

GeoViewer.Catalog.options4258 = {
	PROJECTION: 'EPSG:4258',
	UNITS: 'dd',
	RESOLUTIONS: [0.017929030859375, 0.0089645154296875001, 0.0044822577148437501, 0.002241128857421875, 0.0011205644287109375, 0.00056028221435546876, 0.00028014110717773438, 0.00014007055358886719, 7.0035276794433595e-05, 3.5017638397216797e-05, 1.7508819198608399e-05, 8.7544095993041994e-06, 4.3772047996520997e-06, 2.1886023998260498e-06, 1.0943011999130249e-06, 5.4715059995651246e-07, 2.7357529997825623e-07, 1.3678764998912812e-07, 6.8393824994564058e-08, 3.4196912497282029e-08], //[860.160, 430.080, 215.040, 107.520, 53.760, 26.880, 13.440, 6.720, 3.360, 1.680, 0.840, 0.420, 0.210, 0.105, 0.0525],
	MAX_EXTENT: new OpenLayers.Bounds(2.7984656, 50.6264231, 7.3882975, 53.9511147),
	// CENTER: new OpenLayers.LonLat(5.387, 52.155),
	CENTER: MY_LOCATIONS.AMERSFOORT,
	XY_PRECISION: 6,
	ZOOM: 1,
	MAX_FEATURES: 10
};

GeoViewer.Catalog.urls = {
    DEEGREE_LOCAL_WMS :  'http://localhost:8080/deegree3/services?',
	GS2_INSPIRE_WMS :  'http://kademo.nl/gs2/inspire/wms?',
	GS2_KADASTER_WMS :  'http://gis.kademo.nl/gs2/wms?',
	TILECACHE :  'http://gis.kademo.nl/cgi-bin/tilecache.cgi?',
    INTERACTIVE_INSTRUMENTS_WMS: 'http://services.interactive-instruments.de/exm-ni/cgi-bin/xs01-wms?',
    WHEREGROUP_WMS: 'http://osm.wheregroup.com/cgi-bin/osm_basic.xml?'
};

GeoViewer.Catalog.lang = {
	en : {
		txtWarning : "Warning",
		txtLegend : "Legend",
		txtNoLayerSelected : "No Layer Selected",
		txtFeatureInfo : "Feature info",
		txtNoData : "No info found",
		txtLayerNotAdded : "Layer not added",
		txtAttribute : "Attribute",
		txtValue		:"Value",
		txtMask : "Fetching info...",
		txtLayers : "Layers",
		txtNoMatch : "Layer info not found",
		txtLoading : "Loading...",
		txtPlaces : "Places",
		txtMapContexts : "Contexts",

		txtTitleFeatureInfo	 : "Feature info",
		txtLoadMask : "Loading...",
		txtUnknownFeatureType : "Unknown",
		txtNoLayersWithFeatureInfo: 'No layers with feature info available in current map.',

		txtPan : "Pan map",
		txtZoomIn : "Zoom in",
		txtZoomOut : "Zoom out",
		txtZoomToFullExtent : "Zoom out to maximum extent",
		txtZoomPrevious : "Zoom to previous extent",
		txtZoomNext : "Zoom to next extent",
		txtMeasureLength: "Measure distance (draw polyline, double-click after last segment)",
		txtMeasureArea: "Measure area (draw polygon, double-click after last vertex)",
		txtLength: "Length",
		txtArea: "Area"
	}
};

GeoViewer.Catalog.layers = {
	blanco : new OpenLayers.Layer.Image(
			"Blanc",
			Ext.BLANK_IMAGE_URL,
			GeoViewer.Catalog.options4258.MAX_EXTENT,
			new OpenLayers.Size(10, 10),
	{resolutions: GeoViewer.Catalog.options4258.RESOLUTIONS, isBaseLayer: true, noLegend: true}
			),

	topRaster : new OpenLayers.Layer.WMS("Topo Raster",
			GeoViewer.Catalog.urls.GS2_KADASTER_WMS,
	{layers: "top_raster", format: "image/jpeg", transparent: false, version: '1.3.0'},
	{singleTile: true,  isBaseLayer: true,   visibility: false, noLegend: true, yx: ['EPSG:4258']}
			),

/*    wheregroupOSM: new OpenLayers.Layer.WMS(
       "OpenStreetMapEU",
       GeoViewer.Catalog.urls.WHEREGROUP_WMS,
       {layers: 'OSM_basic', format: 'image/png', transparent: false, version: '1.3.0', CRS: 'EPSG:4326'},
       {singleTile: true, opacity: 0.2, isBaseLayer: true, visibility: false, attribution: "Data CC-By-SA by <a href='http://openstreetmap.org/'>OpenStreetMap</a>", noLegend: true, yx: ['EPSG:4258']}
   ), */

	osm4258 : new OpenLayers.Layer.WMS(
			"OpenStreetMapNL",
			GeoViewer.Catalog.urls.TILECACHE,
	{layers: "osm_4258", format: "image/png", transparent: false, bgcolor: "0x99b3cc"},
	{singleTile: false, isBaseLayer: true, visibility: true, attribution: "Data CC-By-SA by <a href='http://openstreetmap.org/'>OpenStreetMap</a>", noLegend: true}
			),


	// START "Official INSPIRE Layers" (with appropriate Layer Naming)
	inspireAU : new OpenLayers.Layer.WMS("INSPIRE Admin Units (all)",
			GeoViewer.Catalog.urls.DEEGREE_LOCAL_WMS,
	{layers: "AU.AdministrativeUnit", format: "image/png", transparent: true, version: '1.3.0'},
	{isBaseLayer: false, singleTile: true,  visibility: false, alpha:true
		,featureInfoFormat: "application/vnd.ogc.gml"}
			),

	inspireCP : new OpenLayers.Layer.WMS("INSPIRE Parcels",
			GeoViewer.Catalog.urls.DEEGREE_LOCAL_WMS,
	{layers: "CP.CadastralParcel", format: "image/png", transparent: true, version: '1.3.0'},
	{isBaseLayer: false, singleTile: true,  visibility: false, alpha:true
		,featureInfoFormat: "application/vnd.ogc.gml"}
			),


	inspireTNRoadLink: new OpenLayers.Layer.WMS("INSPIRE TransportNetworks (RoadLink)",
			GeoViewer.Catalog.urls.DEEGREE_LOCAL_WMS,
	{layers: "TN-RO.RoadLink", format: "image/png", transparent: true, version: '1.3.0'},
	{isBaseLayer: false, singleTile: true,  visibility: false, alpha:true
		,featureInfoFormat: "application/vnd.ogc.gml"}
			)

};

/**
 * Define themes
 *
 * Each theme contains FeatureTypes
 * FeatureTypes (with a geometry) contain (OpenLayers) Layers
 *
 * More aspects can be configured later.
 */
GeoViewer.Catalog.themes = {
    AU: {
		name: 'Administrative Units'
		,abbrev: 'AU'
		,featureTypes: {
          AdministrativeUnit: {
                name: 'AdministrativeUnit',
                fields: new Array(''),
                layers : [
                    'inspireAU'
                ]
            }
		}
	}
	,CP: {
		name: 'Cadastral Parcels'
		,abbrev: 'CP'
		,featureTypes: {
			CadastralParcel: {
				name: 'CadastralParcel',
				fields: new Array('text', 'language', 'nameStatus', 'nativeness'),
				layers : [
					'inspireCP'
				]
			}
			,CadastralBoundary: null
		}
	}
/*	,GN: {
		name: 'Geographical Names'
		,abbrev: 'GN'
		,featureTypes: {
			NamedPlaceAll: {
				name: 'NamedPlace',
				layers : [
					'inspireGN'
				]
			},
			NamedPlaceFG: {
				name: 'NamedPlace - Functional Area',
				layers : [
					'inspireGNFunGeb'
				]
			},
			NamedPlaceGG: {
				name: 'NamedPlace - Geographic Area',
				layers : [
					'inspireGNGeoGeb'
				]
			},
			NamedPlaceIE: {
				name: 'NamedPlace - Inrichtings Element',
				layers : [
					'inspireGNInrElm'
				]
			},
			NamedPlaceWD: {
				name: 'NamedPlace - Road',
				layers : [
					'inspireGNWegDeelPunt'
				]
			}

		}
	}
	,HY: {
		name: 'Hydrography'
		,abbrev: 'HY'
		,featureTypes: {
			StandingWater: {
				name: 'StandingWater',
				layers: ['inspireHYWaterdeelVlak']
			}
			,Watercourse: {
				name: 'WaterCourse',
				layers: ['inspireHYWaterdeelLijn']
			}
			,All: {
				name: 'All',
				layers: ['inspireHYWaterdeelVlak','inspireHYWaterdeelLijn']
			}
		}
	}*/

	,TN: {
		name: 'Transport Networks'
		,abbrev: 'TN'
		,featureTypes: {
/*			RailwayTransport:  {
				name: 'RailwayLink',
				layers: ['inspireTNSpoorbaandeelLijn']
			}
			,RoadTransportPolygons:  {
				name: 'RoadArea',
				layers: ['inspireTNWegdeelVlak']
			}
			,
			*/
            RoadTransport_RoadLink:  {
				name: 'RoadTransport_RoadLink',
				layers: ['inspireTNRoadLink']
			}
/*			,RoadTransport:  {
				name: 'Roads (All)',
				layers: ['inspireTNWegdeelVlak','inspireTNRoadLink']
			}  */
		}
	}

	/*
	 ,PS: {
	 name: 'Protected Sites'
	 ,abbrev: 'PS'
	 ,featureTypes: {
	 ProtectesSite: null
	 }
	 }

 */
};
