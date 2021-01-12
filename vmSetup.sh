#!/bin/bash

#Clone my repo
cd
git clone https://github.com/oerlex/myTmuxConfig.git


#Clean up
sudo rm -r /usr/local/go
rm -r ~/programs
sed -i '/usr\/local\/go\/bin/d' ~/.profile
tail -n 4 ~/.profile
sudo dpkg -r atom

mkdir ~/programs
cd ~/programs

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
cp ~/myTmuxConfig/.tmux.conf ~/.tmux.conf
cp ~/myTmuxConfig/.tmux.conf.local  ~/.tmux.conf.local
