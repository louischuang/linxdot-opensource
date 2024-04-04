# linxdot-opensource

This repository is used for install and setup the lorawan services and chirpstacks in Linxdot LD1001/1002 hotspots. We will release some install and running scripts there. Also we would update the new information hers.

##Special Note:##

If you want to use the opensource project on the linxdot LD1001/LD1002 hotspots, you would **LOST** all features of Helium mining progress. It can't be reversed to helium hotspots.Please make sure you want to do that.

Also, This is **volunteer** job and we do not promise everything and you have to take the responsibility by yourself to make suee the hotspot is running well. Of course, we could share the experience on the linxdot-opensouce projects.

OK, let's all. Enjoy yourself!

## Quick start:

If you decide to flash your linxdot LD1001/1002 hotspots to a opensource hotspot. Please download those 2 files in the website:

1. Linxdot fladh image tool (only running in windows environment.)
   
  https://linxdot-opensource.v7idea.com/sdk/Linxdot-Factory-tool-Installer.zip
  
2. linxdot opensource image file(current version is 1.0.2): 

  https://linxdot-opensource.v7idea.com/images/linxdot-opensource-image-1.0.2.tar.gz


## Install the script:

   # Packaged after 1.0.2 images:
   
   If you have flash the linxdot image after version 1.0.2. This repository. Please use the follow the step to enable the features:
   1. use 'cd /etc/linxdot-opensource' into /etc/linxdot-opensouce directory.
   2. run the script './install-chirpstack.sh' to install chirpstack and enable the services.
   3. run the script './install-lora-pkd-fwd.sh' to install the lora_pkt_fwd run time service.

   # Clone this repo and manually install:

   1. use ssh login into the hotspot. The default user is root. default password: linxdot.
   2. use 'cd /etc' goto /etc directory.
   3. use 'git clone https://github.com/louischuang/linxdot-opensource.git' clone this repository in /etc directory.
   4. use 'cd linxdot-opensource' into /etc/linxdot-opensource directory.
   5. run the script './install-chirpstack.sh' to install chirpstack and enable the services.
   6. run the script './install-lora-pkd-fwd.sh' to install the lora_pkt_fwd run time service.

   After you completed everything, please reboot the hotspot.

## HOW TO CHECK THE SERVICE

1. Please use the 'docker ps' to check the chirpstack service is ready.
2. Please use the 'ps | grep lora_pkt_fwd' to see the lora_pkt_fwd is running in backend.
