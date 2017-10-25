##---------------------------------------------------------------------------##
## File  : common/CMakeLists.txt
## Author: Seth R Johnson
## Date  : Tue Dec 06 11:46:55 2016
## Brief : TriBITS package file for common/
## Copyright (c) 2016 Oak Ridge National Laboratory, UT-Battelle, LLC.
##---------------------------------------------------------------------------##

# Create executable
FOREACH(PERFNAME sort search formatrix)
  ADD_EXECUTABLE(perf_${PERFNAME}.exe perf_${perfNAME}.f90)
  TARGET_LINK_LIBRARIES(perf_${PERFNAME}.exe ${BUILT_LIBS})
ENDFOREACH()

##---------------------------------------------------------------------------##
## end of common/CMakeLists.txt
##---------------------------------------------------------------------------##
