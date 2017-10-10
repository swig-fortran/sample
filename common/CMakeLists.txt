##---------------------------------------------------------------------------##
## File  : common/CMakeLists.txt
## Author: Seth R Johnson
## Date  : Tue Dec 06 11:46:55 2016
## Brief : TriBITS package file for common/
## Copyright (c) 2016 Oak Ridge National Laboratory, UT-Battelle, LLC.
##---------------------------------------------------------------------------##

# Include source/binary so that downstream modules can use the .mod files
INCLUDE_DIRECTORIES(${CMAKE_PROJECT_SOURCE_DIR})
INCLUDE_DIRECTORIES(${CMAKE_PROJECT_BINARY_DIR})

# Generate SWIG module
MAKE_SWIG(MODULE commonlib
  SOURCE commonlib.i
  EXTRASRC timerlib.f90
           shuffle.cc)
SET(LIBNAME ${SWIG_MODULE_commonlib_REAL_NAME})

# Create test executable
FOREACH(TESTNAME timer shuffle)
  ADD_EXECUTABLE(${TESTNAME}_test.exe ${TESTNAME}_test.f90)
  TARGET_LINK_LIBRARIES(${TESTNAME}_test.exe ${LIBNAME})
  ADD_TEST(NAME ${TESTNAME}_test COMMAND ${TESTNAME}_test.exe)
ENDFOREACH()

##---------------------------------------------------------------------------##
## end of common/CMakeLists.txt
##---------------------------------------------------------------------------##
