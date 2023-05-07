#!/usr/bin/env bash

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y
sudo apt list --upgradable

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
URL_DISCORD="https://discordapp.com/api/download?platform=linux&format=deb"

wget -c "$URL_GOOGLE_CHROME"       -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_INSYNC"              -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_INSYNC_NEMO"         -P "$DIRETORIO_DOWNLOADS"

wget -c "$URL_MEGA"                -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_MEGA_NEMO"           -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_DRAWIO"              -P "$DIRETORIO_DOWNLOADS"

#wget -c "$URL_VSCODE"             -P "$DIRETORIO_DOWNLOADS"
#wget -cO $URL_VSCODE > $DIRETORIO_DOWNLOADS"/vscode.deb"

#wget -c "$URL_DISCORD"            -P "$DIRETORIO_DOWNLOADS"
#wget -cO $URL_DISCORD > $DIRETORIO_DOWNLOADS"/discord.deb"

#wget -c "$URL_JDK"                -P "$DIRETORIO_DOWNLOADS"

## Instalando pacotes .deb baixados na sessão anterior ##
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb
sudo apt --fix-broken install -y

sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y
sudo apt list --upgradable

sudo apt install curl -y
sudo apt install mint-meta-codecs  -y
sudo apt-get install ffmpeg -y
sudo apt-get install gstreamer1.0-plugins-ugly
sudo apt install openjdk-19-jdk -y
sudo apt install openjdk-19-jre -y
sudo apt install python3.11-full -y
sudo apt install php8.1 -y
sudo apt install ruby-full -y
sudo apt install apache-netbeans  -y
sudo apt install apache2 -y
sudo apt install audacious     -y  
sudo apt install audacity -y
sudo apt install cheese -y
sudo apt install cmatrix -y
sudo apt install dia -y
sudo apt install discord -y
sudo apt install docker.io -y
sudo apt install dropbox -y
sudo apt install nemo-dropbox -y
sudo apt install emby-server -y
sudo apt install filezilla -y
sudo apt install gdebi -y
sudo apt install gimp -y
sudo apt install git -y 
sudo apt install keepassxc -y
sudo apt install kolourpaint -y
sudo apt install winff -y
sudo apt install virtualbox -y
sudo apt install flameshot -y
sudo apt install retex -y 
sudo apt install shotwell -y 
sudo apt install simplescreenrecorder -y
sudo apt install obs-studio -y
sudo apt install pdfarranger -y            
sudo apt install pdfmod     -y        
sudo apt install pdfchain -y
sudo apt install qpdfview -y
sudo apt install psensor  -y
sudo apt install synapse  -y
sudo apt install vlc -y
sudo apt install simple-scan -y
sudo apt install kdenlive -y
sudo apt install openssh-client
sudo apt install openssh-server
sudo apt install texlive-latex-extra -y

sudo apt --fix-broken install -y

sudo add-apt-repository --yes ppa:sunderme/texstudio
sudo apt update && sudo apt install texstudio

sudo add-apt-repository --yes ppa:mordec13/youtubedl-gui
sudo apt update && sudo apt install youtubedl-gui

sudo add-apt-repository --yes ppa:obsproject/obs-studio
sudo apt update
sudo apt-get update && sudo apt-get install obs-studio

sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y
sudo apt list --upgradable

# vscode
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add –
sudo add-apt-repository --yes "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

# Spotify
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

# PostgreSQL.
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt update
sudo apt -y install postgresql

# PgAdmin4
sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
sudo apt install pgadmin4-desktop

# Flatpaks
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install -y --noninteractive flathub com.obsproject.Studio
sudo flatpak install -y --noninteractive flathub com.github.vkohaupt.vokoscreenNG
sudo flatpak install -y --noninteractive flathub com.github.unrud.VideoDownloader
sudo flatpak install -y --noninteractive flathub com.uploadedlobster.peek
sudo flatpak install -y --noninteractive flathub com.visualstudio.code
sudo flatpak install -y --noninteractive flathub io.github.lunarequest.NightPDF
sudo flatpak install -y --noninteractive flathub com.discordapp.Discord
sudo flatpak install -y --noninteractive flathub com.spotify.Client
sudo flatpak install -y --noninteractive flathub org.apache.netbeans

sudo apt update && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y

