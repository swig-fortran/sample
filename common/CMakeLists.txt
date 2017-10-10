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

# Generate fortran library
ADD_LIBRARY(commonlib
  timerlib.f90
  )

# Create test executable
ADD_EXECUTABLE(timer_test.exe timer_test.f90)

# It depends on the compiled fortran module
TARGET_LINK_LIBRARIES(timer_test.exe commonlib)

# Create test
ADD_TEST(NAME timer_test COMMAND timer_test.exe)

##---------------------------------------------------------------------------##
## end of common/CMakeLists.txt
##---------------------------------------------------------------------------##
