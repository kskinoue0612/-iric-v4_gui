call "C:\Program Files (x86)\Intel\oneAPI\setvars.bat" intel64 vs2019

mkdir .\INSTALL
mkdir .\INSTALL\bin

ifort ./src/main.f90 -o nays2dh.exe

copy nays2dh.exe .\INSTALL\bin\nays2dh.exe

rem copy nays2dh64\definition.xml ..\INSTALL\bin\definition.xml
rem copy nays2dh64\translation_ja_JP.ts ..\INSTALL\bin\translation_ja_JP.ts