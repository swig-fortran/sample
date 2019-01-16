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
    use qsort

    implicit none
    integer :: i, k, n
    integer :: num_loops = 40
    integer :: n0 = 10000
    integer :: num_steps = 1
    real(c_double), dimension(:), allocatable :: x
    character(len=256) :: arg
    type(Timer) :: t

    ! Read in command line arguments
    k = 1
    do while (k <= command_argument_count())
        call get_command_argument(k, arg)
        k = k+1

        select case (arg)
            case ('-l', '--loop')
                call get_command_argument(k, arg)
                k = k+1
                read(arg,*) num_loops
            case ('-n')
                call get_command_argument(k, arg)
                k = k+1
                read(arg,*) n0
            case ('-s', '--steps')
                call get_command_argument(k, arg)
                k = k+1
                read(arg,*) num_steps
        end select
    end do
    write(0,*) "num_loops: ", num_loops
    write(0,*) "n0       : ", n0
    write(0,*) "num_steps: ", num_steps

    call t%create()

    n = n0
    do k = 1, num_steps
        ! Allocate array
        allocate(x(n))

        ! Fortran version of quick sort
        do i = 1, num_loops
            call fill(x)    ! reset array

            call t%start()
            call quick_sort(x, n)
            call t%stop()
        enddo
        write(0,'(A,I8,A,F10.5,A,F10.5,A)') "Fortran : n = ", n, ", avg = ", t%walltime() / num_loops, ", total = ", t%walltime()

        call t%reset()

        ! Wrapped C++ version of quick sort
        do i = 1, num_loops
            call fill(x)    ! reset array

            call t%start()
            call sort(x)
            call t%stop()
        enddo
        write(0,'(A,I8,A,F10.5,A,F10.5,A)') "C++     : n = ", n, ", avg = ", t%walltime() / num_loops, ", total = ", t%walltime()

        deallocate(x)

        n = n*10
    end do


contains

!-----------------------------------------------------------------------------!
subroutine fill(xx)
    use ISO_FORTRAN_ENV
    use, intrinsic :: ISO_C_BINDING
    use rng, only : init_rng, shuffle

    real(c_double), dimension(:) :: xx
    integer :: j

    call init_rng(123)

    do j = 1, size(xx)
      xx(j) = j
    end do

    call shuffle(xx)

end subroutine
!-----------------------------------------------------------------------------!

end program


!-----------------------------------------------------------------------------!
! end of perf/perf_sort.f90
!-----------------------------------------------------------------------------!
