<%-- $HeadURL: svn+ssh://jmays@svn.wald.intevation.org/deegree/apps/services-template/trunk/web/client/client.jsp $ --%>
<%-- $Id: client.jsp 20659 2009-11-09 13:01:00Z jmays $ --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.deegree.framework.version.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FilenameFilter"%>
<%@ page import="java.util.Arrays"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <title>Generic OGC Web Service Client</title>
        <link rel="stylesheet" href="../css/deegree.css" />
        <script type="text/javascript">
        <!--
            // service types (WFS, WMS, CSW, ...)
            var serviceTypes = new Array ();
            // profiles (per service)
            var profiles;
            // request types (per profile)
            var requestTypes;
            // requests (per request type)
            var requests;
            // requestUrls (per request type)
            var requestUrls;

            var selectedServiceIdx = 0;

            function init () {
<%
                File requestsBaseDir = new File( getServletContext().getRealPath( "/client/requests" ) );
                String[] serviceTypes = requestsBaseDir.list();
                if ( serviceTypes != null && serviceTypes.length > 0) {
                    out.println ("              serviceTypes = new Array (" + serviceTypes.length + ");");
                    out.println ("              profiles = new Array (" + serviceTypes.length + ");");
                    out.println ("              requestTypes = new Array (" + serviceTypes.length + ");");
                    out.println ("              requests = new Array (" + serviceTypes.length + ");");
                    out.println ("              requestUrls = new Array (" + serviceTypes.length + ");");
                    Arrays.sort (serviceTypes);
                    for ( int i = 0; i < serviceTypes.length; i++ ) {
                        // for each service subdir (wfs, wms, etc.)
                        File serviceDir = new File( requestsBaseDir, serviceTypes[i] );
                        String[] profileDirs = serviceDir.list();
                        if (profileDirs != null && profileDirs.length > 0) {
                            out.println ("              serviceTypes[" + i + "] = \"" + serviceTypes [i] + "\";");
                            out.println ("              profiles[" + i + "] = new Array (" + profileDirs.length + ");");
                            out.println ("              requestTypes[" + i + "] = new Array (" + profileDirs.length + ");");
                            out.println ("              requests[" + i + "] = new Array (" + profileDirs.length + ");");
                            out.println ("              requestUrls[" + i + "] = new Array (" + profileDirs.length + ");");
                            Arrays.sort (profileDirs);
                            for ( int j = 0; j < profileDirs.length; j++ ) {
                                // for each profile subdir (demo, philosopher, etc.)
                                out.println ("              profiles[" + i + "][" + j + "] = \"" + profileDirs [j] + "\";");
                                File profileDir = new File( serviceDir, profileDirs [j] );
                                String[] requestTypeDirs = profileDir.list();
                                if (requestTypeDirs != null && requestTypeDirs.length > 0) {
                                    out.println ("              requestTypes[" + i + "][" + j + "] = new Array (" + requestTypeDirs.length + ");");
                                    out.println ("              requests[" + i + "][" + j + "] = new Array (" + requestTypeDirs.length + ");");
                                    out.println ("              requestUrls[" + i + "][" + j + "] = new Array (" + requestTypeDirs.length + ");");
                                    Arrays.sort (requestTypeDirs);
                                    for ( int k = 0; k < requestTypeDirs.length; k++ ) {
                                        // for each request type subdir (GetCapabilities, GetFeature, etc.)
                                        out.println ("              requestTypes[" + i + "][" + j + "][" + k + "] = \"" + requestTypeDirs [k] + "\";");
                                        File requestTypeDir = new File( profileDir, requestTypeDirs [k] + File.separator + "xml");
                                        String[] requests = requestTypeDir.list( new FilenameFilter() {
                                            public boolean accept( File dir, String name ) {
                                                if ( name.toLowerCase().endsWith( ".xml" ) ) {
                                                    return true;
                                                }
                                                return false;
                                            }
                                        } );
                                        if (requests != null && requests.length > 0) {
                                            out.println ("              requests[" + i + "][" + j + "][" + k + "] = new Array (" + requests.length + ");");
                                            out.println ("              requestUrls[" + i + "][" + j + "][" + k + "] = new Array (" + requests.length + ");");
                                            Arrays.sort (requests);
                                            for ( int l = 0; l < requests.length; l++ ) {
                                                String requestUrl = "requests/" + serviceTypes[i] + "/" + profileDirs[j] + "/" + requestTypeDirs[k] + "/xml/" + requests[l];
                                                // for each request example
                                                out.println ("              requests[" + i + "][" + j + "][" + k + "][" + l + "] = \"" + requests [l] + "\";");
                                                out.println ("              requestUrls[" + i + "][" + j + "][" + k + "][" + l + "] = \"" + requestUrl + "\";");
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
%>
                setService (0);
                // loadExampleRequest (document.editform.example.value);
            }

            function setService( serviceIdx ) {
                selectedServiceIdx = serviceIdx;
                var profileNode = document.getElementById( "profileSelectNode" );
                while( profileNode.childNodes.length > 0 ) {
                    profileNode.removeChild( profileNode.firstChild );
                }

                for ( i = 0; i < profiles [serviceIdx].length; i++ ) {
                    var optionElement = document.createElement ("option");
                    optionElement.appendChild( document.createTextNode( profiles[serviceIdx][i] ) );
                    profileNode.appendChild( optionElement );
                }
                setProfile (0);
            }

            function setProfile( profileIdx ) {
                var requestNode = document.getElementById( "requestSelectNode" );
                while( requestNode.childNodes.length > 0 ) {
                    requestNode.removeChild( requestNode.firstChild );
                }
                for ( i = 0; i < requestTypes [selectedServiceIdx][profileIdx].length; i++ ) {
                    var optgroupElement = document.createElement( "optgroup" );
                    optgroupElement.setAttribute ("label", requestTypes [selectedServiceIdx][profileIdx][i]);
                    for ( j = 0; j < requests [selectedServiceIdx][profileIdx][i].length; j++ ) {
                        var optionElement = document.createElement( "option" );
                        optionElement.appendChild( document.createTextNode( requests[selectedServiceIdx][profileIdx][i][j] ) );
                        optionElement.setAttribute( "value", requestUrls[selectedServiceIdx][profileIdx][i][j] );
                        optgroupElement.appendChild( optionElement );
                    }
                    requestNode.appendChild( optgroupElement );
                }
                loadExampleRequest( requestUrls[selectedServiceIdx][profileIdx][0][0] );
            }

            function loadExampleRequest( s ) {

                var xmlHttp = false;
                // Mozilla, Opera, Safari and Internet Explorer 7
                if (typeof(XMLHttpRequest) != 'undefined') {
                    xmlHttp = new XMLHttpRequest();
                }
                if (!xmlHttp) {
                    // Internet Explorer 6 and older
                    try {
                        xmlHttp  = new ActiveXObject("Msxml2.XMLHTTP");
                    } catch(e) {
                        try {
                            xmlHttp  = new ActiveXObject("Microsoft.XMLHTTP");
                        } catch(e) {
                            xmlHttp  = false;
                        }
                    }
                }
                if (xmlHttp) {
                    xmlHttp.open('GET', s, true);
                    xmlHttp.onreadystatechange = function () {
                        if (xmlHttp.readyState == 4) {
                            document.editform.xmlarea.value = xmlHttp.responseText;
                        }
                    };
                    xmlHttp.send(null);
                }
            }

            function postRequest () {

                xml = document.editform.xmlarea.value;
                xmlBegin = xml.indexOf ("<");
                xmlEnd = xml.lastIndexOf(">");

                if (xmlBegin == -1 || xmlEnd == -1) {
                    alert ("No XML request. Please enter or select a valid request.");
                } else {
                    xml = xml.substring (xmlBegin,xmlEnd + 1);
                    document.submitform.GCAction.value=document.editform.host.value;
                    document.submitform.GCXML.value=xml;
                    document.submitform.submit ();
                }
            }
        //-->
        </script>
    </head>
    <body leftmargin="10" rightmargin="10" topmargin="0" marginwidth="0" marginheight="0"
          link="#2D2A63" vlink="#2D2A63" alink="#E31952" onload="init()">
<%
		String hardCodedURL = null; //"http://localhost:8080/deegree-wfs/services"; //null; //"http://localhost:8080/deegree";
		String targetURL = hardCodedURL;
		if( hardCodedURL == null || "".equals( hardCodedURL ) ){
        	String requestURL = request.getRequestURL().toString();
            targetURL = requestURL.substring( 0, requestURL.lastIndexOf( '/' ) );
            targetURL = targetURL.substring( 0, targetURL.lastIndexOf( '/' ) + 1 );
            targetURL += "services";
        }
%>
        <blockquote>
            <h2>deegr<font color="#fe5215">ee</font> Generic OGC WebService Client</h2>
            <form name="editform" action="">Service URL:
                <input name="host" size="60" type="text" value="<%= targetURL %>" />&nbsp;&nbsp;
                <input value="SEND" onclick="postRequest()" type="button" />
                <br />
                <br />
                Choose example request:
<%
                if ( serviceTypes.length > 1 ) {
%>
                    &nbsp;&nbsp;Service:
                    <select name="service" size="1" onchange="setService(this.value);">
<%
                    for (int i = 0; i < serviceTypes.length; i++) {
                        String serviceType = serviceTypes [i];
                        out.println ("<option value=\"" + i + "\">" + serviceType.toUpperCase() + "</option>");
                    }
%>
                    </select>
<%
                }
%>
                &nbsp;&nbsp;Example:
                <select name="example" size="1" onchange="setProfile(this.selectedIndex);" id="profileSelectNode">
                    <option>------------------------</option>
                </select>
                &nbsp;&nbsp;Request:
                <select name="request" size="1" onchange="loadExampleRequest(this.value);" id="requestSelectNode">
                    <option>------------------------------------------------</option>
                </select>
                <br />
                <br />
                <textarea name="xmlarea" cols="120" rows="10"></textarea>
            </form>
            <form name="submitform" action="requestHandler.jsp" method="post" target="output" accept-charset="UTF-8">
                <input type="hidden" name="GCAction" value="" />
                <input type="hidden" name="GCXML" value="" />
            </form>
        </blockquote>
    </body>
</html>
