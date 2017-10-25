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
    implicit none
    integer :: i

    call init_rng(1234)
    do i = 1, 20
        call perf_shuffle()
    enddo
contains

!-----------------------------------------------------------------------------!
subroutine perf_shuffle()
    use ISO_FORTRAN_ENV
    use, intrinsic :: ISO_C_BINDING
    use algorithm, only : init_rng, shuffle
    implicit none
    integer :: i
    integer(C_INT), dimension(6) :: test_data = (/ -1, 1, 3, 3, 5, 7 /)

    do i = 1,200
        call shuffle(test_data)
    enddo
end subroutine
!-----------------------------------------------------------------------------!

end program

!-----------------------------------------------------------------------------!
! end of perf/perf_search.f90
!-----------------------------------------------------------------------------!
