# TerrariumPI-Send-Webcam-Image-With-Data-To-Public

Instalation:

sudo chmod +x 
sudo apt-get install imagemagick

Configuration:



Cron
crontab -e
*/50 * * * * /home/pi/terra_cam.sh >> /home/pi/terra_cam.log
