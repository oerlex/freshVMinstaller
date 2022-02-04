#!/bin/bash

# This is for Debian 64bit systems

#Clean up
sudo rm -r /usr/local/go
rm -r ~/programs
sed -i '/usr\/local\/go\/bin/d' ~/.profile
tail -n 4 ~/.profile
sudo dpkg -r atom

# Most prorams gonna be installed here
mkdir ~/programs
cd ~/programs

# Install Package Manager
sudo apt-get update
sudo apt-get upgrade
sudo apt install python3-pip
sudo apt install snap

#### Language Support

# Install Go
#TODO Latest version
wget https://golang.org/dl/go1.17.6.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.17.6.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile
source ~/.profile
go version

# Misc
sudo apt install socat
sudo apt install nmap
python3 -m pip install semgrep
sudo apt install wireshark
# Install ffuf
go get -u github.com/ffuf/ffuf
sudo cp ~/go/bin/ffuf /opt/

# Install tmux
sudo apt install tmux
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp ~/freshVMinstaller/.tmux.conf ~/.tmux.conf
cp ~/freshVMinstaller/.tmux.conf.local  ~/.tmux.conf.local
tmux source-file ~/.tmux.conf


##### Code Auditing
# CodeQL
mkdir ~/codeql-home
cd ~/codeql-home
DOWNLOAD_URL=$(curl -s https://api.github.com/repos/github/codeql-cli-binaries/releases/latest \
        | grep browser_download_url \
        | grep codeql-linux64.zip \
        | cut -d '"' -f 4)
curl -s -L -o ./codeql-latest.zip "$DOWNLOAD_URL"
unzip codeql-latest.zip
git clone https://github.com/github/codeql
mv codeql codeql-repo
cd ~/programs


##### Reversing
# GHIDRA
DOWNLOAD_URL=$(curl -s https://api.github.com/repos/NationalSecurityAgency/ghidra/releases/latest \
        | grep browser_download_url \
        | grep ghidra-latest.zip \
        | cut -d '"' -f 4)
curl -s -L -o ./ghidra-latest.zip "$DOWNLOAD_URL"

##### EDITORS

# Install atom
wget https://atom.io/download/deb
sudo dpkg -i atom-amd64.deb

# VSCode
TEMP_DEB="$(mktemp)" &&
wget -O "$TEMP_DEB" 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' &&
sudo dpkg -i "$TEMP_DEB"
rm -f "$TEMP_DEB"









##### Mobile
#  Android Studio
#sudo snap install --classic android-studio


# Install MobSF
#git clone https://github.com/MobSF/Mobile-Security-Framework-MobSF.git
#Mobile-Security-Framework-MobSF/setup.sh


# Install frida+objection
pip3 install frida-tools
pip3 install objection


# SecLists
cd /opt
git clone https://github.com/danielmiessler/SecLists.git


##### Windows / AD / Powershell

# Install Bloodhound
sudo apt install bloodhound


# Powersploit & PSTools
cd /opt/
https://github.com/PowerShellMafia/PowerSploit.git
mkdir PSTools
cd PSTools
wget https://download.sysinternals.com/files/PSTools.zip
unzip PSTools.zip


# impacket
curl -s https://api.github.com/repos/SecureAuthCorp/impacket/releases/latest \
| grep "browser_download_url.*tar.gz" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
