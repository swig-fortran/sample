##---------------------------------------------------------------------------##
## File  : algorithm/CMakeLists.txt
## Author: Seth R Johnson
## Date  : Tue Dec 06 11:46:55 2016
## Copyright (c) 2016 Oak Ridge National Laboratory, UT-Battelle, LLC.
##---------------------------------------------------------------------------##

CMAKE_MINIMUM_REQUIRED(VERSION 3.0)
PROJECT(swig-fortran-sample C CXX Fortran)

# Require C++11
SET(CMAKE_CXX_STANDARD 11)
SET(CMAKE_CXX_STANDARD_REQUIRED ON)

ENABLE_TESTING()

LIST(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

FIND_PACKAGE(Silo)

# SWIG setup
FIND_PACKAGE(SWIG REQUIRED)
INCLUDE(SwigModules)

# Enable C-like preprocessing
SET(CMAKE_Fortran_FLAGS "-cpp ${CMAKE_Fortran_FLAGS}")

ADD_SUBDIRECTORY(src)

##---------------------------------------------------------------------------##
## end of algorithm/CMakeLists.txt
##---------------------------------------------------------------------------##
