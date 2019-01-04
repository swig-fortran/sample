!-----------------------------------------------------------------------------!
! \file   perf/perf_sort.f90
! \author Seth R Johnson
! \date   Tue Oct 17 15:38:17 2017
! \brief  perf_sort module
! \note   Copyright (c) 2017 Oak Ridge National Laboratory, UT-Battelle, LLC.
!-----------------------------------------------------------------------------!

program main
    use ISO_FORTRAN_ENV
    use rng, only : init_rng
    implicit none
    integer :: i

    call init_rng(123)
    do i = 1, 20
        call perf_sort()
    enddo
contains

!-----------------------------------------------------------------------------!
subroutine perf_sort()
    use ISO_FORTRAN_ENV
    use, intrinsic :: ISO_C_BINDING
end subroutine
!-----------------------------------------------------------------------------!

end program


!-----------------------------------------------------------------------------!
! end of perf/perf_sort.f90
!-----------------------------------------------------------------------------!
