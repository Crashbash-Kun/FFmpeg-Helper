@echo off
set input=%1

if [%input%] NEQ [] (
echo %input%
 ) ELSE (
Echo empty
 )
pause





:AudioExtract
Set /p codec=Codec (mp3,ogg,flac,ect)=
set /p bitrate=bitrate in k (128,192,320,ect)=
ffmpeg -i %input% -vn -ac 2 -ab %bitrate%k -f %codec% %1.%codec%
