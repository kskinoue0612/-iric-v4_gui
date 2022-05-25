@echo off

rem ----------------------------------------------------------------------
rem ifort compile
rem ----------------------------------------------------------------------
ifort .\src\iric.f90  /Qopenmp /nostandard-realloc-lhs /MD /c
ifort .\src\main.f90 /Qopenmp /nostandard-realloc-lhs /MD /c
ifort *.obj .\lib\iriclib.lib -o solver.exe
del *.obj
del *.mod

copy /y .\solver.exe .\INSTALL
