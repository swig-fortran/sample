##---------------------------------------------------------------------------##
## File  : src/CMakeLists.txt
## Author: Seth R Johnson
## Date  : Tue Dec 06 11:46:55 2016
## Copyright (c) 2017 Oak Ridge National Laboratory, UT-Battelle, LLC.
##---------------------------------------------------------------------------##

# Include source/binary so that downstream modules can use the .mod files
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR})
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR})

# Generate SWIG module
MAKE_SWIG(MODULE algorithm
  SOURCE algorithm.i
  EXTRASRC algorithm.cc)

MAKE_SWIG(MODULE formatrix
  SOURCE formatrix.i
  EXTRASRC matrix.cc)

ADD_LIBRARY(futils
  brainerd.f90
  timerlib.f90)

SET(BUILT_LIBS futils ${SWIG_MODULE_algorithm_REAL_NAME}
   ${SWIG_MODULE_formatrix_REAL_NAME})

ADD_SUBDIRECTORY(test)
ADD_SUBDIRECTORY(perf)

##---------------------------------------------------------------------------##
## end of src/CMakeLists.txt
##---------------------------------------------------------------------------##
