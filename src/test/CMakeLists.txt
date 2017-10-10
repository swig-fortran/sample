##---------------------------------------------------------------------------##
## File  : common/CMakeLists.txt
## Author: Seth R Johnson
## Date  : Tue Dec 06 11:46:55 2016
## Brief : TriBITS package file for common/
## Copyright (c) 2016 Oak Ridge National Laboratory, UT-Battelle, LLC.
##---------------------------------------------------------------------------##

MESSAGE(STATUS "Built libs: ${BUILT_LIBS}")

# Create test executable
FOREACH(TESTNAME timer shuffle)
  ADD_EXECUTABLE(test_${TESTNAME}.exe test_${TESTNAME}.f90)
  TARGET_LINK_LIBRARIES(test_${TESTNAME}.exe ${BUILT_LIBS})
  ADD_TEST(NAME test_${TESTNAME} COMMAND test_${TESTNAME}.exe)
ENDFOREACH()

##---------------------------------------------------------------------------##
## end of common/CMakeLists.txt
##---------------------------------------------------------------------------##
