#!/bin/bash
# This script will install python scripts needed for running PF postproc scripts


if [ "$HOME" != "/home/docker" ]
then
	echo This script must be run as docker user in a docker container!
	exit 1
fi

cd $HOME

git clone git://git.renater.fr/pfpylibs.git 


sudo pip install matplotlib pandas netCDF4
