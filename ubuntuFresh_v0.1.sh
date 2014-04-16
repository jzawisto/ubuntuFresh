#!/bin/bash

cores='grep -c ^processor /proc/cpuinfo'
ver='0.1'

green='\e[1;32m' # '\e[1;32m' is too bright for white bg.
blue='\e[1;34m'
endColor='\e[0m'

arch=$(uname -m)
if [ "$arch" == "i686" -o "$arch" == "i386" -o "$arch" == "i486" -o "$arch" == "i586" ]; then
flag=1
else
flag=0
fi

echo -e "${blue}#######################################################################"
echo -e "## Installation script for useful packages called ubuntuFresh        ##"
echo -e "## by jzawisto                                                       ##"
echo -e "#######################################################################${endColor}"

echo "Update repository before starting installing software...."
sudo apt-get update
echo -e "Update repository before starting installing software...${green}[OK]${endColor}"


echo "${blue}#######################################################################"
echo "## Installing packages: basic_tools                                 ##"
echo "#######################################################################${endColor}"
sudo apt-get -y install htop rar unrar lm-sensors mc vnstat vlc \\ 
                        qnapi synaptic whois traceroute tilda gedit \\
                        ufw gufw
                        
                        
# developers_packages
echo "${blue}#######################################################################"
echo "## Installing packages: developers tools                            ##"
echo "#######################################################################${endColor}"

sudo apt-get -y install build-essential make qmake  
sudo apt-get -y build-dep eclipse-cdt 
#if eclipse_4.2 then wget dropbox/eclipse....



echo "${blue}#######################################################################"
echo "## Installing packages: additional packages from PPA's             ##"
echo "#######################################################################${endColor}"
# FLUX  
sudo add-apt-repository -y ppa:kilian/f.lux 
# SPOTIFY 
sudo add-apt-repository -y "deb http://repository.spotify.com stable non-free"
# recent-notification indicator
sudo add-apt-repository -y ppa:jconti/recent-notifications
# misc indicators
sudo add-apt-repository -y ppa:noobslab/indicators
# my-weather-indicator
sudo add-apt-repository -y ppa:atareao/atareao

# update for refresh repo (new packages from ppa's)
sudo apt-get update

# installing packages from ppa's
sudo apt-get -y install spotify-client fluxgui indicator-notifications recent-notifications \\
                        indicator-brightness indicator-sensors lm-sensors my-weather-indicator \\ 
                        indicator-sysmonitor indicator-cpufreq
                        
echo "${blue}#######################################################################"
echo "## Installing packages: LaTeX dependencies and TeXmaker env.  ##"
echo "#######################################################################${endColor}"

sudo apt-get install texmaker texlive-extras


echo "${blue}#######################################################################"
echo "## Installing packages: Google Chrome                         ##"
echo "#######################################################################${endColor}"

cd && cd /Downloads && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb


echo "${blue}#######################################################################"
echo "## Installing packages: Kingsoft Office                       ##"
echo "#######################################################################${endColor}"

wget http://kdl.cc.ksosoft.com/wps-community/kingsoft-office_9.1.0.4280~a12p4_i386.deb 
sudo dpkg -i kingsoft-office*.deb

echo "${blue}#######################################################################"
echo "## Installing packages: TeamViewer (non-comercial use)        ##"
echo "#######################################################################${endColor}"
wget http://download.teamviewer.com/download/teamviewer_linux.deb
sudo dpkg -i teamviewer_linux.deb

