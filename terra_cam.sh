#!/bin/bash

DATETIME=$(date +"%e.%m.%y %R")
TERRADATA=$(python terra_api.py)

#Get image from webcam or copy RAW image from TerrariumPI
#raspistill -rot 90 -o cam.jpg -w 1944 -h 2592 -q 100 -x
cp /home/pi/TerrariumPI/webcam/799bd9a9c5fbfb43fb382ec550b4b943/799bf4d9c5fbfbb4fbe82ec550b4b943_raw.jpg cam.jpg

#Add overlay
composite -gravity center overlay.png cam.jpg cam_overlay.jpg

#Add data to image
convert cam_overlay.jpg \
	-pointsize 40 -fill white -annotate +1510+50  \
	"Terrarium PI - Thea " \
	-pointsize 40 -fill white -annotate +1510+90  \
	"Date: $DATETIME" \
	-pointsize 40 -fill white -annotate +1510+130  \
	"$TERRADATA" \
	cam_final.jpg
#Upload to ftp
sleep 2
curl -T cam_final.jpg ftp://hostname//terrarium.jpg --user username:password
