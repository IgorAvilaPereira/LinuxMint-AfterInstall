#!/usr/bin/env bash

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

sudo apt update -y

DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"
mkdir "$DIRETORIO_DOWNLOADS"

URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_INSYNC="https://cdn.insynchq.com/builds/linux/insync_3.8.5.50499-jammy_amd64.deb"
URL_INSYNC_NEMO="https://cdn.insynchq.com/builds/linux/insync-nemo_3.7.9.50368_all.deb"
URL_VSCODE="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
URL_MEGA="https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megasync-xUbuntu_22.04_amd64.deb"
URL_MEGA_NEMO="https://mega.nz/linux/repo/xUbuntu_22.04/amd64/nemo-megasync-xUbuntu_22.04_amd64.deb"
URL_DRAWIO="https://github.com/jgraph/drawio-desktop/releases/download/v13.0.3/draw.io-amd64-13.0.3.deb"
URL_JDK="https://download.oracle.com/java/20/latest/jdk-20_linux-x64_bin.deb"

wget -c "$URL_GOOGLE_CHROME"       -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_INSYNC"              -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_INSYNC_NEMO"         -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_VSCODE"              -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_MEGA"                -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_MEGA_NEMO"           -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_DRAWIO"              -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_JDK"                 -P "$DIRETORIO_DOWNLOADS"

## Instalando pacotes .deb baixados na sessão anterior ##
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

sudo apt install curl
sudo apt install mint-meta-codecs 
sudo apt install apache-netbeans 
sudo apt install apache2
sudo apt install audacious      
sudo apt install audacity
sudo apt install cheese
sudo apt install cmatrix
sudo apt install dia
sudo apt install discord
sudo apt install docker.io
sudo apt install dropbox
sudo apt install nemo-dropbox
sudo apt install emby-server
sudo apt install filezilla
sudo apt install gdebi
sudo apt install gimp
sudo apt install git
sudo apt install keepassxc
sudo apt install kolourpaint
sudo apt install winff
sudo apt install virtualbox
sudo apt install flameshot
sudo apt install retex
sudo apt install shotwell
sudo apt install simplescreenrecorder
sudo apt install obs-studio
sudo apt install pdfarranger            
sudo apt install pdfmod             
sudo apt install pdfchain
sudo apt install vokoscreen
sudo apt install vokoscreen-ng 
sudo apt install qpdfview
sudo apt install psensor 
sudo apt install synapse 
sudo apt install python3.11-full
sudo apt install php8.1
sudo apt install ruby-full
sudo apt install vlc
sudo apt install simple-scan
sudo apt install openjdk-19-jdk
sudo apt install openjdk-19-jre
sudo apt install kdenlive
sudo add-apt-repository ppa:mordec13/youtubedl-gui
sudo apt update && sudo apt install youtubedl-gui
sudo apt-get install gstreamer1.0-plugins-ugly

# Spotify
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

# PostgreSQL.
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql

# PgAdmin4
sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/focal pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
sudo apt install pgadmin4-desktop

# Flatpaks
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install flathub com.github.vkohaupt.vokoscreenNG
sudo flatpak install flathub com.github.unrud.VideoDownloader
sudo flatpak install flathub com.uploadedlobster.peek

sudo apt update && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y


