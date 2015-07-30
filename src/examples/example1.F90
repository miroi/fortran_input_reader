 module example_data_cfg
 ! module for storing/sharing data read from dedicated text input file
  character*50 :: title_text
  integer :: print_level
  character*20 :: matrix_file_name
  logical :: do_dsyevr=.false.
 end module example_data_cfg

 subroutine read_input_file
  use input_reader
  use example_data_cfg
  implicit none
  logical :: input_found
  integer :: lucmd = 5
  ! if you change the file name, adapt character length accordingly
  character*11 :: inpfile="EXAMPLE.INP"
  inquire(file=inpfile, exist=input_found)
  if (.not.input_found) then
   stop "input file not found !"
  endif
  call read_menu_input(inpfile, lucmd, 'ALL', input_found)
 end subroutine read_input_file

 subroutine read_input_sections(word, kw_section)
  use input_reader 
  implicit none
  character(kw_length), intent(in) :: word
  character(kw_length), intent(in) :: kw_section
  select case (kw_section)
   case ('**DIAG ')
    call read_example_input(word, kw_section)
   case default
!          activate as soon as everything is merged to here
!          call quit('section '//kw_section//' not recognized')
  end select
 end subroutine

 subroutine read_example_input(word, kw_section)
  use input_reader
  use example_data_cfg
  implicit none
  character(kw_length), intent(in) :: word
  character(kw_length), intent(in) :: kw_section
  call reset_available_kw_list()

  if (kw_matches(word, '.TITLE ')) then
   call kw_read(word, title_text)
  end if

  if (kw_matches(word, '.PRINT ')) then
   call kw_read(word, print_level)
  end if

  if (kw_matches(word, '.MTXFIL')) then
   call kw_read(word, matrix_file_name)
  end if

  if (kw_matches(word, '.DSYEVR')) then
   do_dsyevr = .true.
  end if
  call check_whether_kw_found(word, kw_section)
end subroutine

 subroutine QUIT(TEXT)
  CHARACTER TEXT*(*)
  print *,TEXT
  stop 
 end subroutine

 program Test_input_reader_1
  use example_data_cfg
  call read_input_file
  print *,'Test_input_reader_1'
 end program
