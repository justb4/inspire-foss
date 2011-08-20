This directory contains the deegree-tools

The deegree-tools distribution needs to be downloaded and
installed here. This is done in 2 steps:

1) download
./get-deegree-tools.sh

2) install
./install-deegree-tools.sh

This should work on Linux and MacOSX. For Windows, or in cases setp 1) doesn't work
(you need to have "wget" installed) this may can be done by hand:

In browser got to http://artefacts.deegree.org

navigate to deegree-tools-base packae, now
http://artefacts.deegree.org/libs-releases-local/org/deegree/deegree-tools-base/${VERSION}

download deegree-tools-base-{VERSION}.zip (about 30MB)

unpack deegree-tools-{VERSION}.zip in this directory and move the unpacked
deegree-tools-{VERSION}/bin and deegree-tools-{VERSION}/repo dirs to

TODO
The script ../bin/fsloader.sh needs to get a .bat equivalent
