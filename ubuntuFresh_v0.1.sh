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

echo -e "Update repository before starting installing software...."
sudo apt-get update
echo -e "Update repository before starting installing software...${green}[OK]${endColor}"


echo -e "${blue}#######################################################################"
echo -e "## Installing packages: basic_tools                                  ##"
echo -e "#######################################################################${endColor}"
sudo apt-get -y install htop rar unrar lm-sensors mc vnstat vlc \
                        qnapi synaptic whois traceroute tilda gedit \
                        ufw gufw unetbootin
                        
# Compression/Decompression tools
sudo apt-get -y install p7zip-rar p7zip-full unace unrar zip unzip sharutils \
				rar uudeview mpack arj cabextract file-roller
                        
# developers_packages
echo -e "${blue}#######################################################################"
echo -e "## Installing packages: developers tools                             ##"
echo -e "#######################################################################${endColor}"

sudo apt-get -y install build-essential make git
sudo apt-get -y build-dep eclipse-cdt 
#if eclipse_4.2 then wget dropbox/eclipse....



echo -e "${blue}#######################################################################"
echo -e "## Installing packages: additional packages from PPA's               ##"
echo -e "#######################################################################${endColor}"
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
# netspeed indicator
sudo add-apt-repository -y ppa:nilarimogard/webupd8


# update for refresh repo (new packages from ppa's)
sudo apt-get update

echo 'Please wait...' && sudo apt-get update 2> klucze > /dev/null && sed -i '/NO_PUBKEY/!d;s/.*NO_PUBKEY //' klucze && gpg --keyserver keyserver.ubuntu.com --recv-keys $(cat klucze) && gpg --export --armor $(cat klucze) | sudo apt-key add - && rm -f klucze

# installing packages from ppa's
sudo apt-get -y install spotify-client fluxgui indicator-notifications recent-notifications \
                        indicator-brightness indicator-sensors lm-sensors my-weather-indicator \
                        indicator-sysmonitor indicator-cpufreq
sudo apt-get -y install indicator-netspeed

indicator-notifications&
indicator-netspeed&
indicator-brightness&
indicator-sensors& 
my-weather-indicator&
indicator-cpufreq&


#echo -e "${blue}#######################################################################"
#echo -e "## Installing packages: LaTeX dependencies and TeXmaker env.         ##"
#echo -e "#######################################################################${endColor}"
#sudo apt-get install texmaker texlive-extras


echo -e "${blue}#######################################################################"
echo -e "## Installing packages: Google Chrome                                ##"
echo -e "#######################################################################${endColor}"

cd && cd Downloads && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

echo -e "${blue}#######################################################################"
echo -e "## Installing packages: Kingsoft Office                              ##"
echo -e "#######################################################################${endColor}"

wget http://kdl.cc.ksosoft.com/wps-community/kingsoft-office_9.1.0.4280~a12p4_i386.deb 
sudo dpkg -i kingsoft-office*.deb
rm kingsoft-office*.deb

echo -e "${blue}#######################################################################"
echo -e "## Installing packages: TeamViewer (non-comercial use)               ##"
echo -e "#######################################################################${endColor}"
wget http://download.teamviewer.com/download/teamviewer_linux.deb
sudo dpkg -i teamviewer_linux.deb

echo -e "${blue}#######################################################################"
echo -e "## Installing packages: Android Tools                                ##"
echo -e "#######################################################################${endColor}"
sudo add-apt-repository -y ppa:nilarimogard/webupd8
sudo apt-get update
sudo apt-get install android-tools-adb android-tools-fastboot

sudo apt-get -y -f install

#for enable minimize on click
sudo apt-get install compizconfig-settings-manager

#google drive support (not working well)
#sudo add-apt-repository -y ppa:alessandro-strada/ppa
#sudo apt-get update
#sudo apt-get -y install google-drive-ocamlfuse
#google-drive-ocamlfuse
#mkdir ~/gdrive
#google-drive-ocamlfuse ~/gdrive



# Nemo file manager 
# ====================================
#sudo add-apt-repository -y ppa:webupd8team/nemo
#sudo apt-get update
#sudo apt-get -y install nemo nemo-fileroller nemo-compare nemo-dropbox \
#				nemo-media-columns nemo-pastebin nemo-seahorse nemo-share

#configurable NotifyOSD notifications in Ubuntu 14.04
#sudo add-apt-repository ppa:leolik/leolik 
#sudo apt-get update
#sudo apt-get upgrade
#sudo apt-get install libnotify-bin
#pkill notify-osd


echo -e "${blue}#######################################################################"
echo -e "## Applying misc settings                                            ##"
echo -e "#######################################################################${endColor}"
#ecursive search in Nautilus under Ubuntu 14.04
gsettings set org.gnome.nautilus.preferences enable-interactive-search false

# disable shopping sugestions
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

# disable overlay scrollbar
gsettings set com.canonical.desktop.interface scrollbar-mode normal
# gsettings reset com.canonical.desktop.interface scrollbar-mode #get back




echo -e "${blue}#######################################################################"
echo -e "## ALL installations DONE and ready to go :)                         ##"
echo -e "#######################################################################${endColor}"
