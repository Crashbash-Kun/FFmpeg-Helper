@echo off
set custom=D:\
set input=%1



if [%input%] == [] ( 
Echo No file given. Specify either manually or via drag and drop an input file:
set /p input=File:
 )
cls
Echo Using Input File: %input%
Echo Select Output Location:
set "errorlevel=" 			REM Clears the Variable
Echo (S)ame as Input
Echo (M)anually given Location
Echo (C)ustom Set Location: %custom%
Choice /C SMC /N
cls
if %errorlevel==3 (
set output=%custom%
goto operation
 )
if %errorlevel==2 (
echo Specify Location:
set /p output=
goto operation
 )
if %errorlevel%==1 (
call :setfile %input%
:Return
goto operation
 ) 
 
 
 
:operation
echo %output%
pause



:AudioExtract
Set /p codec=Codec (mp3,ogg,flac,ect)=
set /p bitrate=bitrate in k (128,192,320,ect)=
ffmpeg -i %input% -vn -ac 2 -ab %bitrate%k -f %codec% %1.%codec%



goto :eof
:setfile
set output=%~dp1
goto Return
