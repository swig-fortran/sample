!-----------------------------------------------------------------------------!
! \file   perf/perf_search.f90
! \author Seth R Johnson
! \date   Tue Oct 17 15:38:17 2017
! \brief  perf_search module
! \note   Copyright (c) 2017 Oak Ridge National Laboratory, UT-Battelle, LLC.
!-----------------------------------------------------------------------------!

program main
    use ISO_FORTRAN_ENV
    use algorithm, only : init_rng
    integer :: i
    implicit none

    call init_rng(1234)
    do i = 1, 20
    call test_shuffle()
contains

!-----------------------------------------------------------------------------!
subroutine test_shuffle()
    use ISO_FORTRAN_ENV
    use, intrinsic :: ISO_C_BINDING
    use algorithm, only : init_rng, shuffle, ierr, serr
    implicit none
    integer :: i
    integer(C_INT), dimension(6) :: test_data = (/ -1, 1, 3, 3, 5, 7 /)
    character(len=*), parameter :: list_fmt = "(*(i4,"",""))"

    do i = 1,3
        call shuffle(test_data)
        write (0,list_fmt) test_data
    enddo
end subroutine
!-----------------------------------------------------------------------------!

end program

!-----------------------------------------------------------------------------!
! end of perf/perf_search.f90
!-----------------------------------------------------------------------------!
