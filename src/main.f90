!****************************************************************************************************
!
!   Sample program for the iRIC version 4
!
!****************************************************************************************************
    program samaple
    use iric

    implicit none
    integer, parameter :: strmax = 1024
    
    integer :: imin, imax, iout, i, canceled
    character(len=strmax) :: filename
    integer :: fid, mode, ier
!======================================================================
    write(*,'(a)') "---------- START Sample Solver ---------"
    !write(*,*) NARGS()
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
        call iric_check_cancel(canceled)
        if canceled == 1 then
            exit
        end if
        
        ! ここに、計算処理の実行処理を追加

        if(mod(i, iout) == 0) then
            write(*,*) "i = ", i
            
            ! output
            call cg_iric_write_sol_start(fid, ier)

            ! この間に計算結果の出力処理を追加

            call cg_iric_write_sol_end(fid, ier)
        end if

        ! iRIC GUIで再読み込みボタンが押されたかチェック
        call cg_iric_check_update(fid, ier)
    end do
    
    call cg_iric_close(fid, ier)
    
    write(*,'(a)') "---------- END: Sample Solver ---------"
    end program
