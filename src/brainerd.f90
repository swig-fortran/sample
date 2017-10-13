! Example algorithms from
! W. S. Brainerd, Guide to Fortran 2008 Programming. Springer, 2nd ed., 2015.
!
! Binary search subroutine: p.141
!
module brainerd
contains
subroutine binary_search(lost_card, card_number, found)
    integer, dimension(:), intent(in) :: lost_card
    integer, intent(in) :: card_number
    logical, intent(out) :: found
    integer :: first, half, last, only
    first = 1
    last = size(lost_card)
    do
        if (first == last) exit
        half = (first + last) / 2
        if (card_number <= lost_card(half)) then
            ! Discard second half
            last = half
        else
            ! Discard first half
            first = half + 1
        end if
    end do
    ! The only remaining subscript to check is first
    ! (which is the same as last)
    only = first
    found = (card_number == lost_card(only))
end subroutine binary_search

end module brainerd
