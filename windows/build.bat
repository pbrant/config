@echo off

C:\Keil\UV4\UV4.exe -b blinky.uvproj -j0 -o%TEMP%\build.out

SET BUILDERRORLEVEL=%ERRORLEVEL%

type "%TEMP%\build.out"

EXIT /B %BUILDERRORLEVEL%
