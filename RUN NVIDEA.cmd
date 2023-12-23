@ECHO OFF
:: Run Script as Administrator

set _Args=%*
if "%~1" NEQ "" (
  set _Args=%_Args:"=%
)
fltmc 1>nul 2>nul || (
  cd /d "%~dp0"
  cmd /u /c echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~dp0"" && ""%~dpnx0"" ""%_Args%""", "", "runas", 1 > "%temp%\GetAdmin.vbs"
  "%temp%\GetAdmin.vbs"
  del /f /q "%temp%\GetAdmin.vbs" 1>nul 2>nul
  exit
)
::==============================================================================
@ECHO OFF
:HOME
color 8F
MODE CON: COLS=105 LINES=35 
TITLE NZBSearchMachine.com
CLS
ECHO.
ECHO.
ECHO                    _____________________________________________________________________
ECHO                    ^|                                                                   ^|
ECHO                    ^|              Files in INPUT ^| All comes out in OUTPUT            ^|
ECHO                    ^|___________________________________________________________________^|
ECHO                    ^|                                                                   ^|
ECHO                    ^| Choose your option                                                ^|
ECHO                    ^|  -----------------                                                ^|
ECHO                    ^| [ install ]  Install all requirments                              ^|
ECHO                    ^|                                                                   ^|
ECHO                    ^| [ 1080p   ]  MKV to HDR10+ 1080P NVENC x265 QVC 10bit             ^|
ECHO                    ^| [ 4k      ]  MKV to HDR10+ 4K HEVC x265 NVENC 10bit               ^|
ECHO                    ^| [ remux   ]  MKV to Remux x264 NVENC 10bit                        ^|
ECHO                    ^|                                                                   ^|
ECHO                    ^| [ delsub  ]  DELETE ALL Subtitles                                 ^|
ECHO                    ^|                                                                   ^|
ECHO                    ^| [ get     ]  Extract Audio / Sub Tool                             ^|
ECHO                    ^|                                                                   ^|
ECHO                    ^| [ add1    ]  ADD E-AC3 NL                                         ^|
ECHO                    ^| [ add2    ]  ADD E-AC3 ENG                                        ^|
ECHO                    ^| [ add3    ]  ADD AAC NL                                           ^|
ECHO                    ^| [ add4    ]  ADD AAC ENG                                          ^|
ECHO                    ^|                                                                   ^|
ECHO                    ^| [ add5    ]  ADD SUB RETAIL                                       ^|
ECHO                    ^| [ add6    ]  ADD SUB CUSTOM                                       ^|
ECHO                    ^|                                                                   ^|
ECHO                    ^| [ close   ]  Close                                                ^|
ECHO                    ^|___________________________________________________________________^|
ECHO;
ECHO.
ECHO.
SET /P "option=->                 Your choice: "
IF "%option%"=="install" GOTO :PATH
IF "%option%"=="1080p" GOTO :1080P
IF "%option%"=="4k" GOTO :4K
IF "%option%"=="remux" GOTO :REMUX
IF "%option%"=="delsub" GOTO :DELSUB
IF "%option%"=="get" GOTO :GET
IF "%option%"=="add1" GOTO :ADD1
IF "%option%"=="add2" GOTO :ADD2
IF "%option%"=="add3" GOTO :ADD3
IF "%option%"=="add4" GOTO :ADD4
IF "%option%"=="add5" GOTO :ADD5
IF "%option%"=="add6" GOTO :ADD6
IF "%option%"=="close" EXIT /B
IF NOT DEFINED "option" GOTO :HOME  
::==================================================================================================
@ECHO OFF
:PATH

color 8F
MODE CON: COLS=105 LINES=35 
mkdir "C:\Program Files\ffmpeg"
mkdir "C:\Program Files\ffmpeg\fonts"
mkdir "C:\Program Files\ffmpeg\presets"
mkdir "C:\Program Files\mkvextract"

SET XCOPY="xcopy.exe"
SET XCOPYSWITCH=/s /i /r /v /k /f /c /h /y
%XCOPY% "%~dp0\.FFMPEG\ffmpeg\bin\ffmpeg.exe" "C:\Program Files\ffmpeg\" %XCOPYSWITCH%
SET XCOPY="xcopy.exe"
SET XCOPYSWITCH=/s /i /r /v /k /f /c /h /y
%XCOPY% "%~dp0\.FFMPEG\ffmpeg\bin\ffprobe.exe" "C:\Program Files\ffmpeg\" %XCOPYSWITCH%
SET XCOPY="xcopy.exe"
SET XCOPYSWITCH=/s /i /r /v /k /f /c /h /y
%XCOPY% "%~dp0\.FFMPEG\ffmpeg\bin\ffplay.exe" "C:\Program Files\ffmpeg\" %XCOPYSWITCH%
SET XCOPY="xcopy.exe"
SET XCOPYSWITCH=/s /i /r /v /k /f /c /h /y
%XCOPY% "%~dp0\.FFMPEG\ffmpeg\fonts\fonts.conf" "C:\Program Files\ffmpeg\fonts\" %XCOPYSWITCH%
SET XCOPY="xcopy.exe"
SET XCOPYSWITCH=/s /i /r /v /k /f /c /h /y
%XCOPY% "%~dp0\.FFMPEG\ffmpeg\presets\libvpx-360p.ffpreset" "C:\Program Files\ffmpeg\presets\" %XCOPYSWITCH%
SET XCOPY="xcopy.exe"
SET XCOPYSWITCH=/s /i /r /v /k /f /c /h /y
%XCOPY% "%~dp0\.FFMPEG\ffmpeg\presets\libvpx-720p.ffpreset" "C:\Program Files\ffmpeg\presets\" %XCOPYSWITCH%
SET XCOPY="xcopy.exe"
SET XCOPYSWITCH=/s /i /r /v /k /f /c /h /y
%XCOPY% "%~dp0\.FFMPEG\ffmpeg\presets\libvpx-720p50_60.ffpreset" "C:\Program Files\ffmpeg\presets\" %XCOPYSWITCH%
SET XCOPY="xcopy.exe"
SET XCOPYSWITCH=/s /i /r /v /k /f /c /h /y
%XCOPY% "%~dp0\.FFMPEG\ffmpeg\presets\libvpx-1080p.ffpreset" "C:\Program Files\ffmpeg\presets\" %XCOPYSWITCH%
SET XCOPY="xcopy.exe"
SET XCOPYSWITCH=/s /i /r /v /k /f /c /h /y
%XCOPY% "%~dp0\.FFMPEG\ffmpeg\presets\libvpx-1080p50_60.ffpreset" "C:\Program Files\ffmpeg\presets\" %
setx /M PATH "%PATH%;C:\Program Files\ffmpeg"	
ECHO.
SET XCOPY="xcopy.exe"
SET XCOPYSWITCH=/s /i /r /v /k /f /c /h /y
%XCOPY% "%~dp0\.MKVEXTRACT\mkvextract.exe" "C:\Program Files\mkvextract\" %XCOPYSWITCH%
SET XCOPY="xcopy.exe"
SET XCOPYSWITCH=/s /i /r /v /k /f /c /h /y
%XCOPY% "%~dp0\.MKVEXTRACT\gMKVExtractGUI.ini" "C:\Program Files\mkvextract\" %XCOPYSWITCH%
SET XCOPY="xcopy.exe"
SET XCOPYSWITCH=/s /i /r /v /k /f /c /h /y
%XCOPY% "%~dp0\.MKVEXTRACT\gMKVToolNix.dll" "C:\Program Files\mkvextract\" %XCOPYSWITCH%
SET XCOPY="xcopy.exe"
SET XCOPYSWITCH=/s /i /r /v /k /f /c /h /y
%XCOPY% "%~dp0\.MKVEXTRACT\Newtonsoft.Json.dll" "C:\Program Files\mkvextract\" %XCOPYSWITCH%
setx /M PATH "%PATH%;C:\Program Files\mkvextract"	
ECHO.
Start "" /wait "%~dp0\.MKVTOOLNIX\mkvtoolnix-v81.0.exe" /S
setx /M PATH "%PATH%;C:\Program Files\MKVToolNix"
Start "" /wait "%~dp0\.7ZIP\7zip.exe" /S
ECHO. READY. ALL REQUIRMENTS AREINSTALLED!
ECHO. SPECIAL THANKS TO NZBSEARCHMACHINE.COM
ECHO. Press any key to EXIT and RUN.cmd again to convert files...
pause > NUL
EXIT
::==============================================================================
@ECHO OFF
:1080P
setlocal EnableDelayedExpansion
color 8F
MODE CON: COLS=105 LINES=35 
set "startTime=%time: =0%"
FOR /f "delims=|" %%a IN ('dir /b "%~dp0INPUT\"') DO (
	set filename=%%a
	set filepath="%~dp0INPUT\!filename!"
	set dstpath="%~dp0OUTPUT\HEVC\!filename:.mkv=! HDR10+ 1080P HEVC x265 10bit.mkv"
	ffmpeg -i !filepath! -map 0 -c:v hevc_nvenc -vf scale=1920:1080 -load_plugin hevc_nvenc -pix_fmt p010le -profile:v main10 -x265-params keyint=25:bframes=2:vbv-bufsize=50000:vbv-maxrate=50000:hdr-opt=1:no-open-gop=1:hrd=1:repeat-headers=1:colorprim=bt2020:transfer=smpte2084:colormatrix=bt2020nc:master-display="G(13250,34500)B(7500,3000)R(34000,16000)WP(15635,16450)L(10000000,500)":max-cll="1000,400" -b:v 4000k -preset:v slow -c:a copy -c:s copy -metadata Title="NZBSearchMachine.Com" !dstpath!
)
SET "end=!endTime:%time:~8,1%=%%100)*100+1!"  &  set "start=!startTime:%time:~8,1%=%%100)*100+1!"
SET /A "elap=((((10!end:%time:~2,1%=%%100)*60+1!%%100)-((((10!start:%time:~2,1%=%%100)*60+1!%%100), elap-=(elap>>31)*24*60*60*100"
SET /A "cc=elap%%100+100,elap/=100,ss=elap%%60+100,elap/=60,mm=elap%%60+100,hh=elap/60+100"
ECHO. FINISHED IN:  %hh:~1%%time:~2,1%%mm:~1%%time:~2,1%%ss:~1%%time:~8,1%%cc:~1%
ECHO. FILES ARE IN OUTPUT!
ECHO. SPECIAL THANKS TO NZBSEARCHMACHINE.COM
ECHO. Press any key to return to the main menu...
pause > NUL
GOTO :HOME
::==============================================================================
@ECHO OFF
:4K
setlocal EnableDelayedExpansion
color 8F
MODE CON: COLS=105 LINES=35 
set "startTime=%time: =0%"
FOR /f "delims=|" %%a IN ('dir /b "%~dp0INPUT\"') DO (
	set filename=%%a
	set filepath="%~dp0INPUT\!filename!"
	set dstpath="%~dp0OUTPUT\HEVC\!filename:.mkv=! HDR10+ 4K HEVC x265 10bit.mkv"
	ffmpeg -i !filepath! -map 0 -c:v hevc_nvenc -vf scale=3840:2160 -load_plugin hevc_nvenc -pix_fmt p010le -profile:v main10 -x265-params keyint=25:bframes=2:vbv-bufsize=50000:vbv-maxrate=50000:hdr-opt=1:no-open-gop=1:hrd=1:repeat-headers=1:colorprim=bt2020:transfer=smpte2084:colormatrix=bt2020nc:master-display="G(13250,34500)B(7500,3000)R(34000,16000)WP(15635,16450)L(10000000,500)":max-cll="1000,400" -b:v 16000k -preset:v slow -c:a copy -c:s copy -metadata Title="NZBSearchMachine.Com" !dstpath!
)
SET "end=!endTime:%time:~8,1%=%%100)*100+1!"  &  set "start=!startTime:%time:~8,1%=%%100)*100+1!"
SET /A "elap=((((10!end:%time:~2,1%=%%100)*60+1!%%100)-((((10!start:%time:~2,1%=%%100)*60+1!%%100), elap-=(elap>>31)*24*60*60*100"
SET /A "cc=elap%%100+100,elap/=100,ss=elap%%60+100,elap/=60,mm=elap%%60+100,hh=elap/60+100"
ECHO. FINISHED IN:  %hh:~1%%time:~2,1%%mm:~1%%time:~2,1%%ss:~1%%time:~8,1%%cc:~1%
ECHO. FILES ARE IN OUTPUT!
ECHO. SPECIAL THANKS TO NZBSEARCHMACHINE.COM
ECHO. Press any key to return to the main menu...
pause > NUL
GOTO :HOME
::==============================================================================
:REMUX
setlocal EnableDelayedExpansion
color 8F
MODE CON: COLS=105 LINES=35 
set "startTime=%time: =0%"
FOR /f "delims=|" %%a IN ('dir /b "%~dp0INPUT\"') DO (
	set filename=%%a
	set filepath="%~dp0INPUT\!filename!"
	set dstpath="%~dp0OUTPUT\HEVC\!filename:.mkv=! REMUX x264 10bit.mkv"
	ffmpeg -i !filepath! -map 0 -c:v libx264 -pix_fmt yuv420p10le -b:v 12000k -preset:v slow -c:a copy -c:s copy -metadata Title="NZBSearchMachine.Com" !dstpath!
)
SET "end=!endTime:%time:~8,1%=%%100)*100+1!"  &  set "start=!startTime:%time:~8,1%=%%100)*100+1!"
SET /A "elap=((((10!end:%time:~2,1%=%%100)*60+1!%%100)-((((10!start:%time:~2,1%=%%100)*60+1!%%100), elap-=(elap>>31)*24*60*60*100"
SET /A "cc=elap%%100+100,elap/=100,ss=elap%%60+100,elap/=60,mm=elap%%60+100,hh=elap/60+100"
ECHO. FINISHED IN:  %hh:~1%%time:~2,1%%mm:~1%%time:~2,1%%ss:~1%%time:~8,1%%cc:~1%
ECHO. FILES ARE IN OUTPUT!
ECHO. SPECIAL THANKS TO NZBSEARCHMACHINE.COM
ECHO. Press any key to return to the main menu...
pause > NUL
GOTO :HOME
::==============================================================================
@ECHO OFF
:DELSUB
setlocal EnableDelayedExpansion
color 8F
MODE CON: COLS=105 LINES=35 
set "startTime=%time: =0%"
FOR /f "delims=|" %%a IN ('dir /b "%~dp0INPUT\"') DO (
	set filename=%%a
	set filepath="%~dp0INPUT\!filename!"
	set dstpath="%~dp0OUTPUT\HEVC\!filename:.mkv=!.mkv"
	ffmpeg -i !filepath! -map 0 -c:v copy -c:a copy -sn -metadata Title="NZBSearchMachine.Com" !dstpath!
)
SET "end=!endTime:%time:~8,1%=%%100)*100+1!"  &  set "start=!startTime:%time:~8,1%=%%100)*100+1!"
SET /A "elap=((((10!end:%time:~2,1%=%%100)*60+1!%%100)-((((10!start:%time:~2,1%=%%100)*60+1!%%100), elap-=(elap>>31)*24*60*60*100"
SET /A "cc=elap%%100+100,elap/=100,ss=elap%%60+100,elap/=60,mm=elap%%60+100,hh=elap/60+100"
ECHO. FINISHED IN:  %hh:~1%%time:~2,1%%mm:~1%%time:~2,1%%ss:~1%%time:~8,1%%cc:~1%
ECHO. FILES ARE IN OUTPUT!
ECHO. SPECIAL THANKS TO NZBSEARCHMACHINE.COM
ECHO. Press any key to return to the main menu...
pause > NUL
GOTO :HOME
::==============================================================================
@ECHO OFF
:GET
setlocal EnableDelayedExpansion
color 8F
MODE CON: COLS=105 LINES=35 
ECHO.
ECHO.
ECHO                    ____________________________________________________________
ECHO                    ^|                                                          ^|
ECHO                    ^|                   STARTING MKVEXTRACT                    ^|
ECHO                    ^|__________________________________________________________^|
ECHO;
ECHO.
ECHO.
START "" /wait "%~dp0\.MKVEXTRACT\mkvextract.exe"
ECHO. FILES ARE READY WHERE YOU SAVED THEM
ECHO. SPECIAL THANKS TO NZBSEARCHMACHINE.COM
ECHO. Press any key to return to the main menu...
pause > NUL
GOTO :HOME
::==============================================================================
@ECHO OFF
:ADD1
setlocal EnableDelayedExpansion
color 8F
MODE CON: COLS=105 LINES=35 
set "startTime=%time: =0%"
FOR /f "delims=|" %%a IN ('dir /b "%~dp0INPUT\"') DO (
	set filename=%%a
	set filepath="%~dp0INPUT\!filename!"
	set dstpath="%~dp0OUTPUT\HEVC\!filename:.mkv=!.mkv"
	mkvmerge -o !dstpath! --title 2022 --track-name 0:Vid --no-audio --no-subtitles !filepath! --language 0:dut --default-track 0:yes "%~dp0INPUT\!filename:.mkv=!.Eac3" --no-video !filepath!
)
SET "end=!endTime:%time:~8,1%=%%100)*100+1!"  &  set "start=!startTime:%time:~8,1%=%%100)*100+1!"
SET /A "elap=((((10!end:%time:~2,1%=%%100)*60+1!%%100)-((((10!start:%time:~2,1%=%%100)*60+1!%%100), elap-=(elap>>31)*24*60*60*100"
SET /A "cc=elap%%100+100,elap/=100,ss=elap%%60+100,elap/=60,mm=elap%%60+100,hh=elap/60+100"
ECHO. FINISHED IN:  %hh:~1%%time:~2,1%%mm:~1%%time:~2,1%%ss:~1%%time:~8,1%%cc:~1%
ECHO. FILES ARE IN OUTPUT!
ECHO. SPECIAL THANKS TO NZBSEARCHMACHINE.COM
ECHO. Press any key to return to the main menu...
pause > NUL
GOTO :HOME
::==============================================================================
@ECHO OFF
:ADD2
setlocal EnableDelayedExpansion
color 8F
MODE CON: COLS=105 LINES=35 
set "startTime=%time: =0%"
FOR /f "delims=|" %%a IN ('dir /b "%~dp0INPUT\"') DO (
	set filename=%%a
	set filepath="%~dp0INPUT\!filename!"
	set dstpath="%~dp0OUTPUT\HEVC\!filename:.mkv=!.mkv"
	mkvmerge -o !dstpath! --title 2022 --track-name 0:Vid --no-audio --no-subtitles !filepath! --language 0:ENG --default-track 0:yes "%~dp0INPUT\!filename:.mkv=!.Eac3" --no-video !filepath!
)
SET "end=!endTime:%time:~8,1%=%%100)*100+1!"  &  set "start=!startTime:%time:~8,1%=%%100)*100+1!"
SET /A "elap=((((10!end:%time:~2,1%=%%100)*60+1!%%100)-((((10!start:%time:~2,1%=%%100)*60+1!%%100), elap-=(elap>>31)*24*60*60*100"
SET /A "cc=elap%%100+100,elap/=100,ss=elap%%60+100,elap/=60,mm=elap%%60+100,hh=elap/60+100"
ECHO. FINISHED IN:  %hh:~1%%time:~2,1%%mm:~1%%time:~2,1%%ss:~1%%time:~8,1%%cc:~1%
ECHO. FILES ARE IN OUTPUT!
ECHO. SPECIAL THANKS TO NZBSEARCHMACHINE.COM
ECHO. Press any key to return to the main menu...
pause > NUL
GOTO :HOME
::==============================================================================
@ECHO OFF
:ADD3
setlocal EnableDelayedExpansion
color 8F
MODE CON: COLS=105 LINES=35 
set "startTime=%time: =0%"
FOR /f "delims=|" %%a IN ('dir /b "%~dp0INPUT\"') DO (
	set filename=%%a
	set filepath="%~dp0INPUT\!filename!"
	set dstpath="%~dp0OUTPUT\HEVC\!filename:.mkv=!.mkv"
	mkvmerge -o !dstpath! --title 2022 --track-name 0:Vid --no-audio --no-subtitles !filepath! --language 0:dut --default-track 0:yes "%~dp0INPUT\!filename:.mkv=!.aac" --no-video !filepath!
)
SET "end=!endTime:%time:~8,1%=%%100)*100+1!"  &  set "start=!startTime:%time:~8,1%=%%100)*100+1!"
SET /A "elap=((((10!end:%time:~2,1%=%%100)*60+1!%%100)-((((10!start:%time:~2,1%=%%100)*60+1!%%100), elap-=(elap>>31)*24*60*60*100"
SET /A "cc=elap%%100+100,elap/=100,ss=elap%%60+100,elap/=60,mm=elap%%60+100,hh=elap/60+100"
ECHO. FINISHED IN:  %hh:~1%%time:~2,1%%mm:~1%%time:~2,1%%ss:~1%%time:~8,1%%cc:~1%
ECHO. FILES ARE IN OUTPUT!
ECHO. SPECIAL THANKS TO NZBSEARCHMACHINE.COM
ECHO. Press any key to return to the main menu...
pause > NUL
GOTO :HOME
::==============================================================================
@ECHO OFF
:ADD4
setlocal EnableDelayedExpansion
color 8F
MODE CON: COLS=105 LINES=35 
set "startTime=%time: =0%"
FOR /f "delims=|" %%a IN ('dir /b "%~dp0INPUT\"') DO (
	set filename=%%a
	set filepath="%~dp0INPUT\!filename!"
	set dstpath="%~dp0OUTPUT\HEVC\!filename:.mkv=!.mkv"
	mkvmerge -o !dstpath! --title 2022 --track-name 0:Vid --no-audio --no-subtitles !filepath! --language 0:ENG --default-track 0:yes "%~dp0INPUT\!filename:.mkv=!.aac" --no-video !filepath!
)
SET "end=!endTime:%time:~8,1%=%%100)*100+1!"  &  set "start=!startTime:%time:~8,1%=%%100)*100+1!"
SET /A "elap=((((10!end:%time:~2,1%=%%100)*60+1!%%100)-((((10!start:%time:~2,1%=%%100)*60+1!%%100), elap-=(elap>>31)*24*60*60*100"
SET /A "cc=elap%%100+100,elap/=100,ss=elap%%60+100,elap/=60,mm=elap%%60+100,hh=elap/60+100"
ECHO. FINISHED IN:  %hh:~1%%time:~2,1%%mm:~1%%time:~2,1%%ss:~1%%time:~8,1%%cc:~1%
ECHO. FILES ARE IN OUTPUT!
ECHO. SPECIAL THANKS TO NZBSEARCHMACHINE.COM
ECHO. Press any key to return to the main menu...
pause > NUL
GOTO :HOME
::==============================================================================
::==============================================================================
@ECHO OFF
:ADD5
setlocal EnableDelayedExpansion
color 8F
MODE CON: COLS=105 LINES=35 
set "startTime=%time: =0%"
REM ++ Leave as is to set English flag
	SET "lang=dut"
REM @@ blank: SET "lang=dut"
REM // full path to mkvmerge.exe
	SET "muxpath=C:\Program Files\MKVToolNix\mkvmerge.exe"
REM \\ -- -- -- -- --
REM // full path to unrar program, make sure to include switches
	SET "rarpath=C:\Program Files\7-Zip\7z.exe"
	SET "rarcmd=e"
REM \\ -- -- -- -- --
REM // output path (with trailing slash)
REM ++ leave blank for working directory
	SET "outputdir=%~dp0OUTPUT\SRT\"
REM @@ default: SET "outputdir="
REM \\ -- -- -- -- --
REM // prepend text to output filename
REM ++ REQUIRED if outputdir is left blank
	SET "fileprefix="
REM @@ blank: SET "fileprefix="
REM \\ -- -- -- -- --
REM || END USER CONFIG
REM \\ ---- ---- ---- ----
REM -- editing below this line should be done precisely. (here thar be dragons)
REM ===========================================================================

REM @@ simple counters
SET /A "mc=0"
SET /A "me=0"

REM @@ default working path
SET "wp=%~dp0INPUT\"

REM @@ optional working path via argument
IF EXIST "%~1" SET "wp=%~1"

REM @@ ready steady go!
CLS
ECHO ===========================================================================

REM @@ attempt to use custom setting for output path
IF EXIST "%outputdir%" (
	REM @@ user has provided output path
	ECHO == User Setting -- Output to: [%outputdir%]
) ELSE (
	REM @@ no custom setting, check for prefix
	IF [%fileprefix%]==[] (
		ECHO @@ ERROR: empty [fileprefix] setting requires [outputdir] to be set
		SET /A me+=1
		GOTO:GOTO:GETSUB2
	)
	REM @@ use working path for output
	SET "outputdir=%wp%\"
)
FOR %%H IN ("%wp%") DO (
	REM @@ because "." doesn't tell us where we are
	ECHO == Scanning [%%~dpfH\] for video files...
)

:getfiles
FOR %%I IN ("%wp%\*.avi",
			"%wp%\*.mkv",
			"%wp%\*.mkv",
			"%wp%\*.mp4") DO (
	REM @@ found a video file, now check for subtitles
	CALL:getsubs "%%~I"
)
GOTO:GOTO:GETSUB2

:getsubs
FOR %%J IN ("%wp%\%~n1.idx",
			"%wp%\%~n1.ass",
			"%wp%\%~n1.srt") DO (
REM @@ check for paired subtitle files. USF/XML may require this check as well
	IF %%~xJ==.idx IF EXIST "%wp%\%%~nJ.idx" IF NOT EXIST "%wp%\%%~nJ.sub" (
		IF EXIST "%wp%\%%~nJ.rar" (
			ECHO -- [%%~nJ.sub] -- Found potential .rar
			ECHO | SET /p extdone=">> "
			"%rarpath%" "%rarcmd%" "%%~dpJ%%~nJ.rar" | FIND "Extracting"
		) ELSE (
			ECHO @@ ERROR: [%%~nJ.idx] -- Missing .sub file
			SET /A me+=1
			GOTO:GETSUB2
		)
	)
REM @@ subtitle found, time to put it all together
	IF EXIST "%wp%\%%~nJ%%~xJ" CALL:muxit "%%~f1" "%%~xJ"
)
GOTO:GETSUB2

:muxit
REM @@ make sure the destination file doesn't exist first
IF EXIST "%outputdir%%fileprefix%%~n1%~x1" (
	ECHO @@ ERROR: [%~n1%~x1] -- Existing output file
	SET /A me+=1
	GOTO:GETSUB2
)

REM @@ we've made it!
SET /A mc+=1
REM @@ now we let mkvmerge work its magic
ECHO | SET /p muxdone="++ Muxing: (%mc%) [%~n1%~x1]"
"%muxpath%" --default-language "%lang%" -q -o "%outputdir%%fileprefix%%~n1-Retail.NL%~x1" --no-attachments --no-global-tags --title NZBSearchMachine.Com   --track-name 0:Vid "%~1" "%wp%\%~n1%~2" 
ECHO  ..complete
REM @@ success!
GOTO:GETSUB4

:GETSUB2
ECHO == Finished Processing: %mc% completed / %me% errors
ECHO ===========================================================================
SET "end=!endTime:%time:~8,1%=%%100)*100+1!"  &  set "start=!startTime:%time:~8,1%=%%100)*100+1!"
SET /A "elap=((((10!end:%time:~2,1%=%%100)*60+1!%%100)-((((10!start:%time:~2,1%=%%100)*60+1!%%100), elap-=(elap>>31)*24*60*60*100"
SET /A "cc=elap%%100+100,elap/=100,ss=elap%%60+100,elap/=60,mm=elap%%60+100,hh=elap/60+100"
ECHO. FINISHED IN:  %hh:~1%%time:~2,1%%mm:~1%%time:~2,1%%ss:~1%%time:~8,1%%cc:~1%
ECHO. SPECIAL THANKS TO NZBSEARCHMACHINE.COM
ECHO. Press any key to return to the main menu...
pause > NUL
GOTO :HOME

:GETSUB4
ECHO == Finished Processing: %mc% completed / %me% errors
ECHO ===========================================================================
SET "end=!endTime:%time:~8,1%=%%100)*100+1!"  &  set "start=!startTime:%time:~8,1%=%%100)*100+1!"
SET /A "elap=((((10!end:%time:~2,1%=%%100)*60+1!%%100)-((((10!start:%time:~2,1%=%%100)*60+1!%%100), elap-=(elap>>31)*24*60*60*100"
SET /A "cc=elap%%100+100,elap/=100,ss=elap%%60+100,elap/=60,mm=elap%%60+100,hh=elap/60+100"
ECHO. FINISHED IN:  %hh:~1%%time:~2,1%%mm:~1%%time:~2,1%%ss:~1%%time:~8,1%%cc:~1%
ECHO. FILES ARE IN OUTPUT!
ECHO. SPECIAL THANKS TO NZBSEARCHMACHINE.COM
ECHO. Press any key to return to the main menu...
pause > NUL
GOTO :HOME
::==============================================================================
@ECHO OFF
:ADD6
setlocal EnableDelayedExpansion
color 8F
MODE CON: COLS=105 LINES=35 
set "startTime=%time: =0%"
REM ++ Leave as is to set English flag
	SET "lang=dut"
REM @@ blank: SET "lang=dut"
REM // full path to mkvmerge.exe
	SET "muxpath=C:\Program Files\MKVToolNix\mkvmerge.exe"
REM \\ -- -- -- -- --
REM // full path to unrar program, make sure to include switches
	SET "rarpath=C:\Program Files\7-Zip\7z.exe"
	SET "rarcmd=e"
REM \\ -- -- -- -- --
REM // output path (with trailing slash)
REM ++ leave blank for working directory
	SET "outputdir=%~dp0OUTPUT\SRT\"
REM @@ default: SET "outputdir="
REM \\ -- -- -- -- --
REM // prepend text to output filename
REM ++ REQUIRED if outputdir is left blank
	SET "fileprefix="
REM @@ blank: SET "fileprefix="
REM \\ -- -- -- -- --
REM || END USER CONFIG
REM \\ ---- ---- ---- ----
REM -- editing below this line should be done precisely. (here thar be dragons)
REM ===========================================================================

REM @@ simple counters
SET /A "mc=0"
SET /A "me=0"

REM @@ default working path
SET "wp=%~dp0INPUT\"

REM @@ optional working path via argument
IF EXIST "%~1" SET "wp=%~1"

REM @@ ready steady go!
CLS
ECHO ===========================================================================

REM @@ attempt to use custom setting for output path
IF EXIST "%outputdir%" (
	REM @@ user has provided output path
	ECHO == User Setting -- Output to: [%outputdir%]
) ELSE (
	REM @@ no custom setting, check for prefix
	IF [%fileprefix%]==[] (
		ECHO @@ ERROR: empty [fileprefix] setting requires [outputdir] to be set
		SET /A me+=1
		GOTO:GOTO:GETSUB1
	)
	REM @@ use working path for output
	SET "outputdir=%wp%\"
)
FOR %%H IN ("%wp%") DO (
	REM @@ because "." doesn't tell us where we are
	ECHO == Scanning [%%~dpfH\] for video files...
)

:getfiles
FOR %%I IN ("%wp%\*.avi",
			"%wp%\*.mkv",
			"%wp%\*.mkv",
			"%wp%\*.mp4") DO (
	REM @@ found a video file, now check for subtitles
	CALL:getsubs "%%~I"
)
GOTO:GOTO:GETSUB1

:getsubs
FOR %%J IN ("%wp%\%~n1.idx",
			"%wp%\%~n1.ass",
			"%wp%\%~n1.srt") DO (
REM @@ check for paired subtitle files. USF/XML may require this check as well
	IF %%~xJ==.idx IF EXIST "%wp%\%%~nJ.idx" IF NOT EXIST "%wp%\%%~nJ.sub" (
		IF EXIST "%wp%\%%~nJ.rar" (
			ECHO -- [%%~nJ.sub] -- Found potential .rar
			ECHO | SET /p extdone=">> "
			"%rarpath%" "%rarcmd%" "%%~dpJ%%~nJ.rar" | FIND "Extracting"
		) ELSE (
			ECHO @@ ERROR: [%%~nJ.idx] -- Missing .sub file
			SET /A me+=1
			GOTO:GETSUB1
		)
	)
REM @@ subtitle found, time to put it all together
	IF EXIST "%wp%\%%~nJ%%~xJ" CALL:muxit "%%~f1" "%%~xJ"
)
GOTO:GETSUB1

:muxit
REM @@ make sure the destination file doesn't exist first
IF EXIST "%outputdir%%fileprefix%%~n1%~x1" (
	ECHO @@ ERROR: [%~n1%~x1] -- Existing output file
	SET /A me+=1
	GOTO:GETSUB1
)

REM @@ we've made it!
SET /A mc+=1
REM @@ now we let mkvmerge work its magic
ECHO | SET /p muxdone="++ Muxing: (%mc%) [%~n1%~x1]"
"%muxpath%" --default-language "%lang%" -q -o "%outputdir%%fileprefix%%~n1-Custom.NL%~x1" --no-attachments --no-global-tags --title NZBSearchMachine.Com   --track-name 0:Vid "%~1" "%wp%\%~n1%~2" 
ECHO  ..complete
REM @@ success!
GOTO:GETSUB3

:GETSUB1
ECHO == Finished Processing: %mc% completed / %me% errors
ECHO ===========================================================================
SET "end=!endTime:%time:~8,1%=%%100)*100+1!"  &  set "start=!startTime:%time:~8,1%=%%100)*100+1!"
SET /A "elap=((((10!end:%time:~2,1%=%%100)*60+1!%%100)-((((10!start:%time:~2,1%=%%100)*60+1!%%100), elap-=(elap>>31)*24*60*60*100"
SET /A "cc=elap%%100+100,elap/=100,ss=elap%%60+100,elap/=60,mm=elap%%60+100,hh=elap/60+100"
ECHO. FINISHED IN:  %hh:~1%%time:~2,1%%mm:~1%%time:~2,1%%ss:~1%%time:~8,1%%cc:~1%
ECHO. SPECIAL THANKS TO NZBSEARCHMACHINE.COM
ECHO. Press any key to return to the main menu...
pause > NUL
GOTO :HOME

:GETSUB3
ECHO == Finished Processing: %mc% completed / %me% errors
ECHO ===========================================================================
SET "end=!endTime:%time:~8,1%=%%100)*100+1!"  &  set "start=!startTime:%time:~8,1%=%%100)*100+1!"
SET /A "elap=((((10!end:%time:~2,1%=%%100)*60+1!%%100)-((((10!start:%time:~2,1%=%%100)*60+1!%%100), elap-=(elap>>31)*24*60*60*100"
SET /A "cc=elap%%100+100,elap/=100,ss=elap%%60+100,elap/=60,mm=elap%%60+100,hh=elap/60+100"
ECHO. FINISHED IN:  %hh:~1%%time:~2,1%%mm:~1%%time:~2,1%%ss:~1%%time:~8,1%%cc:~1%
ECHO. FILES ARE IN OUTPUT!
ECHO. SPECIAL THANKS TO NZBSEARCHMACHINE.COM
ECHO. Press any key to return to the main menu...
pause > NUL
GOTO :HOME
::==============================================================================
:EXIT