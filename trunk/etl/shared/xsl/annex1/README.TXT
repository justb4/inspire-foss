Just van den Broecke

This directory contains XSLT scripts with so called "callable templates".
These callable templates are reusable functions that generate INSPIRE Annex I feature type GML.

See for example etl/NL.RWS/TransportNetworks  and etl/NL.Kadaster/TransportNetworks

So reuse is at several levels:

- among NMCAs/data providers
- among Themes, e.g. GeographicalNames.xsl is used by almost any other theme
- common XSL like callable templates to generate an INSPIRE ID or MD element

