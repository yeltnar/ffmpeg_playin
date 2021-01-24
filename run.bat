@REM https://trac.ffmpeg.org/wiki/StreamingGuide
@REM make sure to have Stereo Mix enabled




@REM ffmpeg -f gdigrab -framerate 30 -i desktop output.mkv

@REM ffmpeg -f dshow -i video="UScreenCapture" -f dshow -i audio="Microphone" output.mkv

@REM ffmpeg -f dshow -i video="screen-capture-recorder" output.flv



@REM helpful stuffs
@REM try to add `-tune zerolatency `
@REM try to capture one app ffmpeg -f gdigrab -framerate 30 -i title=Calculator output.mkv
@REM try to add `-c:v h264_nvenc` for hw encoding 
@REM scale output `-vf scale=320:240 -f rtsp rtsp://localhost:8554/drew`


@REM try to add `-b 2255k`
@REM try to add `-s 1280x720`
@REM try to add `-c:v h264_nvenc` for hw encoding 
@REM ffmpeg -re ^
@REM -f gdigrab -framerate 23 -i desktop ^
@REM -f dshow -f dshow -i audio="Stereo Mix (Realtek(R) Audio)" ^
@REM -c:v libx264_nvenc ^
@REM -preset ultrafast -vcodec libx264 -tune zerolatency -b 900k ^
@REM -vf scale=1280:720 ^
@REM -f flv rtmp://localhost:1935/live


@REM trying to get just video to play 
ffmpeg ^
-f gdigrab -framerate 30 -i desktop ^
-f dshow -f dshow -i audio="Stereo Mix (Realtek(R) Audio)" ^
-c:v h264_nvenc ^
-c:a aac -b:a 160k -ar 44100 -strict -2 ^
-preset ultrafast -vcodec libx264 -b 900k ^
-vf scale=1920:-1 ^
-f flv rtmp://localhost:1935/live


@REM try to capture one app 
@REM ffmpeg -re ^
@REM -f gdigrab -framerate 30 -i title="A New Hope - VLC media player" ^
@REM -f dshow -f dshow -i audio="Stereo Mix (Realtek(R) Audio)" ^
@REM output.mkv


@REM RTSP working
@REM ffmpeg -re -i /mnt/c/Users/acbbr/Documents/zelda.mp4 -c copy -f rtsp rtsp://localhost:8554/mystream

@REM working audio
@REM ffmpeg -f dshow -i audio="Stereo Mix (Realtek(R) Audio)" output.mkv

@REM working video
@REM ffmpeg -f gdigrab -framerate 30 -i desktop output.mkv

@REM fully working
@REM ffmpeg -re -f gdigrab -framerate 30 -i desktop -f dshow -f dshow -i audio="Stereo Mix (Realtek(R) Audio)" -f rtsp rtsp://localhost:8554/drew

@REM using gpu
@REM ffmpeg -re -f gdigrab -framerate 30 -i desktop -f dshow -f dshow -i audio="Stereo Mix (Realtek(R) Audio)" -c:v h264_nvenc -f rtsp rtsp://localhost:8554/drew

@REM RTMP working
@REM ffmpeg -re -i "..\Videos\A New Hope.mp4" -c:a aac -b:a 160k -ar 44100 -strict -2 -preset ultrafast -vcodec libx264 -b 900k -f flv rtmp://localhost:1935/live
@REM RTMP working better
@REM ffmpeg -f gdigrab -framerate 30 -i desktop -f dshow -f dshow -i audio="Stereo Mix (Realtek(R) Audio)" -c:a aac -b:a 160k -ar 44100 -strict -2 -preset ultrafast -vcodec libx264 -b 900k -vf scale=1920:-1 -f flv rtmp://localhost:1935/live

@REM seems pretty okay
@REM ffmpeg -re ^
@REM -f gdigrab -framerate 23 -i desktop ^
@REM -f dshow -f dshow -i audio="Stereo Mix (Realtek(R) Audio)" ^
@REM -c:v libx264_nvenc ^
@REM -preset ultrafast -vcodec libx264 -tune zerolatency -b 900k ^
@REM -vf scale=1280:720 ^
@REM -f rtsp rtsp://localhost:8554/drew

@REM intra-refresh
