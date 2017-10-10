##---------------------------------------------------------------------------##
## File  : algorithm/CMakeLists.txt
## Author: Seth R Johnson
## Date  : Tue Dec 06 11:46:55 2016
## Copyright (c) 2016 Oak Ridge National Laboratory, UT-Battelle, LLC.
##---------------------------------------------------------------------------##

CMAKE_MINIMUM_REQUIRED(VERSION 3.0)
PROJECT(swig-fortran-sample CXX Fortran)

# Require C++11
SET(CMAKE_CXX_STANDARD 11)
SET(CMAKE_CXX_STANDARD_REQUIRED ON)

ENABLE_TESTING()

# SWIG setup
FIND_PACKAGE(SWIG REQUIRED)
LIST(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")
INCLUDE(SwigModules)

# Enable C-like preprocessing
SET(CMAKE_Fortran_FLAGS "-cpp ${CMAKE_Fortran_FLAGS}")

ADD_SUBDIRECTORY(src)
ADD_SUBDIRECTORY(perf)

##---------------------------------------------------------------------------##
## end of algorithm/CMakeLists.txt
##---------------------------------------------------------------------------##
