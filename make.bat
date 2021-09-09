call "C:\Program Files (x86)\Intel\oneAPI\setvars.bat" intel64 vs2019

rem ----------------------------------------------------------------------
rem set solver name
rem ----------------------------------------------------------------------
set sname=solver.exe

rem ----------------------------------------------------------------------
rem ifort compile
rem ----------------------------------------------------------------------
cd .\INSTALL\bin
ifort ..\..\src\iric.f90  /Qopenmp /nostandard-realloc-lhs /MD /c
ifort ..\..\src\main.f90 /Qopenmp /nostandard-realloc-lhs /MD /c
ifort *.obj ..\..\lib\iriclib.lib -o %sname%
del *.obj
del *.mod

rem ----------------------------------------------------------------------
rem copy files into the iRIC folder
rem ----------------------------------------------------------------------
set x=%~p0
for %%1 in ("%x:~0,-1%") do set folder=%%~nx1
echo '%USERPROFILE%\iRIC_v4\private\solvers%folder%'
mkdir "%USERPROFILE%\iRIC_v4\private\solvers\%folder%"
echo 'copy solver files'
copy /y .\* "%USERPROFILE%\iRIC_v4\private\solvers\%folder%"

cd ..\..