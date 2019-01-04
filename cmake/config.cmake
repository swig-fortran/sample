##---------------------------------------------------------------------------##
## File  : swig-fortran-dev/config.cmake
## Author: Seth R Johnson
## Date  : Thu Dec 01 13:27:05 2016
## Copyright (c) 2016 Oak Ridge National Laboratory, UT-Battelle, LLC.
# cd /rnsdhpc/code/build/swig-fortran-sample
# cmake -C /rnsdhpc/code/src/cmake/config.cmake \
#   /rnsdhpc/code/src/swig-fortran-sample
##---------------------------------------------------------------------------##

SET(CMAKE_CXX_COMPILER "/opt/local/bin/g++" CACHE PATH "")
SET(CMAKE_C_COMPILER "/opt/local/bin/gcc" CACHE PATH "")
SET(CMAKE_Fortran_COMPILER "/opt/local/bin/gfortran" CACHE PATH "")

SET(SWIG_EXECUTABLE "/rnsdhpc/code/build/swig-debug/swig" CACHE PATH "")
SET(SWIG_DIR "/rnsdhpc/code/src/swig/Lib" CACHE PATH "")

SET(SILO_LIBRARY "/opt/clang/silo/lib/libsiloh5.dylib" CACHE PATH "")
SET(SILO_INCLUDE_DIR "/opt/clang/silo/include" CACHE PATH "")

SET(BUILD_SHARED_LIBS ON CACHE BOOL "")
SET(CMAKE_BUILD_TYPE Debug CACHE STRING "")

SET(CMAKE_Fortran_FLAGS "-Wall -Wextra -Wimplicit-procedure -Wimplicit-interface -Wno-compare-reals -std=f2003" CACHE STRING "")
SET(CMAKE_CXX_FLAGS "-Wall -Wextra" CACHE STRING "")

##---------------------------------------------------------------------------##
## end of swig-fortran-dev/config.cmake
##---------------------------------------------------------------------------##
