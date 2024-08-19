@echo off
setlocal

if not exist ..\build mkdir ..\build
pushd ..\build

ml64 /nologo /c /W3 /Zi ..\code\tools.asm
cl /nologo /Zi /Od /W4 ..\code\main.c /link /incremental:no tools.obj
popd

endlocal