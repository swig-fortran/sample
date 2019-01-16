##---------------------------------------------------------------------------##
## File  : common/CMakeLists.txt
## Author: Seth R Johnson
## Date  : Tue Dec 06 11:46:55 2016
## Brief : TriBITS package file for common/
## Copyright (c) 2016 Oak Ridge National Laboratory, UT-Battelle, LLC.
##---------------------------------------------------------------------------##

# Create executable with dependencies
macro(swig_fortran_add_example name)
  add_executable(${name}.exe ${name}.f90)
  target_link_libraries(${name}.exe ${ARGN})
endmacro()

swig_fortran_add_example(perf_formatrix
  futils formatrix)
swig_fortran_add_example(perf_search
  rng)
swig_fortran_add_example(perf_sort
  utils algorithm futils rng)

##---------------------------------------------------------------------------##
## end of common/CMakeLists.txt
##---------------------------------------------------------------------------##
