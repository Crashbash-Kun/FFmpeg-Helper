@echo off
set ffmpeg="./ffmpeg.exe"
set custom=D:\
set input=%1



if [%input%] == [] ( 
Echo No file given. Specify either manually or via drag and drop an input file:
set /p input=File:
 )
cls
Echo Using Input File: %input%
Echo.
Echo Select Output Location:
set "errorlevel=" 			REM Clears the Variable
Echo (S)ame as Input
Echo (M)anually given Location
Echo (C)ustom Set Location: %custom%
Choice /C SMC /N
cls
if %errorlevel%==3 (
set output=%custom%
goto FileName
 )
if %errorlevel%==2 (
Echo Specify Location [MUST have \ at end]:
Echo IE: C:\Users\
set /p output=
goto FileName
 )
if %errorlevel%==1 (
call :setpath %input%
:ReturnPath
goto FileName
 ) 



:FileName
cls
Echo Using Input File:       %input%
Echo Using Output Directory: "%output%"
Echo.
Echo Filename (NO extention) of output file
Echo Leave blank for same as input file
echo.
set /p filename=
if [%filename%] == [] ( 
call :setfile %input%
 )
:ReturnFile
set output="%output%%filename%"



cls
set "errorlevel=" 			REM Clears the Variable
Echo Using Input  File: %input%
Echo Using Output File: %output%
Echo.
Echo (1) Extract Audio Track
Echo () Extract Video Track
Echo ()
Echo ()
Echo ()
Echo ()
Echo ()
Echo ()
Echo ()
Echo ()
Choice /C 1 /N



if %errorlevel%==1 (
goto AudioExtract
 ) 



:AudioExtract
cls
Set /p codec=Codec (mp3,ogg,flac,ect):=
set /p bitrate=bitrate in kilobytes (128,192,320,ect):=
%ffmpeg% -i %input% -vn -ac 2 -ab %bitrate%k -f %codec% %output%.%codec%



exit
:setpath
set output=%~dp1
goto ReturnPath
:setfile
set filename=%~n1
goto ReturnFile
