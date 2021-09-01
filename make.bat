call "C:\Program Files (x86)\Intel\oneAPI\setvars.bat" intel64 vs2019

set sname=solver.exe

ifort src\iric.f90  /Qopenmp /nostandard-realloc-lhs /MD /c
ifort src\main.f90 /Qopenmp /nostandard-realloc-lhs /MD /c

ifort *.obj lib\iriclib.lib -o%sname%

del *.obj
del *.mod

move %sname% .\INSTALL\bin\

set x=%~p0
for %%1 in ("%x:~0,-1%") do set folder=%%~nx1
echo '%USERPROFILE%\iRIC_v4\private\solvers%folder%'
mkdir %USERPROFILE%\iRIC_v4\private\solvers\%folder%
echo 'copy solver files'
copy /y .\INSTALL\bin\* %USERPROFILE%\iRIC_v4\private\solvers\%folder%
