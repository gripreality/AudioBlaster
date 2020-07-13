# AudioBlaster
AudioTx and AudioRx system for streaming an audio input from one raspberry pi to another. Use case, vintage record player connected to Sonos system via wifi in another room.

## Description:
2 Unit system to transmit audio from an analog input in a remote room to a Sonos Entertainment System. I was able to find many Bluetooth tx/rx units that would in theory acomplish what I needed, but they lacked the range required to send the input signal to the room in which the Sonos System lived. Before landing on the present solution I tried a point to point bluetooth system and a 5.8GHz A/V tx/rx system. In order to finally solve this problem I landed on two Raspberry Pi units. One acting as a RTMP Server (Host) and the other acting as a remote encoder (Client). I have lots of experience in livestreaming so using the same base system to stream audio only made sense.\
  The AudioRx (Host) unit is running NGINX with the LIBNGINX-MOD-RTMP as well as FFMPEG to play the output being streamed to the unit. \
  The AudioTx (Client) unit is running FFMPEG attached to the USB Sound Card to act as a very basic Encoder. This system is doing a real-time encode and sending it to the Host. 

## Required Hardware:
  2x Raspberry Pi 3 B+\
  1x Sabrent AU-MMSA USB 2.0 Sound Card\
  
## Install:
  All you need to do to install this system is download the install.sh script and follow the directions. It will do most of the work for you. You will need to know the IP address of your AudioRx system. It is best to set this to a Fixed IP address. This will prevent the system from loosing connection if the DHCP does not assign the same IP address all the time.\
  
Hope this is helpful!\

If anyone has any questions feel free to drop me a line.\

Louis@baraqu.com
