#!/bin/bash
export CC=icc
export CXX=icpc
export FC=ifort
export F77=ifort
export F90=ifort
export LDFLAGS="-L/Users/suman/allinstall_intel/lib"
export CPPFLAGS="-I/Users/suman/allinstall_intel/include" 
export FDFLAGS="-L/Users/suman/allinstall_intel/lib"
./configure --prefix=/Users/suman/allinstall_intel

