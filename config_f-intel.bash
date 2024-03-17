#!/bin/bash
export CC=icc
export CXX=icpc
export FC=ifort
export F77=ifort
export F90=ifort

export CPPFLAGS="-I/Users/suman/allinstall_intel/include"
export LDFLAGS="-L/Users/suman/allinstall_intel/lib"
#export CFLAGS="-Wno-implicit-function-declaration"
#export FFLAGS="-fallow-argument-mismatch"
#export FCFLAGS="-fallow-argument-mismatch"


./configure --prefix=/Users/suman/allinstall_intel

