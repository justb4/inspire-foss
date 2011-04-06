/*
 * Copyright (C) 2010  Het Kadaster
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
	AMERSFOORT: new OpenLayers.LonLat(5.2861, 52.1613)
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
	ZOOM: 2,
	MAX_FEATURES: 10
};

GeoViewer.Catalog.urls = {
	GS2_WMS :  'http://gis.kademo.nl/gs2/wms?',
	GWC_WMS :  'http://gis.kademo.nl/gwc/service/wms?',
	TILECACHE :  'http://gis.kademo.nl/cgi-bin/tilecache.cgi?'
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
	{resolutions: GeoViewer.Catalog.options4258.RESOLUTIONS, isBaseLayer: true, displayInLayerSwitcher: true}
			),

	topRaster : new OpenLayers.Layer.WMS("Topo Raster",
			GeoViewer.Catalog.urls.GS2_WMS,
	{layers: "top_raster", format: "image/jpeg", transparent: false},
	{singleTile: true,  visibility: false
	} //alpha true is for PNG hacks, but causes problems on transparency...
			),

	osm4258 : new OpenLayers.Layer.WMS(
			"OpenStreetMap",
			GeoViewer.Catalog.urls.TILECACHE,
	{layers: "osm_4258", format: "image/png", transparent: false, bgcolor: "0x99b3cc"},
	{singleTile: false,  visibility: true}
			),

	inspireAD : new OpenLayers.Layer.WMS("INSPIRE Addresses",
			GeoViewer.Catalog.urls.GS2_WMS,
	{layers: "kad:ad_address", format: "image/png", transparent: true},
	{isBaseLayer: false, singleTile: true,  visibility: true, alpha:true
		,featureInfoFormat: "application/vnd.ogc.gml"} //alpha true is for PNG hacks, but causes problems on transparency...
			),

	deegreeinspireAD : new OpenLayers.Layer.WMS("INSPIRE Addresses deegree",
			"services?",
	{layers: "addresses", format: "image/png", transparent: true},
	{isBaseLayer: false, singleTile: true,  visibility: true, alpha:true
		,featureInfoFormat: "application/vnd.ogc.gml"} //alpha true is for PNG hacks, but causes problems on transparency...
			),


	deegreeinspireCP : new OpenLayers.Layer.WMS("INSPIRE CadastralParcels deegree",
			"services?",
	{layers: "cadastralparcels", format: "image/png", transparent: true},
	{isBaseLayer: false, singleTile: true,  visibility: true, alpha:true
		,featureInfoFormat: "application/vnd.ogc.gml"} //alpha true is for PNG hacks, but causes problems on transparency...
			),

	inspireCP : new OpenLayers.Layer.WMS("INSPIRE Parcels",
			GeoViewer.Catalog.urls.GS2_WMS,
	{layers: "kad:cp_parcel", format: "image/png", transparent: true},
	{isBaseLayer: false, singleTile: true,  visibility: true, alpha:true
		,featureInfoFormat: "application/vnd.ogc.gml"} //alpha true is for PNG hacks, but causes problems on transparency...
			),

	parcelTestLayer : new OpenLayers.Layer.WMS("INSPIRE Test Parcels",
			GeoViewer.Catalog.urls.GS2_WMS,
	{layers: "inspire_test:cp_parcel", format: "image/png", transparent: true},
	{isBaseLayer: false, singleTile: true,  visibility: false, alpha:true
		,featureInfoFormat: "application/vnd.ogc.gml"} //alpha true is for PNG hacks, but causes problems on transparency...
			),

	percelen28992 : new OpenLayers.Layer.WMS("INSPIRE percelen28992",
			GeoViewer.Catalog.urls.GS2_WMS,
	{layers: "inspire_test:percelen28992", format: "image/png", transparent: true},
	{isBaseLayer: false, singleTile: true,  visibility: false, alpha:true
		,featureInfoFormat: "application/vnd.ogc.gml"} //alpha true is for PNG hacks, but causes problems on transparency...
			),

	percelen4258 : new OpenLayers.Layer.WMS("INSPIRE percelen4258",
			GeoViewer.Catalog.urls.GS2_WMS,
	{layers: "inspire_test:percelen4258", format: "image/png", transparent: true},
	{isBaseLayer: false, singleTile: true,  visibility: false, alpha:true
		,featureInfoFormat: "application/vnd.ogc.gml"} //alpha true is for PNG hacks, but causes problems on transparency...
			)
};


/** SET OPTIONS FOR GEOVIEWER. **/

GeoViewer.lang = GeoViewer.Catalog.lang.en;

GeoViewer.layout = {
	north : {

		options : {
			layout: 'border',
			width: '100%',
			height: 80,
			bodyBorder: false,
			border: false
		},
		panels: [
			{
				type: 'gv-html',
				options: {
					id: 'gv-logo-panel',
					region: 'center',
					bodyBorder: false,
					border: false,
					url: 'content/north-logo.html',
					height: 55
				}
			},
			{
				type: 'gv-user',
				options: {
					id: 'gv-menu-panel',
					region: 'south',
					bodyBorder: false,
					border: false,
					height: 25
				}
			}
		]
	},

	west : {
		options : {
			layout: 'accordion',
			width: 240,
			collapsible: true,
			split	: true,
			border: false
		},
		panels: [
			{
				type: 'gv-layer-browser'
			},
			{
				type: 'gv-context-browser'
			},
			{
				type: 'gv-html',
				options: {
					id: 'gv-info-west',
					url: 'content/west-info.html',
					title: 'Info'
				}
			},
			{
				type: 'gv-layer-legend'
			}
		]
	}};


var Pages = function() {
	return {
		showPage : function(pageName) {
			Pages.hideMap();
			Pages.doLoad(pageName);
			Ext.get('gv-page').show();
		},

		hideMap : function() {
			Ext.get('gv-west-panel').hide();
			Ext.get('gv-center-panel').hide();
		},

		showMap : function() {
			Ext.get('gv-page').hide();
			Ext.get('gv-west-panel').show();
			Ext.get('gv-center-panel').show();
			// GeoViewer.main.doLayout();
		},

		doLoad : function(pageName) {
			Ext.get('gv-page').load({
				url: 'content/' + pageName + '.html?t=' + new Date().getMilliseconds()
			});
		}
	};
}();

GeoViewer.User.createPanel = function(options) {
	var menuHandler = function(button) {
		Pages.showPage(button.page);
	};

	var menu = new Ext.Toolbar({
		id: 'gv-main-menu',
		floating: false ,
		items: [
			{
				xtype: 'tbspacer',
				width: 240
			},

			{
				xtype: 'tbbutton',
				text: 'Home',
				page: 'home',
				handler: menuHandler
			},

			{
				xtype: 'tbspacer',
				width: 30
			},

			{	xtype: 'tbbutton',
				text: 'Info',
				menu: [
					{
						text: 'Features',
						page: 'features',
						handler: menuHandler
					},
					{
						text: 'Integration',
						page: 'integration',
						handler: menuHandler
					}
				]
			},

			{
				xtype: 'tbspacer',
				width: 20
			},
			{
				xtype: 'tbbutton',
				text: 'Map',
				handler: Pages.showMap
			},
			{
				xtype: 'tbspacer',
				width: 20
			},
			{
				xtype: 'tbbutton',
				text: 'Client',
				page: 'client',
				handler: menuHandler
			},
			{
				xtype: 'tbspacer',
				width: 20
			},
			{
				xtype: 'tbbutton',
				text: 'Development',
				page: 'development',
				handler: menuHandler
			},
			{
				xtype: 'tbspacer',
				width: 20
			},
			{
				xtype: 'tbbutton',
				text: 'Contact',
				page: 'contact',
				handler: menuHandler
			}

		]
	});

	var panel = new Ext.Panel(options);
	panel.add(menu);

	return panel;
};


GeoViewer.Map.options = GeoViewer.Catalog.options4258;

/** Collect layers from catalog. */
GeoViewer.Map.layers = [

	/*
	 * ==================================
	 *            BaseLayers
	 * ==================================
	 */
	// GeoViewer.Catalog.layers.osm,
	GeoViewer.Catalog.layers.osm4258,
	GeoViewer.Catalog.layers.topRaster,
	GeoViewer.Catalog.layers.blanco,


	/*
	 * ==================================
	 *            OVERLAYS
	 * ==================================
	 */
	GeoViewer.Catalog.layers.deegreeinspireAD,
	GeoViewer.Catalog.layers.deegreeinspireCP
	//	GeoViewer.Catalog.layers.percelen28992,
	//	GeoViewer.Catalog.layers.percelen4258,
	//	GeoViewer.Catalog.layers.parcelTestLayer

];

/* Map Contexts. */
GeoViewer.contexts = [
	{
		id: 'addresses',
		name: 'Show INSPIRE Addresses (NH)',
		desc: 'Pan and zoom to show Addresses',
		layers: ['OpenStreetMap', 'INSPIRE Addresses deegree'],
		x: 5.241925,
		y: 52.69925,
		zoom: 9
	},
	{
		id: 'cadastralparcels',
		name: 'Show Cadastral Parcels (NH)',
		desc: 'Pan and zoom to Cadastral Parcels',
		layers: ['OpenStreetMap', 'INSPIRE CadastralParcels deegree'],
		x: 5.246137,
		y: 52.689494,
		zoom: 13
	}
];

/**
 * Invokes GeoViewer as full screen app.
 */
Ext.onReady(function() {
	GeoViewer.main.create();
	GeoViewer.main.showFullScreen();
	Pages.showPage('home');
}, GeoViewer.main);

