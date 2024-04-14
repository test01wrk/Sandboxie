REM @ECHO OFF

IF %1 == x86 (
  set archPath=Win32
  call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvars32.bat"
  set qtPath=%~dp0..\..\Qt\5.15.2\msvc2019
  set instPath=%~dp0\SbiePlus_x86
)
IF %1 == x64 (
  set archPath=x64
  call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvars64.bat"
REM  set qtPath=%~dp0..\..\Qt\6.3.1\msvc2019_64
  set qtPath=%~dp0..\..\Qt\5.15.2\msvc2019_64
  set instPath=%~dp0\SbiePlus_x64
)
IF %1 == ARM64 (
  set archPath=ARM64
  call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvarsamd64_arm64.bat"
  set qtPath=%~dp0..\..\Qt\6.3.1\msvc2019_arm64
  set instPath=%~dp0\SbiePlus_a64
)
@echo on

set sbiePath=%~dp0..\Sandboxie\Bin\%archPath%\SbieRelease

echo inst: %instPath%
echo arch: %archPath%
echo source: %sbiePath%

mkdir %instPath%


ECHO Copying Sandboxie Driver
copy /y %sbiePath%\SbieDrv.sys %instPath%\
copy /y %sbiePath%\SbieDrv.pdb %instPath%\
