# TerrariumPI-Send-Webcam-Image-With-Data-To-Public

This script works with TerrariumPi and Raspberry Camera and make a image with terrarium data and then publish it to ftp.
You can use different publish method than ftp, just add it at the end.

Working script:
https://kaju.ovh/terra/terrarium.jpg

## Instalation:

1. Download 3 files to your /home/pi catalog.
2. Configure files for yourself. (Remember about utf-8 code formatting for degree character)
2. Give them permission
```
sudo chmod +x terra_api.py
sudo chmod +x terra_cam.sh
```
3. Install needed software
```
sudo apt-get install imagemagick
```
4. Run script with cron(mine works every 50 min.)
```
crontab -e
*/10 * * * * sh /home/pi/terra_cam.sh

```

## Configuration:

So to make it work for you, you need/can change:
1. IP and sensors id/quantity in terra_api.py
2. Size of overlay.png if you use different camera resolution.
3. Link to upload.php on your www
4. Folder and camera source image name
