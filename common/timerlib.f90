module timerlib
    use ISO_FORTRAN_ENV
    use, intrinsic :: ISO_C_BINDING
    implicit none

    ! PUBLIC METHODS AND TYPES
    public :: timer
    ! TYPES
    type :: timer
        private
        ! Start/stop values
        real(C_DOUBLE) :: cpu_start, cpu_stop
        integer :: wall_start, wall_stop
        integer :: count_rate, count_max
        ! Accumulated times
        real(C_DOUBLE) :: cpu_tot, wall_tot
    contains
        procedure :: create => new_timer
        procedure :: start => timer_start
        procedure :: stop => timer_stop
        procedure :: reset => timer_reset
        procedure :: walltime => timer_walltime
        procedure :: cputime => timer_cputime
    end type

contains
subroutine new_timer(self)
    use, intrinsic :: ISO_C_BINDING
    class(timer) :: self

    ! Reset timer start/stop
    self%cpu_start = -1d0
    self%cpu_stop = -1d0
    self%wall_start = -1
    self%wall_stop = -1

    ! Get system timer properties
    call SYSTEM_CLOCK(COUNT_RATE=self%count_rate)

    ! Reset accumulated values
    call self%reset()
end subroutine

subroutine timer_start(self)
    use, intrinsic :: ISO_C_BINDING
    class(timer) :: self
    call CPU_TIME(self%cpu_start)
    call SYSTEM_CLOCK(COUNT=self%wall_start)
end subroutine

subroutine timer_stop(self)
    use, intrinsic :: ISO_C_BINDING
    class(timer) :: self
    call CPU_TIME(self%cpu_stop)
    call SYSTEM_CLOCK(COUNT=self%wall_stop)

    ! assert(self%cpu_stop >= self%cpu_start)
    ! assert(self%wall_stop >= self%wall_start)

    ! Accumulate timers 
    self%cpu_tot = self%cpu_tot + self%cpu_stop - self%cpu_start
    self%wall_tot = self%wall_tot + REAL(self%wall_stop - self%wall_start, &
                                         KIND=C_DOUBLE) / self%count_rate

    ! Clear timers
    self%cpu_start = -1d0
    self%cpu_stop = -1d0
    self%wall_start = -1
    self%wall_stop = -1
end subroutine

subroutine timer_reset(self)
    use, intrinsic :: ISO_C_BINDING
    class(timer) :: self
    self%wall_tot = 0d0
    self%cpu_tot = 0d0
end subroutine

function timer_walltime(self) &
        result(fresult)
    use, intrinsic :: ISO_C_BINDING
    real(C_DOUBLE) :: fresult
    class(timer) :: self
    fresult = self%wall_tot
end function

function timer_cputime(self) &
        result(fresult)
    use, intrinsic :: ISO_C_BINDING
    real(C_DOUBLE) :: fresult
    class(timer) :: self
    fresult = self%cpu_tot
end function

end module timerlib
