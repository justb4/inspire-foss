.. _deployment:


**********
Deployment
**********

This chapter describes how the resulting WFS is deployed on the `<http://kademo.nl>`_ server we will call "Kademo" in short.

About Kademo
============
Kademo is a server running `Ubuntu Linux <http://www.ubuntu.com/>`_. This server is available for projects within the
Dutch Kadaster GEORZ-lab & Research department. This server has been setup with a wide range of Open Source (Geo) tools and products.
In addition a development environment is available on Kademo, providing hosting
for `Subversion (SVN) <http://subversion.tigris.org/>`_, `Redmine (online project management) <http://www.redmine.org>`_
and `Sphinx Documentation <http://sphinx.pocoo.org/>`_ .

For hosting Java/J2EE products like GeoServer and Deegree, the J2EE server
`Apache Tomcat <http://tomcat.apache.org/>`_ is installed. In addition, the `Apache HTTP <http://httpd.apache.org/>`_ server
is used as the front-end HTTP server for all static content like the site `<http://kademo.nl>`_.
Apache HTTP communicates with Tomcat through
the AJP Proxy adapter. Apache virtual hosting has been setup in Apache HTTP and Tomcat
to allow flexibility for different projects. Any host named ``<myproject>.kademo.nl`` can be setup within seconds.
HTTPS is available through a wildcard SSL Root certificate for `*.kademo.nl`.

Deploying INSPIRE Services
==========================

For this project the virtual host ``inspire.kademo.nl`` has been defined and setup in both Apache HTTP and Tomcat.

The Deegree WFS is build as a .war file and deployed by dropping
this file in a designated Tomcat "webapps" directory. With the use of `Apache Ant <http://ant.apache.org/>`_ a
custom ``deegree-wfs.war`` is built from a Deegree distribution, overwriting
the standard configuration with our specific INSPIRE-theme feature configuration plus specific
client WFS requests for testing.

Below is our Ant ``build.xml`` file.

.. literalinclude:: ../webapps/deegree2-wfs/build.xml
    :language: xml
    :linenos:

The `build.properties` file is as follows.

.. literalinclude:: ../webapps/build.properties

External tools and products that are not available from standard Linux/Ubuntu packages (like Deegree) are installed
under the directory ``/opt``. Specific versions of Deegree (and other external tools) are selected as using
a property file `externals.properties`.

.. literalinclude:: ../webapps/externals.properties

This is a lightweight and flexible way for including and upgrading external tools. Note that
in the next phase, using deegree v3, we will use Maven.

