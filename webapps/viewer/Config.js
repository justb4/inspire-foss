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

/** SET OPTIONS FOR GEOVIEWER. **/
Ext.namespace("GeoViewer");
Ext.namespace("GeoViewer.Map");
Ext.namespace("GeoViewer.Catalog");

GeoViewer.lang = GeoViewer.Catalog.lang.en;
GeoViewer.Map.options = GeoViewer.Catalog.options4258;

GeoViewer.treeConfig = [
	{
		// Include all BaseLayers present in map
		text:'BaseLayers', nodeType: "gx_baselayercontainer"
	},


	{
		nodeType: "gx_themenode",  theme: 'AU', children:
			[
				{nodeType: "gx_featuretypecontainer", featureType: 'AdministrativeUnit'}
			]
	},
	{
		nodeType: "gx_themenode",  theme: 'CP', children:
			[
				{nodeType: "gx_featuretypecontainer", featureType: 'CadastralParcel'}
			]
	},
/*	{
		nodeType: "gx_themenode",  theme: 'GN', children:
			[
				{nodeType: "gx_featuretypecontainer", featureType: 'NamedPlaceAll'},
				{nodeType: "gx_featuretypecontainer", featureType: 'NamedPlaceFG'},
				{nodeType: "gx_featuretypecontainer", featureType: 'NamedPlaceGG'},
				{nodeType: "gx_featuretypecontainer", featureType: 'NamedPlaceIE'},
				{nodeType: "gx_featuretypecontainer", featureType: 'NamedPlaceWD'}
			]
	},
	{
		nodeType: "gx_themenode",  theme: 'HY', children:
			[
				{nodeType: "gx_featuretypecontainer", featureType: 'StandingWater'},
				{nodeType: "gx_featuretypecontainer", featureType: 'Watercourse'},
				{nodeType: "gx_featuretypecontainer", featureType: 'All'}
			]
	},  */
	{
		nodeType: "gx_themenode",  theme: 'TN', children:
			[
/*				{nodeType: "gx_featuretypecontainer", featureType: 'RailwayTransport'},
				{nodeType: "gx_featuretypecontainer", featureType: 'RoadTransportPolygons'}, */
				{nodeType: "gx_featuretypecontainer", featureType: 'RoadTransport_RoadLink'}
                /* ,
				{nodeType: "gx_featuretypecontainer", featureType: 'RoadTransport'}   */
			]
	}
];

// See ToolbarBuilder.js : each string item points to a definition
// in GeoViewer.ToolbarBuilder.defs. Extra options and even an item create function
// can be passed here as well.
GeoViewer.Map.toolbar = [
	{type: "featureinfo"},
	{type: "-"} ,
	{type: "pan"},
	{type: "zoomin"},
	{type: "zoomout"},
	{type: "zoomvisible"},
	{type: "-"} ,
	{type: "zoomprevious"},
	{type: "zoomnext"},
	{type: "-"},
	{type: "measurelength"},
	{type: "measurearea"}
];

GeoViewer.layout = {
	center : {
		options : {
			layout: 'border',
			width: '100%',
			collapsible: true,
			split	: true,
			border: false
		},
		panels: [
			{
				type: 'gv-map',
				options: {
					region: 'center',
					collapsible : false,
					border: false
				}
			},
			{
				type: 'gv-feature-info',
				options: {
					region : "south",
					border : true,
					collapsible : true,
					collapsed : true,
					height : 205,
					split : true,
					maxFeatures	: 10
				}
			}
		]
	},
/*	north : {

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
					url: '/content/north-logo.html',
					height: 55
				}
			}
		]
	},   */


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
				type: 'gv-layer-browser',
				options: {
					// Pass in our tree, if none specified the default config is used
					tree: GeoViewer.treeConfig
				}
			},
			{
				type: 'gv-layer-legend'
			}
		]
	}};

/** Collect layers from catalog. */
GeoViewer.Map.layers = [

	/*
	 * ==================================
	 *            BaseLayers
	 * ==================================
	 */
	// GeoViewer.Catalog.layers.osm,
	GeoViewer.Catalog.layers.osm4258,
    // GeoViewer.Catalog.layers.wheregroupOSM,
	GeoViewer.Catalog.layers.topRaster,
	GeoViewer.Catalog.layers.blanco,

	/*
	 * ==================================
	 *            OVERLAYS
	 * ==================================
	 */

    GeoViewer.Catalog.layers.inspireAU,

 /*   GeoViewer.Catalog.layers.inspireHYWaterdeelLijn,
	GeoViewer.Catalog.layers.inspireHYWaterdeelVlak, */

	GeoViewer.Catalog.layers.inspireTNRoadLink,
/*	GeoViewer.Catalog.layers.inspireTNWegdeelVlak,
	GeoViewer.Catalog.layers.inspireTNSpoorbaandeelLijn,   */

	GeoViewer.Catalog.layers.inspireCP
/*	GeoViewer.Catalog.layers.inspireAD,
	GeoViewer.Catalog.layers.inspireGN,
	GeoViewer.Catalog.layers.inspireGNFunGeb,
	GeoViewer.Catalog.layers.inspireGNGeoGeb,
	GeoViewer.Catalog.layers.inspireGNInrElm,
	GeoViewer.Catalog.layers.inspireGNWegDeelPunt         */



	//	GeoViewer.Catalog.layers.percelen28992,
	//	GeoViewer.Catalog.layers.percelen4258,
	//	GeoViewer.Catalog.layers.parcelTestLayer

];


