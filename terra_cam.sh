#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/budi

DATETIME=$(date +"%e.%m.%y %R")
TERRADATA=$(python3 terra_api.py)

#Get image from webcam or copy RAW image from TerrariumPI
#raspistill -rot 90 -o cam.jpg -w 1944 -h 2592 -q 100 -x
cp /home/pi/TerrariumPI/webcam/91b9918af1fc05b955799d4bd25c381c/91b9918af1fc05b955799d4bd25c381c_raw.jpg cam.jpg

#Add overlay
composite -gravity center overlay.png cam.jpg cam_overlay.jpg

#Add data to image
convert cam_overlay.jpg \
	-pointsize 40 -fill white -annotate +1510+50  \
	"Terrarium PI - Thea " \
	-pointsize 40 -fill white -annotate +1510+90  \
	"Taken: $DATETIME" \
	-pointsize 40 -fill white -annotate +1510+130  \
	"$TERRADATA" \
	terrarium.jpg
#Upload to ftp
sleep 2
curl -F "uploaded_file=@terrarium.jpg" https://xxx.com/upload.php

