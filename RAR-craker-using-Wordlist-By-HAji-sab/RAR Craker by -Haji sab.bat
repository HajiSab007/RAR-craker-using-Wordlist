@echo off
title RAR Craker - BY Haji Sab
chcp 437 >nul
chcp 65001 >nul
mode con: cols=80 lines=25
if not exist "C:\Program Files\7-Zip" (
	echo 7-Zip not installed!
	pause
	exit
)
echo.
echo.
echo   [38;2;255;0;0m██████╗  █████╗ ██████╗      ██████╗██████╗  █████╗ ██╗  ██╗███████╗██████╗ [0m 
echo   [38;2;255;51;0m██╔══██╗██╔══██╗██╔══██╗    ██╔════╝██╔══██╗██╔══██╗██║ ██╔╝██╔════╝██╔══██╗[0m 
echo   [38;2;255;102;0m██████╔╝███████║██████╔╝    ██║     ██████╔╝███████║█████╔╝ █████╗  ██████╔╝[0m 
echo   [38;2;255;153;0m██╔══██╗██╔══██║██╔══██╗    ██║     ██╔══██╗██╔══██║██╔═██╗ ██╔══╝  ██╔══██╗[0m 
echo   [38;2;255;204;0m██║  ██║██║  ██║██║  ██║    ╚██████╗██║  ██║██║  ██║██║  ██╗███████╗██║  ██║[0m 
echo   [38;2;255;255;0m╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝     ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝[0m 
echo.
echo.

set /p archive="Enter Archive Location: "
if not exist "%archive%" (
	echo Archive not found!
	pause
	exit
)

set /p wordlist="Enter Wordlist: "
if not exist "%wordlist%" (
	echo Wordlist not found!
	pause
	exit
)
cls
echo Cracking...
for /f %%a in (%wordlist%) do (
	set pass=%%a
	call :attempt
)
color 4
cls
echo.
echo Shitty Wordlist           
echo.
pause
exit
a
:attempt
"C:\Program Files\7-Zip\7z.exe" x -p%pass% "%archive%" -o"cracked" -y >nul 2>&1
echo ATTEMPT : %pass%
if /I %errorlevel% EQU 0 (
color A

echo ███████╗██╗   ██╗ ██████╗ ██████╗███████╗███████╗███████╗
echo ██╔════╝██║   ██║██╔════╝██╔════╝██╔════╝██╔════╝██╔════╝
echo ███████╗██║   ██║██║     ██║     █████╗  ███████╗███████╗
echo ╚════██║██║   ██║██║     ██║     ██╔══╝  ╚════██║╚════██║
echo ███████║╚██████╔╝╚██████╗╚██████╗███████╗███████║███████║
echo ╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝╚══════╝╚══════╝╚══════╝
echo.
echo.
echo                          ╔════════════╗  
echo    Password is                %pass%     
echo                          ╚════════════╝
	pause
	exit
)
