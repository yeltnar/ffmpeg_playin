@REM ffmpeg -f gdigrab -framerate 30 -i desktop output.mkv

@REM ffmpeg -f dshow -i video="UScreenCapture" -f dshow -i audio="Microphone" output.mkv

@REM ffmpeg -f dshow -i video="screen-capture-recorder" output.flv





@REM try to add `-tune zerolatency `
@REM try to add `-b 2255k`
@REM try to add `-s 1280x720`
ffmpeg -re -f gdigrab -framerate 30 -i desktop -f dshow -f dshow -i audio="Stereo Mix (Realtek(R) Audio)" -preset ultrafast -tune zerolatency -f rtsp rtsp://localhost:8554/drew



@REM RTSP working
@REM ffmpeg -re -i /mnt/c/Users/acbbr/Documents/zelda.mp4 -c copy -f rtsp rtsp://localhost:8554/mystream

@REM working audio
@REM ffmpeg -f dshow -i audio="Stereo Mix (Realtek(R) Audio)" output.mkv

@REM working video
@REM ffmpeg -f gdigrab -framerate 30 -i desktop output.mkv

@REM fully working
@REM ffmpeg -re -f gdigrab -framerate 30 -i desktop -f dshow -f dshow -i audio="Stereo Mix (Realtek(R) Audio)" -f rtsp rtsp://localhost:8554/drew
