#!/bin/sh

# Linxdot opensource: 
# Main purpose: to install and start lora_pkd_fwd in serves after background;
# By Louis Chuang 2024-04-04.

region="AS923_1"

service_file="/etc/init.d/linxdot-lora-pkt-fwd"

if [ ! -f "$service_file" ]; then

    # the service file is not exist!
   echo "-------- 2. the service is not installed. To create it."
   echo "#!/bin/sh /etc/rc.common
    
    START=99
    USE_PROCD=8999

    thisRegion=$region

   start_service() {

        logger -t "starting lora_pkt_fwd service!...."
        procd_open_instance
        procd_set_param command "/etc/linxdot-opensource/run_lora_pkt_fwd.sh" \$thisRegion
        procd_set_param respawn
        procd_close_instance

        logger -t "ora_pkt_fwd service started!"
    }

   " > $service_file

    chmod +x $service_file
    $service_file enable

    $service_file start

fi
