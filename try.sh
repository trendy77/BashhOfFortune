#!/bin/bash
# for linux client:
if [ -z "$1" ]; then 
	echo "Usage: $0 <ip-of-proxy> <name-of-user(optional)>"
	exit
fi
IP=$1
NAME=$2
SRCD="/mnt/w/Documents/tPhischer"
TGTD="/mnt/c/Users/trend/BashBackups/"
OF=$SRCD-$(date +%Y%m%d).tgz
tar -cZf $TGTD$OF $SRCD
# USAGE:
# ./try.sh $IPOFPROXY $NAME(DAN) 
if [ -z "$2" ]; then
	NAME=dan
fi
echo "CLIENT SETUP - LINUX"
echo "IP of proxy is $1 and username will be $NAME"
read -p"shall we? Y/N?" RESP
if [ "$RESP" = "y" ]; then
	goClient
fi
if [ "$RESP" = "y" ]; then
	echo "cool"
	exit
fi
function setupNew{
	echo "checkin for System Updates.."
	sleep 1
	sudo apt-get update && sudo apt-get upgrade -y
	sleep 1
	cd ~/Documents
	cd ~/Documents/tunnel/algo-master
	echo "Installing Dependancies..."
	sudo apt-get install build-essential libssl-dev libffi-dev python-dev python-pip python-setuptools python-virtualenv -y
	echo "Setting up the VirtualEnv"
	sleep 1
	sudo python -m virtualenv env && source env/bin/activate && python -m pip install -U pip && python -m pip install -r requirements.txt
	sudo apt-get update -y
	echo "Installing Ansible Deployment Options"
	sudo apt-get install software-properties-common -y
	sudo apt-add-repository ppa:ansible/ansible
	sudo apt-get install ansible -y
	sudo chmod +x ./algo
	# SSH NEEDED?
	# ssh-keygen
	# cat ~/.ssh/id_rsa.pub
	# sleep 1
	#	./algo
	read -p"What should we name the server?" SERVN
	REGION=australia-southeast1-a
	ansible-playbook deploy.yml -t gce,ssh_tunneling,vpn,cloud -e 'credentials_file=./algo/dc11.json gce_server_name=$SERVN ssh_public_key=./algo/configs/algo.pem.pub zone=$REGION'
# OR ... 	ansible-playbook deploy.yml -t gce,ssh_tunneling,vpn,cloud -e 'credentials_file=./algo/dc11.json gce_server_name=$SERVN zone=$REGION'
	}

function goClient{
echo "checkin for System Updates.."
sudo apt-get update && sudo apt-get upgrade -y
sleep 1
cd ~/Documents/algo
sudo apt-get update -y
echo "Installing Ansible Deployment Options"
sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get install ansible -y
sudo chmod +x ./algo
sudo chmod +x ./ansible-playbook
ansible-playbook deploy_client.yml -e 'client_ip=localhost vpn_user=$NAME server_ip=$IP ssh_user=$NAME'
# or ?
# ansible-playbook deploy_client.yml -e 'client_ip=localhost vpn_user=$NAME server_ip=$IP ssh_user=ubuntu'
sudo apt-get install strongswan strongswan-plugin-openssl -y
sudo cp ./configs/$IP/pki/certs/$NAME.crt /etc/ipsec.d/certs
sudo cp ./configs/$IP/pki/private/$NAME.key /etc/ipsec.d/private
sudo cp ./configs/$IP/pki/cacert.pem /etc/ipsec.d/cacerts
sudo cat ./configs/$IP/pki/private/$NAME.key >> /etc/ipsec.secrets
sudo cat ipsec_$NAME.conf >> /etc/ipsec.conf
# Let your server access your local LAN without going through the VPN. ADD to /etc/ipsec.conf
PASS="conn lan-passthrough
leftsubnet=10.0.77.0/24
rightsubnet=10.0.77.0/24 
authby=never
type=pass
auto=route"
sudo cat $PASS >> /etc/ipsec.conf

sudo ipsec restart 		# pick up config changes
echo "Client Installation Complete."
read -p"launch?" REP
if [ "$REP" -ne "y" ]; then 
	exit
fi
launch
}

function launch{
sudo ipsec up $CONN
ssh -D 127.0.0.1:1080 -f -q -C -N $NAME@$IP -i configs/$IP/$NAME.ssh.pem
}