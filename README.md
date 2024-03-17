This describes the installation of the basic packages (zlib, szip, hdf5, netcdf and udunits) on new Mac system uses ARM64 (M1/M2) with __intel compiler__. OneAPI intel compiler (version 2021.4.0) are used here. Importantly, installation of netcdf-fortran using intel fortran is extremely critical task. Even it installed successfully, it creates library issues while compiling/linking fortran code that handles netcdf data using these netcdf fortran library. After careful investigation with various versions of netcdf packages and other dependencies, it is found that __netcdf-fortran-4.4.0.tar.gz__ installs successfully and links fortran code accurately. Follow the procedure:\
## INSTALLATION ##
It is assumed that the system has icc, ifort and icpc installed. bash shell used here\
export CC=icc FC=ifort F77=ifort F90=ifort CXX=icpc\
export INSTALLDIR=your installation directory
## 1. zlib-1.2.11
   tar -zxvf zlib-1.2.11.tar\
   cd zlib-1.2.11\
   ./configure --prefix=${INSTALLDIR}\
   make\
   make install
## 2. szip-2.1.1
   tar -zxvf szip-2.1.1.tar\
   cd szip-2.1.1\
   ./configure --prefix=${INSTALLDIR}\
   make\
   make install
## 3. hdf5-1.10.7
   tar -zxvf hdf5-1.10.7.tar\
   cd hdf5-1.10.7\
   ./configure --prefix=${INSTALLDIR} --with-zlib=${INSTALLDIR} --with-szlib=${INSTALLDIR}\
   make\
   make install
## 4. netcdf-c-4.5.0. Follow config_c-intel.bash (contained here in the repo)
   export CPPFLAGS=-I${INSTALLDIR}/include\
   export LDFLAGS=-L${INSTALLDIR}/lib\
   export FDFLAGS=-L${INSTALLDIR}/lib
   tar -zxvf netcdf-c-4.5.0.tar\
   cd netcdf-c-4.5.0\
   ./configure --prefix=${INSTALLDIR}\
   make\
   make install
## 5. udunits-2.1.2
Firstly, close all terminal and then put\
export PATH=${INSTALLDIR}/bin:$PATH\
export CC=icc FC=ifort F77=ifort F90=ifort CXX=icpc\
in the ~/.bashrc file.\
Generally Mac consider .bash_profile by default and so you might not have .bashrc. If it doesn't exist create it. Dont forget to put source ~/.bashrc in .bash_profile. Then .bashrc will run. Now open a terminal and do the next step.\
   tar -zxvf udunits-2.1.2.tar\
   cd udunits-2.1.2\
   ./configure --prefix=${INSTALLDIR}\
   make\
   make install
## 6. netcdf-fortran-4.4.0. Follow config_f-intel.bash (contained here in the repo)
   export CPPFLAGS=-I${INSTALLDIR}/include\
   export LDFLAGS=-L${INSTALLDIR}/lib\
   tar -zxvf netcdf-fortran-4.4.0.tar\
   cd netcdf-fortran-4.4.0\
   ./configure --prefix={INSTALLDIR}\
   make\
   make install
## This completes the installtion. You now can check ncdump, nc-config --all, nf-config --all etc. to check the installtion. ##
A simple c/fortran reading/writing code (https://www.unidata.ucar.edu/software/netcdf/examples/programs/) also be a a good check. While compile these code, netcdf library should be linked as below:\
ifort simple_xy_wr.f90 -I${INSTALLDIR}/include -L${INSTALLDIR}/lib -lnetdff -lnetcdf\
icc simple_xy_wr.c -I${INSTALLDIR}/include -L${INSTALLDIR}/lib -lnetcdf
