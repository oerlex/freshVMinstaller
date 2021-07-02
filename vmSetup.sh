#!/bin/bash

#Clone my repo
#cd
#git clone https://github.com/oerlex/freshVMinstaller.git


#Clean up
sudo rm -r /usr/local/go
rm -r ~/programs
sed -i '/usr\/local\/go\/bin/d' ~/.profile
tail -n 4 ~/.profile
sudo dpkg -r atom

mkdir ~/programs
cd ~/programs

# Install Package Manager
sudo apt-get update
sudo apt-get upgrade
sudo apt install python3-pip
sudo apt install snap


# Install Go
wget https://golang.org/dl/go1.15.6.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.15.6.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile
source ~/.profile
go version

# Install ffuf
go get -u github.com/ffuf/ffuf
sudo cp ~/go/bin/ffuf /opt/

# Install atom
curl -s https://api.github.com/repos/atom/atom/releases/latest \
| grep "browser_download_url.*deb" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
sudo dpkg -i atom*.deb

# Install tmux
sudo apt install tmux
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp ~/freshVMinstaller/.tmux.conf ~/.tmux.conf
cp ~/freshVMinstaller/.tmux.conf.local  ~/.tmux.conf.local
tmux source-file ~/.tmux.conf

# Install MobSF
git clone https://github.com/MobSF/Mobile-Security-Framework-MobSF.git
Mobile-Security-Framework-MobSF/setup.sh


# Install Android Studio
sudo snap install --classic android-studio


# Install frida+objection
pip3 install frida-tools
pip3 install objection


# Modern Unix

apt install exa


# Not workin 100%
curl -s https://api.github.com/repos/Peltoche/lsd/releases/latest \
| grep "browser_download_url*/lsd_*amd64.*deb" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

apt install npm -y
npm install -g tldr
apt install fd-find
apt install httpie

# Not workin 100%
curl -s https://api.github.com/rs/curlie/releases/latest \
| grep "browser_download_url*/curlie_*/1.6.0_linux_amd64.*deb" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

# Not working 100%
curl -s https://api.github.com/ogham/dog/releases//latest \
| grep "browser_download_url*/dog-/*-unknown-linux-gnu.zip" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

