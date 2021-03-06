! This file was automatically generated by SWIG (http://www.swig.org).
! Version 4.0.0
!
! Do not make changes to this file unless you know what you are doing--modify
! the SWIG interface file instead.
module rng
 use, intrinsic :: ISO_C_BINDING
 implicit none
 private

 ! PUBLIC METHODS AND TYPES
 public :: init_rng

type, bind(C) :: SwigArrayWrapper
  type(C_PTR), public :: data = C_NULL_PTR
  integer(C_SIZE_T), public :: size = 0
end type

 public :: shuffle
 interface shuffle
  module procedure shuffle__SWIG_1, shuffle__SWIG_2
 end interface

 ! WRAPPER DECLARATIONS
 interface
subroutine swigc_init_rng(farg1) &
bind(C, name="_wrap_init_rng")
use, intrinsic :: ISO_C_BINDING
integer(C_INT), intent(in) :: farg1
end subroutine

subroutine swigc_shuffle__SWIG_1(farg1) &
bind(C, name="_wrap_shuffle__SWIG_1")
use, intrinsic :: ISO_C_BINDING
import :: swigarraywrapper
type(SwigArrayWrapper) :: farg1
end subroutine

subroutine swigc_shuffle__SWIG_2(farg1) &
bind(C, name="_wrap_shuffle__SWIG_2")
use, intrinsic :: ISO_C_BINDING
import :: swigarraywrapper
type(SwigArrayWrapper) :: farg1
end subroutine

 end interface


contains
 ! FORTRAN PROXY CODE
subroutine init_rng(seed)
use, intrinsic :: ISO_C_BINDING
integer(C_INT), intent(in) :: seed

integer(C_INT) :: farg1 

farg1 = seed
call swigc_init_rng(farg1)
end subroutine

subroutine shuffle__SWIG_1(data)
use, intrinsic :: ISO_C_BINDING
integer(C_INT), dimension(:), target :: data
integer(C_INT), pointer :: farg1_view

type(SwigArrayWrapper) :: farg1 

farg1_view => data(1)
farg1%data = c_loc(farg1_view)
farg1%size = size(data)
call swigc_shuffle__SWIG_1(farg1)
end subroutine

subroutine shuffle__SWIG_2(data)
use, intrinsic :: ISO_C_BINDING
real(C_DOUBLE), dimension(:), target :: data
real(C_DOUBLE), pointer :: farg1_view

type(SwigArrayWrapper) :: farg1 

farg1_view => data(1)
farg1%data = c_loc(farg1_view)
farg1%size = size(data)
call swigc_shuffle__SWIG_2(farg1)
end subroutine


end module
