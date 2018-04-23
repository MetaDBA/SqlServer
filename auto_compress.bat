@echo off

setlocal

set debug=

set workDir=C:\IT
set fileMask=*.BAK

call :GETDATEPARTS "%date%"
call :SUBTRACTDAYS 2

set cutOff=%yy%%mm%%dd%

pushd "%workDir%"

for /f "tokens=*" %%a in ('dir /b /a-d "%fileMask%" 2^>NUL') DO call :PROCESS "%%a" %%~ta

popd 
      
goto :EOF

:PROCESS

call :GETDATEPARTS %~2

if /i "%yy%%mm%%dd%" GTR "%cutOff%" goto :EOF

%debug% "c:\Program Files\7-Zip\7z.exe" a -y "%~1.7z" "%~1"
%debug%  del "%~1"
%debug%  move *.7z "c:\IT\Archive\"

goto :EOF

:GETDATEPARTS

set dt=%~1
set tok=1-3

if "%dt:~0,1%" GTR "9" set tok=2-4

set yyyy=

for /f "tokens=%tok% delims=.:/-, " %%a in ('echo %~1') do (
  for /f "skip=1 tokens=2-4 delims=/-,()." %%x in ('echo.^|date') do set %%x=%%a&set %%y=%%b&set %%z=%%c)

if not "%yyyy%"=="" set yy=%yyyy%

if 1%yy% LSS 1000 (if %yy% LSS 70 (set yy=20%yy%) else (set yy=19%yy%))
if 1%mm% LSS 100 set mm=0%mm%
if 1%dd% LSS 100 set dd=0%dd%

goto :EOF

:SUBTRACTDAYS

set dayCnt=%1

if "%dayCnt%"=="" set dayCnt=1

REM Substract your days here
set /A dd=1%dd% - 100 - %dayCnt%
set /A mm=1%mm% - 100

:CHKDAY

if /I %dd% GTR 0 goto DONESUBTRACT

set /A mm=%mm% - 1

if /I %mm% GTR 0 goto ADJUSTDAY

set /A mm=12
 set /A yy=%yy% - 1

:ADJUSTDAY

if %mm%==1 goto SET31
if %mm%==2 goto LEAPCHK
if %mm%==3 goto SET31
if %mm%==4 goto SET30
if %mm%==5 goto SET31
if %mm%==6 goto SET30
if %mm%==7 goto SET31
if %mm%==8 goto SET31
if %mm%==9 goto SET30
if %mm%==10 goto SET31
if %mm%==11 goto SET30
REM ** Month 12 falls through

:SET31

set /A dd=31 + %dd%

goto CHKDAY

:SET30

set /A dd=30 + %dd%

goto CHKDAY

:LEAPCHK

set /A tt=%yy% %% 4

if not %tt%==0 goto SET28

set /A tt=%yy% %% 100

if not %tt%==0 goto SET29

set /A tt=%yy% %% 400

if %tt%==0 goto SET29

:SET28

set /A dd=28 + %dd%

goto CHKDAY

:SET29

set /A dd=29 + %dd%

goto CHKDAY

:DONESUBTRACT

if /I %mm% LSS 10 set mm=0%mm%
if /I %dd% LSS 10 set dd=0%dd%

goto :EOF