!****************************************************************************************************
!
!   Sample program for the iRIC version4.0
!
!****************************************************************************************************
    program samaple
    use iric

    implicit none
    integer, parameter :: strmax = 1024
    
    integer :: imin, imax, iout, i
    character(len=strmax) :: filename
    integer :: fid, mode, ier
!======================================================================
    write(*,'(a)') "---------- START Sample Solver ---------"
    write(*,*) NARGS()
    if(NARGS() == 2) then
        call GETARG(1, filename)
        !write(*,*) trim(filename)
    else
        write(*,"(a)") "Error: no argument."
        write(*,"(a)") "usage: "
        write(*,"(a)") "***.exe Case1.cgn"
        stop
    end if
    
    
    call cg_iric_open(filename, IRIC_MODE_MODIFY, fid, ier)
    
    imin = 0
    imax = 10000
    iout = 100
    
    do i = imin, imax
        
        
        
        
        
        if(mod(i, iout) == 0) then
            write(*,*) "i = ", i
            
            ! output
            
            
            
            
        end if
    end do
    
    call cg_iric_close(fid, ier)
    
    write(*,'(a)') "---------- END: Sample Solver ---------"
    end program