##---------------------------------------------------------------------------##
## File  : common/CMakeLists.txt
## Author: Seth R Johnson
## Date  : Tue Dec 06 11:46:55 2016
## Brief : TriBITS package file for common/
## Copyright (c) 2016 Oak Ridge National Laboratory, UT-Battelle, LLC.
##---------------------------------------------------------------------------##

# Create test with dependencies
macro(swig_fortran_add_test name)
  add_executable(${name}.exe ${name}.f90)
  message(STATUS "Linking ${name} against ${ARGN}")
  target_link_libraries(${name}.exe ${ARGN})
  ADD_TEST(NAME ${name} COMMAND ${name}.exe)
endmacro()

swig_fortran_add_test(test_shuffle
  rng)
swig_fortran_add_test(test_timer
  utils futils)

##---------------------------------------------------------------------------##
## end of common/CMakeLists.txt
##---------------------------------------------------------------------------##
