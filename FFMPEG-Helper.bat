@echo off

Set /p codec=Codec (mp3,ogg,flac,ect)=
set /p bitrate=bitrate in k (128,192,320,ect)=
ffmpeg -i %1 -vn -ac 2 -ab %bitrate%k -f %codec% %1.%codec%
