!-----------------------------------------------------------------------------!
! \file   common/shuffle_test.f90
! \author Seth R Johnson
! \date   Tue Oct 10 11:58:17 2017
! \brief  shuffle_test module
! \note   Copyright (c) 2017 Oak Ridge National Laboratory, UT-Battelle, LLC.
!-----------------------------------------------------------------------------!

program main

    use ISO_FORTRAN_ENV
    implicit none

    call test_shuffle()
contains

!-----------------------------------------------------------------------------!
subroutine test_shuffle()
    use ISO_FORTRAN_ENV
    use, intrinsic :: ISO_C_BINDING
    use commonlib, only : init_rng, shuffle
    implicit none
    integer :: i
    integer(C_INT), dimension(6) :: test_data = (/ -1, 1, 3, 3, 5, 7 /)
    character(len=*), parameter :: list_fmt = "(*(i4,"",""))"

    call init_rng(123)

    do i = 1,3
        call shuffle(test_data)
        write (0,list_fmt) test_data
    enddo
end subroutine
!-----------------------------------------------------------------------------!

end program

!-----------------------------------------------------------------------------!
! end of common/shuffle_test.f90
!-----------------------------------------------------------------------------!
