# Introduction #

The main goal of this workshop is to gain hands-on experience with software components of the [inspire-foss project](http://inspire-foss.org). These components include: ETL (Extract, Transform, Load), web services for WFS and WMS, plus visualisation through a web client. You can experience how these components work together in order to support the entire data delivery chain from raw national data to harmonized INSPIRE data and network services.

In order to quickly get up and running, a so-called [Virtual Appliance](http://en.wikipedia.org/wiki/Virtual_appliance) has been developed that contains a complete [Ubuntu Linux](http://www.ubuntu.com) environment for running inspire-foss components. In addition this Appliance, named `InspireFossBox`, runs the [IntelliJ IDEA](http://www.jetbrains.com/idea/) Integrated Development Environment (IDE) using an Open Source license in order to visualize code and data and moreover execute the ETL and to run webservices for WFS and WMS. The only other tool you will need to run within `InspireFossBox` is the pre-installed [Firefox web browser](http://www.mozilla.com/en-US/firefox/new/).

# Getting Prepared #
In order to proceed you should have setup and run
the `InspireFossBox` virtual appliance. This is described in [InspireFossBoxSetup](InspireFossBoxSetup.md).

If all is well and the `InspireFossBox` appliance is started you should see the screen below.

![http://inspire-foss.googlecode.com/svn/trunk/doc/workshop/media/inspirefossbox-startscreen-800.png](http://inspire-foss.googlecode.com/svn/trunk/doc/workshop/media/inspirefossbox-startscreen-800.png)

# The Tools #
You will only need two tools to run all exercises in the workshop:

  1. [IntelliJ IDEA](http://www.jetbrains.com/idea/)
  1. the Firefox webbrowser

[IntelliJ IDEA](http://www.jetbrains.com/idea/) is an Integrated Development Environment (IDE) that has been setup for the inspire-foss project with lots of shortcut commands (via [Apache Ant](http://ant.apache.org)) to run ETL, start the [deegree server](http://deegree.org) etc. Note: since we use/develop Open Source, IntelliJ bears a free of charge license. Note that you are only allowed to develop Open Source with this license. Since IntelliJ is a fantastic product it is worthwhile to buy a license anyway.

You start the tools as indicated below.


Click on the [IntelliJ IDEA](http://www.jetbrains.com/idea/) icon to start (takes a while).


![http://inspire-foss.googlecode.com/svn/trunk/doc/workshop/media/inspirefossbox-toolbar.png](http://inspire-foss.googlecode.com/svn/trunk/doc/workshop/media/inspirefossbox-toolbar.png)

# The Works #
This is a `WorkShop` so this is where the real work starts.

## Exploring IntelliJ ##

Below is is the IntelliJ main screen with the main areas indicated.

![http://inspire-foss.googlecode.com/svn/trunk/doc/workshop/media/inspirefossbox-intellij-overview-800.png](http://inspire-foss.googlecode.com/svn/trunk/doc/workshop/media/inspirefossbox-intellij-overview-800.png)

TO BE FINALIZED - FOR NOW SEE THE SLIDES (Dutch)  BELOW

[THE PDF SLIDES (2.9 MB)](http://inspire-foss.googlecode.com/svn/trunk/doc/workshop/workshop-nl-11030-v1.pdf)

In order to setup your own ETL you can follow the
guidelines in HowToTransformation.