# SSH SETUP ON LINUX MCU
# SPECIFICALLY, KALIPi
######

#### OPTION 1
	sudo apt-get install openssh-server -y
	
# Configure SSH to run on persistently. In other words survive a reboot. First remove run levels for SSH
	update-rc.d -f ssh remove

# load the default SSH run level
	update-rc.d -f ssh defaults

#	Backup and move default Kali Linux Keys
	cd /etc/ssh/
	mkdir insecure_original_default_kali_keys
	mv ssh_host_* insecure_original_default_kali_keys/ 

# Create new keys
	dpkg-reconfigure openssh-server

# make sure SSH service always restarts on reboot in Kali Linux
	update-rc.d -f ssh enable 2 3 4 5

	
###### OPTIONAL 
#### ALLOW ROOT SSH LOGIN --- ACHTUNG, VERY DANGEROUS!
# Root login via SSH on Kali

#		By default in Kali 2.0 root login in disabled thru SSH. If you want to SSH in thru root (which has tons of security risks) you will need to do the following:
##### edit .... /etc/ssh/sshd_config, change:
####								PermitRootLogin without-password
			### TO					PermitRootLogin yes
			#### RESTART SSH		sudo service ssh restart

			
			
			
			###
			###
	### 		the alternate way...
	
sudo apt-get install ssh -y
	# start daemon
sudo /etc/init.d/ssh start
	# start at boot
sudo update-rc.d ssh defaults



###!!!! FIND YOUR IP CONFIG INFO USING....
/sbin/ifconfig 
#####!!!!!!		 shows a list of processes running on your pi...
ps ax