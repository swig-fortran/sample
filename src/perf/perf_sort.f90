!-----------------------------------------------------------------------------!
! \file   perf/perf_sort.f90
! \author Seth R Johnson
! \date   Tue Oct 17 15:38:17 2017
! \brief  perf_sort module
! \note   Copyright (c) 2017 Oak Ridge National Laboratory, UT-Battelle, LLC.
!-----------------------------------------------------------------------------!

program main
    use ISO_FORTRAN_ENV
    use, intrinsic :: ISO_C_BINDING
    use timerlib, only : Timer
    use algorithm, only : sort

    implicit none
    integer :: i
    integer, parameter :: num_loops = 40
    integer, parameter :: n = 10000000
    integer(c_int), dimension(:), allocatable :: x
    type(Timer) :: t

    call t%create()

    ! Allocate array
    allocate(x(n))

    ! Fortran version of quick sort
    do i = 1, num_loops
        call fill(x)                ! reset array

        call t%start()
        call quick_sort(x, n)
        call t%stop()
    enddo
    write(0, '(A, F10.3)') "Fortran :", t%walltime() / num_loops

    call t%reset()

    ! Wrapped C++ version of quick sort
    do i = 1, num_loops
        call fill(x)                ! reset array

        call t%start()
        call sort(x)
        call t%stop()
    enddo
    write(0, '(A, F10.3)') "C++     :", t%walltime() / num_loops

    deallocate(x)

contains

!-----------------------------------------------------------------------------!
subroutine fill(x)
    use ISO_FORTRAN_ENV
    use, intrinsic :: ISO_C_BINDING
    use rng, only : init_rng, shuffle

    integer(c_int), dimension(:) :: x

    call init_rng(123)

    do i = 1, size(x)
      x(i) = i
    end do

    call shuffle(x)

end subroutine
!-----------------------------------------------------------------------------!

end program


!-----------------------------------------------------------------------------!
! end of perf/perf_sort.f90
!-----------------------------------------------------------------------------!
