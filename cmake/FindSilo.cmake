# - Find LLNL's Silo library
#
# find_package(Silo [QUIET] [REQUIRED])
#
# This module finds the Silo library and provides basic information about it.
# It creates the following CMAKE variables:
#
#  SILO_FOUND             - Whether the Silo installation was found
#  SILO_LIBRARY           - Path to the Silo library (not HDF5)
#  SILO_INCLUDE_DIR       - Path to the Silo include directory (not HDF5)
#  SILO_USES_HDF5         - Whether the found library uses HDF5
#
#  SILO_INCLUDE_DIRS      - Path to the Silo include directory and HDF5 dir
#  SILO_LIBRARIES         - Silo library and HDF5 libraries if necesary
#
#################################################################################

find_path(SILO_INCLUDE_DIR silo.h)

find_library(SILO_LIBRARY
  NAMES siloh5 silo siloxx)

set(SILO_USES_HDF5 NO)
if(SILO_LIBRARY MATCHES "siloh5")
  # This is the HDF5 build of silo
  find_package(HDF5 REQUIRED)
  set(SILO_USES_HDF5 YES)
endif()


# handle the QUIETLY and REQUIRED arguments and set SILO_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(Silo DEFAULT_MSG
  SILO_LIBRARY SILO_INCLUDE_DIR)

if(SILO_FOUND)
  mark_as_advanced(SILO_INCLUDE_DIR SILO_LIBRARY HDF5_LIBRARY)
  set(SILO_INCLUDE_DIRS ${SILO_INCLUDE_DIR} ${HDF5_INCLUDE_DIRS})
  set(SILO_LIBRARIES    ${SILO_LIBRARY} ${HDF5_LIBRARIES})
endif()
