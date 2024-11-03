#!/bin/bash
# Upgrade and Update script adding i3 and tools
# Author: Jay

whoami > /tmp/who
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
sudo mkdir -p /tmp/toolsInstall

# Making dirs in /opt
sudo mkdir -p /opt/tools
sudo mkdir -p /opt/programs
# Update and Upgrade

sudo apt-get update && sudo apt full-upgrade -y

# Installing i3 and other tools (can add more)
echo "Installing i3 tile manager and some Goodies!!"
sudo apt-get install -y wget curl git thunar cmake 
sudo apt-get install -y arandr flameshot arc-theme feh i3blocks i3status i3 i3-wm lxappearance python3-pip rofi unclutter cargo compton papirus-icon-theme imagemagick
sudo apt-get install -y libxcb-shape0-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev autoconf meson
sudo apt-get install -y libxcb-render-util0-dev libxcb-shape0-dev libxcb-xfixes0-dev
sudo apt-get install -y cifs-utils netexec neo4j nfs-common krb5-user freerdp2-x11 ftp ffuf rlwrap exploitdb
sudo npm install -g tldr

# Github Repos
sudo wget -q https://github.com/AlessandroZ/LaZagne/releases/download/v2.4.6/LaZagne.exe -P /usr/share/windows-resources/binaries
sudo wget -q https://github.com/SnaffCon/Snaffler/releases/download/1.0.170/Snaffler.exe -P /usr/share/windows-resources/binaries
sudo wget -q https://github.com/TheWover/donut/releases/download/v1.0/donut_v1.0.tar.gz -P /tmp/toolsInstall
sudo mv /tmp/toolsInstall/donut/donut /opt/programs && sudo chmod +x /opt/programs/donut
sudo git clone https://github.com/XiaoliChan/LDAPShell.git /opt/tools
sudo ln -s /opt/tools/LDAPShell/ldapshell.py /opt/programs/ldapshell
sudo wget -q https://github.com/flozz/p0wny-shell/raw/refs/heads/master/shell.php -P /opt/tools
sudo wget -q https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64 -P /opt/programs
sudo mv /opt/programs/kerbrute_linux_amd64 /opt/programs/kerbrute && sudo chmod +x /opt/programs/kerbrute
sudo wget -q https://github.com/BloodHoundAD/BloodHound/releases/download/v4.3.1/BloodHound-linux-x64.zip -P /opt/tools
sudo mv /tmp/toolsInstall/BloodHound-linux-x64 /opt/tools
sudo ln -s /opt/tools/BloodHound-linux-x64/BloodHound /opt/programs/BloodHound
sudo git clone https://github.com/urbanadventurer/username-anarchy.git /opt/tools
sudo ln -s /opt/tools/username-anarchy/username-anarchy /opt/programs
sudo git clone https://github.com/NetSPI/PowerUpSQL.git /opt/tools
sudo wget -q https://github.com/projectdiscovery/nuclei/releases/download/v3.3.4/nuclei_3.3.4_linux_amd64.zip -P /tmp/Install
sudo mv /tmp/Install/nuclei /opt/programs
sudo chmod +x /opt/programs/nuclei
sudo -q wget https://github.com/projectdiscovery/katana/releases/download/v1.1.0/katana_1.1.0_linux_amd64.zip -P /opt/Install
sudo mv /opt/Install/katana /opt/programs
sudo chmod +x /opt/programs/katana
sudo wget -q https://github.com/nicocha30/ligolo-ng/releases/download/v0.6.2/ligolo-ng_agent_0.6.2_linux_amd64.tar.gz -P /opt/tools/ligolo
sudo wget -q https://github.com/nicocha30/ligolo-ng/releases/download/v0.6.2/ligolo-ng_proxy_0.6.2_linux_amd64.tar.gz -P /opt/tools/ligolo
sudo wget -q https://github.com/nicocha30/ligolo-ng/releases/download/v0.6.2/ligolo-ng_agent_0.6.2_windows_amd64.zip -P /opt/tools/ligolo/windows
sudo wget -q https://github.com/nicocha30/ligolo-ng/releases/download/v0.6.2/ligolo-ng_proxy_0.6.2_windows_amd64.zip -P /opt/tools/windows

# Installing pipx
echo "Installing pipx and breaking system packages to do it"
python3 -m pip install --user pipx --break-system-packages
pipx ensurepath

# Installing via pipx
pipx install bloodhound-python
pipx install 'git+https://github.com/ScorpionesLabs/MSSqlPwner.git'

# Nano Syntax Highlighting
echo -n "include /usr/share/nano/*.nanorc" > ~/.nanorc

# Add to Path
echo "Adding Path"
echo "export PATH=$PATH:/opt/programs" | tee -a /home/
source /home/$(cat /tmp/who)/.zshrc

# Summary
echo -n "All upgraded and i3 added, best to do a reboot, then log in using i3 as your destkop env, to open a term use either Option+Enter or WindowsKey+Enter"
echo -n "You dont have to use i3, you can still use any other env"
echo -n "Happy Hacking"
