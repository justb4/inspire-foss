# Introduction #

This page describes how to setup a working environment to explore and possibly extend the inspire-foss software components with a minimum of effort. This is done by installing and running an application on your computer that provides a completely installed and working system. You don't have to install any of the tools listed in [SetupFOSSTools](SetupFOSSTools.md).

Sounds magic ? The "trick" is "virtualization". Using the program [VirtualBox](http://www.virtualbox.org) we will run a complete Linux Ubuntu system that has all inspire-foss software installed. You run this within whatever system you are on, Windows XYZ, Mac OSX, even Linux itself. Such a system is often called a [Virtual Appliance](http://en.wikipedia.org/wiki/Virtual_appliance), or just Appliance as this is a booming technology also related to running systems within The Cloud.

Note: [VirtualBox](http://www.virtualbox.org) is Open Source itself. You may be a bit surprised that the developer is Oracle. But [VirtualBox](http://www.virtualbox.org)  was developed by Sun and the rest is history...

This document contains the steps to install the `InspireFossBox` as we have called our appliance.

# Up and Running in minutes #
There are just some simple steps to get up and running. Here we go..

## 1. Get the `InspireFossBox` VM ##
At the moment the `InspireFossBox` is under development and not yet available for public download. Ask the developer [Just van den Broecke](mailto:justb4@gmail.com)  for a download link and he will give you one. If you are in the InspireFossWorkshop you will get a copy there.

## 2. Install `VirtualBox` ##

This is a standard install like any other  application on your system.
[VirtualBox](http://www.virtualbox.org) is the player application that will later on run the `InspireFossBox`.

  * [Download VirtualBox](http://www.virtualbox.org/wiki/Downloads) 4.0.4 or higher (or get a copy when in the [InspireFossWorkshop](InspireFossWorkshop.md)).
  * Standard installation by double-clicking the executable.
  * Default installation should be ok

## 3. Install VM `VirtualBox Extension Pack` ##

These are some handy add-ons.

  * [Download Oracle VM VirtualBox Extension Pack](http://www.virtualbox.org/wiki/Downloads) 4.0.4 or higher
  * The file is called e.g. `Oracle_VM_VirtualBox_Extension_Pack-4.0.4-70112.vbox-extpack` is platform-independent
  * Standard installation by double-clicking the file.
  * The file is run by VB itself

## 4. Run the `InspireFossBox` Virtual Appliance ##

Here the file you downloaded or got in Step 1 wil be imported and run in [VirtualBox](http://www.virtualbox.org).

  * start the `VirtualBox` program installed in Step 2
  * go in menu to `File | Import Appliance...`
  * follow the steps in the import wizard with default choices
  * in `VirtualBox` run your machine
  * watch the Ubuntu system boot (may take a while)
  * all is ready and well if you see the Firefox browser showing the welcome page
  * you can suspend/resume this running VM as a "snapshot" such that next time you'll be up and running in seconds
  * all usernames and passwords within the `InspireFossBox` are named "inspire" and "inspire" respectively


Below is [VirtualBox](http://www.virtualbox.org) with the `InspireFossBox` virtual appliance running on Mac OSX.

![http://inspire-foss.googlecode.com/svn/trunk/doc/NL.Kadaster/sphinx/_static/virtualbox-screen-macosx-s.png](http://inspire-foss.googlecode.com/svn/trunk/doc/NL.Kadaster/sphinx/_static/virtualbox-screen-macosx-s.png)

## 5. What's Next ? ##
Now you are ready to start exploring and possibly extending inspire-foss components for ETL and web services. Go to [InspireFossWorkshop](InspireFossWorkshop.md) to proceed.