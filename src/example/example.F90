 module example_data_cfg
 ! module for storing are sharing data which are read from the text input file
  character*50 :: title_text1, title_text2
  integer :: print_level1, print_level2
  character*20 :: file_name
  logical :: do_this=.false.
  integer :: nelec_f1(16)
  real*8  :: factor1,factor21,factor22
 end module example_data_cfg

 subroutine read_input_file
 ! open and read the input file
  !use input_reader
  implicit none
  logical :: input_found
  integer :: lucmd = 5
  ! if you change the file name, adapt character length accordingly
  character*11 :: inpfile="EXAMPLE.INP"
  inquire(file=inpfile, exist=input_found)
  if (.not.input_found) then
   stop "input file not found !"
  endif
  ! library routine
  call read_menu_input(inpfile, lucmd, 'ALL', input_found)
 end subroutine read_input_file

 subroutine read_input_sections(word, kw_section)
  use input_reader 
  implicit none
  character(kw_length), intent(in) :: word
  character(kw_length), intent(in) :: kw_section
  select case (kw_section)
   case ('**SECT1')
    call read_example_input_sect1(word, kw_section)
   case ('**SECT2')
    call read_example_input_sect2(word, kw_section)
   case default
   ! activate as soon as everything is merged to here
    call quit('section '//kw_section//' not recognized')
  end select
 end subroutine

 subroutine read_example_input_sect1(word, kw_section)
 ! read input data of the **DIAG section
  use input_reader
  use example_data_cfg
  implicit none
  character(kw_length), intent(in) :: word
  character(kw_length), intent(in) :: kw_section
  call reset_available_kw_list()
  if (kw_matches(word, '.TITLE ')) then
   call kw_read(word, title_text1)
  end if
  if (kw_matches(word, '.PRINT ')) then
   call kw_read(word, print_level1)
  end if
  if (kw_matches(word, '.MTXFIL')) then
   call kw_read(word, file_name)
  end if
  if (kw_matches(word, '.DOTHIS')) then
   do_this = .true.
  end if
  call check_whether_kw_found(word, kw_section)
 end subroutine

 subroutine read_example_input_sect2(word, kw_section)
 ! read input data of the **DIAG section
  use input_reader
  use example_data_cfg
  implicit none
  character(kw_length), intent(in) :: word
  character(kw_length), intent(in) :: kw_section
  call reset_available_kw_list()
  if (kw_matches(word, '.TITLE ')) then
   call kw_read(word, title_text2)
  end if
  if (kw_matches(word, '.PRINT ')) then
   call kw_read(word, print_level2)
  end if
  if (kw_matches(word, '.FACT1 ')) then
   call kw_read(word,factor1)
  end if
  if (kw_matches(word, '.FACT2 ')) then
   call kw_read(word,factor21,factor22)
  end if
  if (kw_matches(word, '.NEL_F1')) then
   call kw_read(word,nelec_f1)
  end if
  call check_whether_kw_found(word, kw_section)
 end subroutine

 program Test_input_reader
  logical :: correct = .false.
  call read_input_file
  call check_read_data(correct)
  if (correct) print *,'Fortran Input Reader OK!'
 end program
