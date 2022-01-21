program actiontester
    use iric
    implicit none
    integer :: icount
    integer :: len
    integer :: status
    character condFile*255
    integer :: fid
    integer :: ier
    ! UD
    integer :: udEnable
    double precision :: udTimeStep
    integer :: udIterations
    integer :: udColor
    character udTempPath*255
    double precision :: udRealOption
    integer :: udCheckbox;
    ! WD
    integer :: wdEnable
    double precision :: wdTimeStep
    ! WDA
    integer :: wdaEnable
    double precision :: wdaTimeStep
    ! B
    integer :: bEnable
    double precision :: bTimeStep    
    
    write(*,*) "actiontester"
   
    icount = command_argument_count()
    if ( icount.eq.1 ) then
        call get_command_argument (1, condFile, len, status)
    else
        write(*,*) "Input File not specified."
        stop
    endif    
    
    call cg_iric_open(condFile, IRIC_MODE_READ, fid, ier)
    write (*,*) 'input file: ', condFile(1:len)
    
    write(*,*) "UD:"

    call cg_iric_read_integer(fid, "udEnable", udEnable, ier)
    if (udEnable.EQ.0) then
        write(*,*) "  udEnable: 0 (Enable)"
    elseif (udEnable.EQ.1) then
        write(*,*) "  udEnable: 1 (Disable)"
    else
        write(*,*) "  udEnable: ", udEnable, " (Undefined)"
    endif 
    
    call cg_iric_read_real(fid, "udTimeStep", udTimeStep, ier)
    write(*,*) "  udTimeStep:", udTimeStep

    call cg_iric_read_integer(fid, "udIterations", udIterations, ier)
    write(*,*) "  udIterations:", udIterations
    
    call cg_iric_read_integer(fid, "udColor", udColor, ier)
    if (udColor.EQ.0) then
        write(*,*) "  udColor: 0 (Red)"
    elseif (udColor.EQ.1) then
        write(*,*) "  udColor: 1 (Blue)"
    elseif (udColor.EQ.2) then
        write(*,*) "  udColor: 2 (Green)"
    else
        write(*,*) "  udColor: ", udColor, " (Undefined)"
    endif
    
    call cg_iric_read_string(fid, "udTempPath", udTempPath, ier)
    write(*,*) "  udTempPath: ", trim(udTempPath)    
    
    call cg_iric_read_real(fid, "udRealOption", udRealOption, ier)
    write(*,*) "  udRealOption: ", udRealOption
    
    write(*,*) "WD:"
    
    call cg_iric_read_integer(fid, "wdEnable", wdEnable, ier)
    if (wdEnable.EQ.0) then
        write(*,*) "  wdEnable: 0 (Enable)"
    elseif (wdEnable.EQ.1) then
        write(*,*) "  wdEnable: 1 (Disable)"
    else
        write(*,*) "  wdEnable: ", wdEnable, " (Undefined)"
    endif 
    
    call cg_iric_read_real(fid, "wdTimeStep", wdTimeStep, ier)
    write(*,*) "  wdTimeStep:", wdTimeStep

    write(*,*) "WDA:"
    
    call cg_iric_read_integer(fid, "wdaEnable", wdaEnable, ier)
    if (wdaEnable.EQ.0) then
        write(*,*) "  wdaEnable: 0 (Enable)"
    elseif (wdEnable.EQ.1) then
        write(*,*) "  wdaEnable: 1 (Disable)"
    else
        write(*,*) "  wdaEnable: ", wdaEnable, " (Undefined)"
    endif 
    
    call cg_iric_read_real(fid, "wdaTimeStep", wdaTimeStep, ier)
    write(*,*) "  wdaTimeStep:", wdaTimeStep

    write(*,*) "B:"

    call cg_iric_read_integer(fid, "bEnable", bEnable, ier)
    if (bEnable.EQ.0) then
        write(*,*) "  bEnable: 0 (Enable)"
    elseif (bEnable.EQ.1) then
        write(*,*) "  bEnable: 1 (Disable)"
    else
        write(*,*) "  bEnable: ", bEnable, " (Undefined)"
    endif 

    call cg_iric_read_real(fid, "bTimeStep", bTimeStep, ier)
    write(*,*) "  bTimeStep:", bTimeStep    

    call cg_iric_close(fid, ier)
    stop
end program actiontester
