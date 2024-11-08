! DART software - Copyright UCAR. This open source software is provided
! by UCAR, "as is", without charge, subject to all terms of use at
! http://www.image.ucar.edu/DAReS/DART/DART_download

program test_calendar_string

use time_manager_mod, only: set_calendar_type, get_calendar_type, &
                      NO_CALENDAR, THIRTY_DAY_MONTHS, JULIAN, NOLEAP, &
                      GREGORIAN_MARS, SOLAR_MARS, GREGORIAN
use utilities_mod, only: initialize_utilities, finalize_utilities, error_handler, E_ERR
use test

implicit none

call initialize_utilities()
call test_set_calendar_type()
call finalize_utilities()

contains

subroutine test_set_calendar_type()
character(len=32) :: calstring
integer :: caltype

call plan(11)

! Test valid calendar strings
calstring = 'NO_CALENDAR'
call set_calendar_type(calstring)
caltype = get_calendar_type()
call is(caltype, NO_CALENDAR, 'NO_CALENDAR')

calstring = 'no_calendar'
call set_calendar_type(calstring)
caltype = get_calendar_type()
call is(caltype, NO_CALENDAR, 'NO_CALENDAR')

calstring = 'no calendar'
call set_calendar_type(calstring)
caltype = get_calendar_type()
call is(caltype, NO_CALENDAR, 'NO_CALENDAR')

calstring = 'none'
call set_calendar_type(calstring)
caltype = get_calendar_type()
call is(caltype, NO_CALENDAR, 'NO_CALENDAR')

calstring = 'noNe'
call set_calendar_type(calstring)
caltype = get_calendar_type()
call is(caltype, NO_CALENDAR, 'NO_CALENDAR')

calstring = 'THIRTY_DAY_MONTHS'
call set_calendar_type(calstring)
caltype = get_calendar_type()
call is(caltype, THIRTY_DAY_MONTHS, 'THIRTY_DAY_MONTHS')

calstring = 'JULIAN'
call set_calendar_type(calstring)
caltype = get_calendar_type()
call is(caltype, JULIAN, 'JULIAN')

calstring = 'NOLEAP'
call set_calendar_type(calstring)
caltype = get_calendar_type()
call is(caltype, NOLEAP, 'NOLEAP')

calstring = 'GREGORIAN_MARS'
call set_calendar_type(calstring)
caltype = get_calendar_type()
call is(caltype, GREGORIAN_MARS, 'GREGORIAN_MARS')

calstring = 'SOLAR_MARS'
call set_calendar_type(calstring)
caltype = get_calendar_type()
call is(caltype, SOLAR_MARS, 'SOLAR_MARS')

calstring = 'GREGORIAN'
call set_calendar_type(calstring)
caltype = get_calendar_type()
call is(caltype, GREGORIAN, 'GREGORIAN')

end subroutine test_set_calendar_type

end program test_calendar_string
