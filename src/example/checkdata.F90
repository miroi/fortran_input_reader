 subroutine check_read_data(correct)
  use example_data_cfg
  logical, intent(inout) :: correct
  correct = .true.
 ! print *,title_text1
 ! print *,title_text2
 ! print *,file_name
 ! print *,print_level2
 ! print *,do_this
 ! print *,factor1

  if (do_this.eqv..true.) then
   print *,'logical variable reading ok'
  else
   print *,'logical variable reading FAILED!'
   correct = .false.
  endif

  !if (file_name.eq."Jz_SS_matrix.fermirp2-2") print *,'file name ok'

  if (factor1.eq.0.05D0) then 
   print *,'one real*8 variable reading ok'
  else
   print *,'one real*8 variable reading FAILED! '
   correct = .false.
  endif

  if (factor21.eq.-12.0D0.and.factor22.eq.1.370D0) then 
   print *,'two real*8 variables reading ok'
  else
   print *,'two real*8 variable reading FAILED! '
   print *,'factor21=',factor21
   print *,'factor22=',factor22
   correct = .false.
  endif

  if (    nelec_f1(1).eq.450.and.nelec_f1(2).eq.450 & 
      .and.nelec_f1(3).eq.13.and.nelec_f1(4).eq.12   & 
      .and.nelec_f1(5).eq.-5.and.nelec_f1(6).eq.7) then 
   print *,'integer array reading ok'
  else
   print *,'integer array reading FAILED! '
   correct = .false.
  endif

  if (print_level2.eq.5) then 
   print *,'one integer variable reading ok'
  else
   print *,'one integer variable reading FAILED! '
   correct = .false.
  endif

 end subroutine
