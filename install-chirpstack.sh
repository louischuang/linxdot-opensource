#!/bin/sh

# Linxdot opensource: 
# Main purpose: to install chirpstack service in the LD1001/LD1002 hotspot.
# By Louis Chuang 2024-04-04.

#step 1 : check the repo of chirpstack is available and install!

system_dir="/mnt/opensource-system"

echo "stap 1: check the chirpstack directory is exist and install it!"

if [ ! -d "$system_dir" ]; then
    # the service florder is not exists!
    echo "-------- 1. the system directory($system_dir) is not exist and created."
    mkdir $system_dir
fi

cd $system_dir

if [ ! -d "$system_dir/chirpstack-docker" ]; then
    # the chripstack is not in the florder;
     echo "-------- 2. clone the repository from github."
    git clone https://github.com/louischuang/chirpstack-docker.git
fi

cd chirpstack-docker

echo "stap 1: the chirpstack installstation is completed."
echo "stap 2: check the chirpstack to see if it is started"

#step 2 : check the service if it is available.

service_file="/etc/init.d/linxdot-chripstack-service"

if [ ! -f "$service_file" ]; then

    # the service file is not exist!
   echo "-------- 2. the service is not installed. To create it."
   echo "#!/bin/sh /etc/rc.common
    START=99

    start() {

        logger -t "try to start chirpstack service...."
        cd $system_dir/chirpstack-docker
        docker-compose up -d --remove-orphans
        logger -t "call chirpstack 'docker-compose up -d'  is ok, please check the docker compose"
    }

    stop(){
        :
    } 
   " > $service_file

    chmod +x $service_file
    $service_file enable

    $service_file start

fi

echo "stap 2: completed installed and running the service!"

