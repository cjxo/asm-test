@echo off
setlocal

if not exist ..\build mkdir ..\build
pushd ..\build

ml64 /nologo /c /W3 /Zi ..\code\tools.asm
cl /nologo /Zi /Od /W4 /wd4201 ..\code\main.c /link /incremental:no tools.obj user32.lib
popd

endlocal