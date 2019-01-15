#!/bin/bash
# This script will install python scripts needed for running PF postproc scripts


if [ "$HOME" != "/home/docker" ]
then
	echo This script must be run as docker user in a docker container!
	exit 1
fi

if [ ! -d "$HOME/tests/" ];
then
mkdir $HOME/tests/
fi

### Vshape test case ( Hector, B., Cohard, J.-M., Séguis, L., Galle, S., and Peugeot, C.: Hydrological functioning of western African inland valleys explored with a critical zone model, Hydrol. Earth Syst. Sci., 22, 5867-5888, https://doi.org/10.5194/hess-22-5867-2018, 2018.) :
if [ ! -d "$HOME/tests/vshape/" ];
then
mkdir $HOME/tests/vshape
fi
scp hectorb@srv12.ige-grenoble.fr:/homelocal5/phyrev/_PARFLOW/projects/Vshape/archive/paper_inland_valley/* $HOME/tests/vshape
if [ ! -d "$HOME/tests/vshape/ncoutputs" ];
then
mkdir $HOME/tests/vshape/ncoutputs
fi

### Hillslope for use with flowvr:
if [ ! -d "$HOME/tests/Hillslope/" ];
then
mkdir $HOME/tests/Hillslope
fi
scp hectorb@srv12.ige-grenoble.fr:/homelocal5/phyrev/_PARFLOW/projects/Hillslope/steering-Python/* $HOME/tests/Hillslope
if [ ! -d "$HOME/tests/Hillslope/ncoutputs" ];
then
mkdir $HOME/tests/Hillslope/ncoutputs
fi

