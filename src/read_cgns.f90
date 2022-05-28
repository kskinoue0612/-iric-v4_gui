!****************************************************************************************************
!
!   Subroutine : Read Calculation Conditions
!
!****************************************************************************************************
subroutine read_cgns(fid)
    use iric
    use global_variables
    
    integer, intent(in) :: fid
    integer :: ier
    
    integer :: n, count, ijsize, nodesize
    integer, dimension(:,:), allocatable :: indices
    
    ! variables for time condition
    call cg_iric_read_real(fid, "dt", dt, ier)
    call cg_iric_read_real(fid, "stime", stime, ier)
    call cg_iric_read_real(fid, "etime", etime, ier)
    call cg_iric_read_real(fid, "toutput", toutput, ier)  
    
    istime = int(stime/dt)
    ietime = int(etime/dt)
    ioutput = int(toutput/dt)
    
    ! grid conditions
    call cg_iric_read_grid2d_str_size(fid, isize, jsize, ier)
    call alloc_variables(isize, jsize)
    call cg_iric_read_grid2d_coords(fid, xx, yy, ier)
    call cg_iric_read_grid_real_cell(fid, "elevation", zc, ier)
    call cg_iric_read_grid_real_cell(fid, "roughness", sn, ier)
    call cg_iric_read_grid_integer_cell(fid, "obstacle", iobst, ier)
    
    ! boundary conditions
    call cg_iric_read_bc_count(fid, "inflow", count)
    do n = 1, count
        call cg_iric_read_bc_indicessize(fid, "inflow", n, nodesize, ier)
        
        
        
        
    end do
    
    allocate(indices(2,nodesize))
    do 
        call cg_iric_read_bc_indices(fid, "inflow", n, indices, ier)
    end do
    
    
    
    
    
    
    
    
    
    
    !call cg_iric_read_bc_count(fid, "outflow", num)
    
    
end subroutine