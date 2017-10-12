##---------------------------------------------------------------------------##
## File  : matrix/CMakeLists.txt
## Author: Seth R Johnson
## Date  : Tue Dec 06 11:46:55 2016
## Brief : TriBITS package file for matrix/
## Copyright (c) 2016 Oak Ridge National Laboratory, UT-Battelle, LLC.
##---------------------------------------------------------------------------##

IF (FALSE)
    # Generate SWIG module
    MAKE_SWIG(MODULE formatrix
      SOURCE formatrix.i
      EXTRASRC matrix.cc ../src/timerlib.f90)
    SET(LIBNAME ${SWIG_MODULE_formatrix_REAL_NAME})
ELSE()
    ADD_LIBRARY(formatrix matrix.cc formatrixFORTRAN_wrap.cxx formatrix.f90 ../src/timerlib.f90)
    SET(LIBNAME formatrix)
ENDIF()

# Create test executable
FOREACH(TESTNAME perf)
  ADD_EXECUTABLE(${TESTNAME}_test.exe ${TESTNAME}_test.f90)
  TARGET_LINK_LIBRARIES(${TESTNAME}_test.exe ${LIBNAME})
  ADD_TEST(NAME ${TESTNAME}_test COMMAND ${TESTNAME}_test.exe)
ENDFOREACH()

##---------------------------------------------------------------------------##
## end of matrix/CMakeLists.txt
##---------------------------------------------------------------------------##
