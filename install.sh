#!/bin/bash

echo "Would you like to install the AudioTx or AudioRx module?"
echo "To Install AudioTx type 'tx' and for AudioRx type 'rx'."
read -p 'Input: ' inputvar

if [$inputvar == "rx"]
then

	echo "Installing the AudioRx Module..."

	# audioRx Install
	sudo apt install ffmpeg -y

	sudo apt install nginx libnginx-mod-rtmp -y

	sudo systemctl start nginx
	sudo systemctl enable nginx

	sudo echo "rtmp {
        	server {
                	listen 1935;
	                chunk_size 4096;

        	        application live {
	                        live on;
        	                record off;
	                        #push rtmp://destination server if desired;

        	        }
	        }
	}" >> /etc/nginx/nginx.conf 

	sudo systemctl restart ngin

	sudo echo "sudo /bin/bash /home/pi/player.sh & \n stop 0" > /etc/rc.local

	echo "Done installing, rebooting..."

	sleep 10

	sudo reboot

fi

if [$inputvar == "tx"]
then
	echo "Installing the AudioTx Module..."
	echo "Please ender the IP address of the AudioRx unit."
	read -p 'AudioRx IP Address: ' ipvar

	# audioTx Install

	sudo apt install ffmpeg -y
	sudo apt install pavucontrol pamix -y


	echo ffmpeg -f alsa -i plughw:1,0 -f flv rtmp://$ipvar/live/player > autoencode.sh

	sudo echo "sudo /bin/bash /home/pi/autoencode.sh &
	 \n stop0" > /etc/rc.local

	echo "Done installing, rebooting..."

	sleep 10

	sudo reboot
fi
