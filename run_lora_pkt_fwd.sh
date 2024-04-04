#!/bin/sh

# Linxdot opensource: 
# Main purpose: to call the lora_pkt_fwd runtime in backgrond;
# By Louis Chuang 2024-04-04.

if [ -z "$1" ]
then

      echo "the parameter is empty use default"
      region="AS923_1"
else
      echo "the regions is $1"
      region=$1
fi

cd /etc/lora
lora_pkt_fwd -c /etc/lora/global_conf.json.sx1250.$region > /var/log/lora_pkt_fwd.log 2>&1 &

while [ true ]; do

    echo 1 > /sys/devices/platform/leds/leds/work-led1/brightness
    echo 1 > /sys/devices/platform/leds/leds/work-led2/brightness  
    sleep 1
    echo 0 > /sys/devices/platform/leds/leds/work-led1/brightness
    echo 1 > /sys/devices/platform/leds/leds/work-led2/brightness 
    sleep 1

done

exit 0
