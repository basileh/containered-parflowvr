#!/bin/bash
# This script will install python scripts needed for running PF postproc scripts


if [ "$HOME" != "/home/docker" ]
then
	echo This script must be run as docker user in a docker container!
	exit 1
fi

cd $HOME


#### Download PFPYLIBS:
#######################
git clone git://git.renater.fr/pfpylibs.git 

# update the .bashrc
if grep -Fxq "export PYTHONPATH=$PYTHONPATH:$HOME/pfpylibs/" $HOME/.bashrc 
then
   echo PYTHONPATH variable already updated with pfpylibs path!
else
   echo 'export PYTHONPATH=$PYTHONPATH:$HOME/pfpylibs/' >> $HOME/.bashrc 
fi

source $HOME/.bashrc 

sudo apt-get install python-tk
sudo pip install scipy

### Download & compile PFB2NC:
#######################
# install netcdf cpp:
sudo apt-get install libnetcdf-cxx-legacy-dev

cd $HOME
# git clone PFB2NC
git clone git://git.renater.fr/pfb2nc.git 
cd pfb2NC

# compile
g++ -o PFBtoNC conversionBigEndiansToLittleEndians.cpp  PFBtoNCV5.cpp -lnetcdf_c++
g++ -o ClmPFBtoNC creatNC2D.cpp creatNCsoil.cpp conversionBigEndiansToLittleEndians.cpp  ClmPFBtoNC.cpp -lnetcdf_c++
chmod ug+x PFBtoNC
chmod ug+x ClmPFBtoNC

# update the .bashrc
if grep -Fxq "export PATH=$HOME/pfb2nc/:$PATH" $HOME/.bashrc 
then
   echo PATH variable already updated with pfb2nc path!
else
   echo 'export PATH=$HOME/pfb2nc/:$PATH' >> $HOME/.bashrc 
fi


