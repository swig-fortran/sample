!-----------------------------------------------------------------------------!
! \file   common/timer_test.f90
! \author Seth R Johnson
! \date   Tue Oct 10 11:58:17 2017
! \brief  timer_test module
! \note   Copyright (c) 2017 Oak Ridge National Laboratory, UT-Battelle, LLC.
!-----------------------------------------------------------------------------!

program main

    use ISO_FORTRAN_ENV
    implicit none

    call test_timer()
contains

!-----------------------------------------------------------------------------!
subroutine test_timer()
    use ISO_FORTRAN_ENV
    use timerlib, only : Timer
    implicit none
    type(Timer) :: t

    call t%create()
    write(0, *) "Time at creation:", t%walltime(), ", cpu time ", t%cputime()
    
    call t%start()
    call sleep(1)
    call t%stop()
    write(0, *) "Time after sleep:", t%walltime(), ", cpu time ", t%cputime()
    
    call t%start()
    call sleep(2)
    call t%stop()
    write(0, *) "Time after sleep:", t%walltime(), ", cpu time ", t%cputime()

    call t%reset()
    write(0, *) "Time after reset:", t%walltime(), ", cpu time ", t%cputime()
end subroutine
!-----------------------------------------------------------------------------!

end program

!-----------------------------------------------------------------------------!
! end of common/timer_test.f90
!-----------------------------------------------------------------------------!
