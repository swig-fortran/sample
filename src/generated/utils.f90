! This file was automatically generated by SWIG (http://www.swig.org).
! Version 4.0.0
!
! Do not make changes to this file unless you know what you are doing--modify
! the SWIG interface file instead.
module utils
 use, intrinsic :: ISO_C_BINDING
 implicit none
 private

 ! PUBLIC METHODS AND TYPES
 public :: msleep

 ! WRAPPER DECLARATIONS
 interface
subroutine swigc_msleep(farg1) &
bind(C, name="_wrap_msleep")
use, intrinsic :: ISO_C_BINDING
integer(C_INT), intent(in) :: farg1
end subroutine

 end interface


contains
 ! FORTRAN PROXY CODE
subroutine msleep(ms)
use, intrinsic :: ISO_C_BINDING
integer(C_INT), intent(in) :: ms

integer(C_INT) :: farg1 

farg1 = ms
call swigc_msleep(farg1)
end subroutine


end module
