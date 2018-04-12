#!/bin/bash
# Websploit Framework Installation Script
# Created By Fardin Allahverdinazhand
# Report Bug : 0x0ptim0us@gmail.com
if [[ $EUID -ne 0 ]]; then
   echo "You must be root to run this script. Aborting...";
   exit 1;
fi
echo "Welcome To Websploit Framework Install Script"
echo "Installing ..."
sleep 3
cp wsf-201.tar.gz /opt
cd /opt
tar -xf wsf-201.tar.gz
chmod 755 /opt/wsf/*
chmod 755 /opt/wsf/modules*
chmod 755 /opt/wsf/modules/fakeupdate/*
chmod 755 /opt/wsf/modules/fakeap/*
chmod 755 /opt/wsf/core/*
ln -s /opt/wsf/wsfconsole /usr/bin/wsfconsole
rm -rf /opt/wsf-201.tar.gz
echo "Installed Directory : /opt/wsf"
echo "Run From Terminal : sudo wsfconsole"
echo "Installation Complete."
