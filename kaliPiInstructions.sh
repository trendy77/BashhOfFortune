# see https://whitedome.com.au/re4son/re4son-kernel/
#   clone the firmware repo from raspberry pi
git clone https://github.com/raspberrypi/firmware
# find partition on the card with type Windows_FAT_32 (for you it looks like its disk2s1)
fdisk -l
# mount the partition
mkdir /mnt/boot
mount /dev/disk2s1 /mnt/boot
# copy the contents of the boot folder to the mounted boot partition
cp -r firmware/boot/* /mnt/boot/
# unmount and cleanup 
unmount /mnt/boot
rmdir /mnt/boot
rm -rf firmware




#kalipi config
apt install whiptail parted lua5.1 alsa-utils psmisc
wget -O /usr/local/bin/kalipi-config https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/kalipi-config/kalipi-config
chmod 755 /usr/local/bin/kalipi-config


#### CHOOSE ONE OF THE BELOW ####
## For current stable
wget  -O re4son-kernel_current.tar.xz https://whitedome.com.au/re4son/downloads/11299/
tar -xJf re4son-kernel_current.tar.xz
## For old stable
wget -O re4son-kernel_old.tar.xz https://whitedome.com.au/re4son/downloads/12009/
tar -xJf re4son-kernel_old.tar.xz
## For next
wget -O re4son-kernel_next.tar.xz https://whitedome.com.au/re4son/downloads/12933/
tar -xJf re4son-kernel_next.tar.xz


cd re4son-kernel_4*
./install.sh

For Raspberry Pi 3 and Pi Zero W:
– Press “Y” when prompted to install bluetooth and wifi drivers (not required on Raspbian)
– Say “Y” when prompted to enable bluetooth services (you can still disable it later)
– reboot
Bluetooth

There aren’t any issues with Bluetooth but if you want to de-install or re-install the drivers just type:

## Remove Bluetooth:
cd /usr/local/src/re4son-kernel_4*
./install.sh -r
## Re-install Bluetooth:
./install.sh -b

Kernel Headers
You will be offered to install the headers during the kernel installation.
To install them later manually , run the installer again like this:

cd /usr/local/src/re4son-kernel_4*
./install.sh -e



