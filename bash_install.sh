#!/bin/bash
# Upgrade and Update adding tools
# Author: Jay


whoami > /tmp/who
echo "SET FOR RUNNING AS ROOT (CHANGE IF NEEDED) You will be able to abort"
echo "IF YOUR USING PARROT OS IGNORE OTHERWISE"
echo "Ensure your /etc/apt/sources.list.d/parrot.list has the lines uncommented"
echo "----"
echo "deb https://deb.parrot.sh/parrot lory main contrib non-free non-free-firmware"
echo "deb https://deb.parrot.sh/direct/parrot lory-security main contrib non-free non-free-firmware"
echo "----"
echo "Also comment out Backports as were not worried about bleeding edge features"
echo "----"
echo "deb https://deb.parrot.sh/parrot lory-backports main contrib non-free non-free-firmware"
echo " "
echo "You have 10 seconds to quit if you need to do this, if not, update and upgrade will commence"
sleep 10
echo "Making your tools and programs dirs in /opt"

# Making tmp dir
sudo mkdir -p /tmp/Install

# Making dirs in /opt
sudo mkdir -p /opt/tools
sudo mkdir -p /opt/programs
sudo mkdir -p /opt/tools/ligolo/windows

# Update and Upgrade

sudo apt-get update && sudo apt full-upgrade -y

# Installing other tools (can add more)
echo -n "Installing some Goodies!!"
sudo apt-get install -y wget curl git thunar cmake npm feroxbuster seclists jq
sudo apt-get install -y flameshot feh python3-pip unclutter cargo imagemagick
sudo apt-get install -y cifs-utils netexec neo4j nfs-common krb5-user freerdp2-x11 ftp ffuf rlwrap exploitdb
sudo npm install -g tldr

# Github Repos and Things
sudo wget -q https://github.com/AlessandroZ/LaZagne/releases/download/v2.4.6/LaZagne.exe -P /usr/share/windows-resources/binaries
sudo wget -q https://github.com/SnaffCon/Snaffler/releases/download/1.0.170/Snaffler.exe -P /usr/share/windows-resources/binaries
sudo wget -q https://github.com/TheWover/donut/releases/download/v1.0/donut_v1.0.tar.gz -P /tmp/Install 
sudo tar xzf /tmp/Install/donut_v1.0.tar.gz
sudo mv /tmp/Install/donut /opt/programs && sudo chmod +x /opt/programs/donut
sudo git clone https://github.com/XiaoliChan/LDAPShell.git /opt/tools/
sudo ln -s /opt/tools/LDAPShell/ldapshell.py /opt/programs/
sudo wget -q https://github.com/flozz/p0wny-shell/raw/refs/heads/master/shell.php -P /opt/tools/
sudo wget -q https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64 -P /opt/programs/
sudo mv /opt/programs/kerbrute_linux_amd64 /opt/programs/kerbrute && sudo chmod +x /opt/programs/kerbrute
sudo wget -q https://github.com/BloodHoundAD/BloodHound/releases/download/v4.3.1/BloodHound-linux-x64.zip -P /tmp/Install 
sudo unzip /tmp/Install/BloodHound-linux-x64.zip
sudo mv /tmp/Install/BloodHound-linux-x64 /opt/tools/
sudo ln -s /opt/tools/BloodHound-linux-x64/BloodHound /opt/programs/BloodHound
sudo git clone https://github.com/urbanadventurer/username-anarchy.git /opt/tools/
sudo ln -s /opt/tools/username-anarchy/username-anarchy /opt/programs/
sudo git clone https://github.com/NetSPI/PowerUpSQL.git /opt/tools/
sudo wget -q https://github.com/projectdiscovery/nuclei/releases/download/v3.3.4/nuclei_3.3.4_linux_amd64.zip -P /tmp/Install/
sudo mv /tmp/Install/nuclei_3.3.4_linux_amd64/nuclei /opt/programs
sudo chmod +x /opt/programs/nuclei
sudo wget -q https://github.com/projectdiscovery/katana/releases/download/v1.1.0/katana_1.1.0_linux_amd64.zip -P /opt/Install/
sudo mv /opt/Install/katana_1.1.0_linux_amd64/katana /opt/programs/
sudo chmod +x /opt/programs/katana
sudo wget -q https://github.com/nicocha30/ligolo-ng/releases/download/v0.6.2/ligolo-ng_agent_0.6.2_linux_amd64.tar.gz -P /opt/tools/ligolo
sudo wget -q https://github.com/nicocha30/ligolo-ng/releases/download/v0.6.2/ligolo-ng_proxy_0.6.2_linux_amd64.tar.gz -P /opt/tools/ligolo
sudo wget -q https://github.com/nicocha30/ligolo-ng/releases/download/v0.6.2/ligolo-ng_agent_0.6.2_windows_amd64.zip -P /opt/tools/ligolo/windows
sudo wget -q https://github.com/nicocha30/ligolo-ng/releases/download/v0.6.2/ligolo-ng_proxy_0.6.2_windows_amd64.zip -P /opt/tools/ligolo/windows

# Nano Syntax Highlighting
echo "include /usr/share/nano/*.nanorc" > ~/.nanorc

# Add to Path
echo "Adding Path"
#echo "export PATH=$PATH:/opt/programs" >> /home/$(cat /tmp/who)/.zshrc
echo "export PATH=$PATH:/opt/programs" >> /root/.zshrc #if running as root
source /home/$(cat /tmp/who/)/.zshrc
source /root/.zshrc

# Summary
echo "All upgraded"
echo "Happy Hacking"
