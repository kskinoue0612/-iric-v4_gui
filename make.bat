call "C:\Program Files (x86)\Intel\oneAPI\setvars.bat" intel64 vs2019

ifort src\iric.f90  /Qopenmp /nostandard-realloc-lhs /MD /c
ifort src\main.f90 /Qopenmp /nostandard-realloc-lhs /MD /c

ifort *.obj lib\iriclib.lib -o a.exe

del *.obj
del *.mod

move a.exe .\INSTALL\bin\

