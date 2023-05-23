#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/budi

DATETIME=$(date +"%e.%m.%y %R")
TERRADATA=$(python3 terra_api_v4.py)

#Get image from webcam or copy RAW image from TerrariumPI
#raspistill -rot 90 -o cam.jpg -w 1944 -h 2592 -q 100 -x
cp /home/pi/TerrariumPI/webcam/dc8526730b3e6ed66caa576ef5313ef1/dc8526730b3e6ed66caa576ef5313ef1_raw.jpg cam.jpg

#Add overlay
composite -gravity center overlay.png cam.jpg cam_overlay.jpg

#Add data to image
convert cam_overlay.jpg \
	-pointsize 35 -fill white -annotate +1485+45  \
	"Corn Snake - 'Thea'" \
	-pointsize 35 -fill white -annotate +1485+110  \
	"Timestamp: $DATETIME" \
	-pointsize 35 -fill white -annotate +1485+153  \
	"$TERRADATA" \
	terrarium.jpg
	
#Upload to WWW
sleep 2
curl -F "uploaded_file=@terrarium.jpg" https://yourhosting.com/upload.php

