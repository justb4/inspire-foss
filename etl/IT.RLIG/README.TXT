This directory contains all ETL specific to Liguria Regional Authority.

contact: Stefano Parodi  - s.parodi@datasiel.net

Each directory with a Theme name contains the ETL (mainly XSL and FME) scripts for that theme, along with some GML examples.


3 ETL steps


Simple Features DB -1-> 
   FME Generated GML 3.1.1 -2->
     INSPIRE GML 3.2.1 -3->
        PostGIS or memory store

Step 1 is made through FME and includes coordinate transform from EPSG:3003 (italian national sistem) to EPSG:4258 

Step 2 is model transform via XSLT, a straightforward transormation from the GML (3.1.1) generated by FME (along with the relative schema) to an INSPIRE GML 3.2.1. It is mainly a renaming and a rearrangement of the xml elements.  

Step 3 is deegree FSLoader or WFS-T







