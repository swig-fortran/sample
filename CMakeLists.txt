##---------------------------------------------------------------------------##
## File  : algorithm/CMakeLists.txt
## Author: Seth R Johnson
## Date  : Tue Dec 06 11:46:55 2016
## Copyright (c) 2016 Oak Ridge National Laboratory, UT-Battelle, LLC.
##---------------------------------------------------------------------------##

cmake_minimum_required(VERSION 3.8)
project(swig-fortran-sample CXX Fortran)
enable_testing()

##---------------------------------------------------------------------------##
# SWIG setup
##---------------------------------------------------------------------------##

find_package(SWIG REQUIRED)
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")
include(CheckSWIGFortran)
if (CMAKE_VERSION VERSION_LESS 3.20)
  # TODO: This is until Fortran support gets added to the upstream cmake script
  include(UseSWIGFortran)
else()
  cmake_policy(SET CMP0078 "NEW")
  cmake_policy(SET CMP0086 "NEW")
  include(UseSWIG)
endif()

##---------------------------------------------------------------------------##
# LIBRARY
##---------------------------------------------------------------------------##

macro(swig_fortran_add_library name)
  # We're using C++
  set_property(SOURCE src/${name}.i PROPERTY CPLUSPLUS ON)
  # We need to include the source directory
  set_property(SOURCE src/${name}.i
    PROPERTY USE_TARGET_INCLUDE_DIRECTORIES ON)

  # Create the library
  swig_add_library(${name}
    LANGUAGE Fortran
    TYPE USE_BUILD_SHARED_LIBS
    OUTPUT_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src/generated
    SOURCES src/${name}.i ${ARGN})

  # Enable C++11
  target_compile_features(${name} PRIVATE cxx_std_11)

  # Use correct include directories for C++
  target_include_directories(${name}
      PUBLIC
          $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
          $<INSTALL_INTERFACE:include>
      PRIVATE
          $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>
  )

  # Use correct Fortran module directories
  target_include_directories(${name}
      PUBLIC
          $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>
          $<INSTALL_INTERFACE:modules>
  )
endmacro()

# Four SWIG libraries
swig_fortran_add_library(utils)
swig_fortran_add_library(algorithm)
swig_fortran_add_library(formatrix src/matrix.cc)
swig_fortran_add_library(rng)

# One pure fortran library
add_library(futils
  src/brainerd.f90
  src/qsort.f90
  src/timerlib.f90)

##---------------------------------------------------------------------------##
# TESTING
##---------------------------------------------------------------------------##

add_subdirectory(test)

##---------------------------------------------------------------------------##
# EXECUTABLES
##---------------------------------------------------------------------------##

add_subdirectory(example)

##---------------------------------------------------------------------------##
## end of algorithm/CMakeLists.txt
##---------------------------------------------------------------------------##
