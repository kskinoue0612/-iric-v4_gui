call "C:\Program Files (x86)\Intel\oneAPI\setvars.bat" intel64 vs2019

rem ----------------------------------------------------------------------
rem set solver name
rem ----------------------------------------------------------------------
set sname=nays2dx
set public=Y

rem ----------------------------------------------------------------------
rem ifort compile
rem ----------------------------------------------------------------------
rem ifort .\src\iric.f90  /Qopenmp /nostandard-realloc-lhs /MD /c
rem ifort .\src\main.f90 /Qopenmp /nostandard-realloc-lhs /MD /c
rem ifort *.obj .\lib\iriclib.lib -o %sname%.exe
del *.obj
del *.mod

rem ----------------------------------------------------------------------
rem copy files into the iRIC folder
rem ----------------------------------------------------------------------
del /Q %USERPROFILE%\iRIC_v4\private\solvers%sname%*
copy /y .\%sname%.exe %USERPROFILE%\iRIC_v4\private\solvers%sname%
copy /y .\definition.xml %USERPROFILE%\iRIC_v4\private\solvers%sname%
copy /y .\ts\* %USERPROFILE%\iRIC_v4\private\solvers%sname%

rem ----------------------------------------------------------------------
rem copy files into the INASTALL dir
rem ----------------------------------------------------------------------
del /Q .\INSTALL\bin\*
copy /y .\%sname%.exe .\INSTALL\bin
copy /y .\definition.xml .\INSTALL\bin
copy /y .\ts\* .\INSTALL\bin

rem ----------------------------------------------------------------------
rem update .github\workflows\build.yml
rem ----------------------------------------------------------------------
del /Q .github\workflows\build.yml

set BEFORE_STRING=PACKAGE_NAME
set AFTER_STRING=%sname%

set BEFORE_STRING2=PUBLIC_STAT
set AFTER_STRING2=%public%

set INPUT_FILE=.github\workflows\build.yml.org
set OUTPUT_FILE=.github\workflows\build.yml

setlocal enabledelayedexpansion
for /f "delims=" %%a in (%INPUT_FILE%) do (
  set line=%%a
  set line=!line:%BEFORE_STRING%=%AFTER_STRING%!
  set line=!line:%BEFORE_STRING2%=%AFTER_STRING2%!
  echo !line!>>%OUTPUT_FILE%
)


rem ----------------------------------------------------------------------
rem update INSATALL meta installscript.qs
rem ----------------------------------------------------------------------
del /Q .\INSTALL\meta\installscript.qs

set BEFORE_STRING=PACKAGE_NAME
set AFTER_STRING=%sname%

set INPUT_FILE=.\INSTALL\meta\installscript.qs.org
set OUTPUT_FILE=.\INSTALL\meta\installscript.qs

setlocal enabledelayedexpansion
for /f "delims=" %%a in (%INPUT_FILE%) do (
set line=%%a
echo !line:%BEFORE_STRING%=%AFTER_STRING%!>>%OUTPUT_FILE%
)
