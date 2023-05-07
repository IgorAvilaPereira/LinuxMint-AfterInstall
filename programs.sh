#!/usr/bin/env bash

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

sudo apt update 
sudo apt list --upgradable
sudo apt dist-upgrade -y
sudo apt autoclean 
sudo apt autoremove -y

DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"
mkdir "$DIRETORIO_DOWNLOADS"

URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_INSYNC="https://cdn.insynchq.com/builds/linux/insync_3.8.5.50499-jammy_amd64.deb"
URL_INSYNC_NEMO="https://cdn.insynchq.com/builds/linux/insync-nemo_3.7.9.50368_all.deb"
URL_VSCODE="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
NAME_VSCODE="${DIRETORIO_DOWNLOADS}/vscode.deb"
URL_MEGA="https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megasync-xUbuntu_22.04_amd64.deb"
URL_MEGA_NEMO="https://mega.nz/linux/repo/xUbuntu_22.04/amd64/nemo-megasync-xUbuntu_22.04_amd64.deb"
URL_DRAWIO="https://github.com/jgraph/drawio-desktop/releases/download/v13.0.3/draw.io-amd64-13.0.3.deb"
URL_JDK="https://download.oracle.com/java/20/latest/jdk-20_linux-x64_bin.deb"
URL_DISCORD="https://discordapp.com/api/download?platform=linux&format=deb"
NAME_DISCORD="${DIRETORIO_DOWNLOADS}/discord.deb"
URL_NETBEANS="https://dlcdn.apache.org/netbeans/netbeans-installers/17/apache-netbeans_17-1_all.deb"
URL_CODIUM="https://github.com/VSCodium/vscodium/releases/download/1.77.3.23102/codium_1.77.3.23102_amd64.deb"
URL_PDF_STUDIO_VIEWER="https://download.qoppa.com/pdfstudioviewer/PDFStudioViewer_linux64.deb"
URL_EMBY_SERVER="https://github.com/MediaBrowser/Emby.Releases/releases/download/4.7.11.0/emby-server-deb_4.7.11.0_amd64.deb"
URL_DBEAVER="https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb"
URL_SIMPLE_SIGNER="https://github.com/schorschii/Simple-Signer/releases/download/v1.5.0/simple-signer.deb"

wget -c "$URL_GOOGLE_CHROME"                -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_INSYNC"                       -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_INSYNC_NEMO"                  -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_MEGA"                         -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_MEGA_NEMO"                    -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_DRAWIO"                       -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_NETBEANS"                     -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_CODIUM"                       -P "$DIRETORIO_DOWNLOADS" 
wget -cO $NAME_VSCODE "$URL_VSCODE"         -P "$DIRETORIO_DOWNLOADS"
wget -cO $NAME_DISCORD "$URL_DISCORD"       -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_JDK"                          -P "$DIRETORIO_DOWNLOADS" 
wget -c "$URL_PDF_STUDIO_VIEWER"            -P "$DIRETORIO_DOWNLOADS" 
wget -c "$URL_EMBY_SERVER"                  -P "$DIRETORIO_DOWNLOADS" 
wget -c "$URL_DBEAVER"                      -P "$DIRETORIO_DOWNLOADS" 
wget -c "$URL_SIMPLE_SIGNER"                -P "$DIRETORIO_DOWNLOADS" 

sudo apt install curl -y
sudo apt install mint-meta-codecs  -y
sudo apt install ffmpeg -y
sudo apt install gstreamer1.0-plugins-ugly -y
sudo apt install openjdk-19-jdk -y
sudo apt install openjdk-19-jre -y
sudo apt install python3.11-full -y
sudo apt install python3-pip -y
sudo apt install php8.1 -y
sudo apt install php8.1-gd -y
sudo apt install php8.1-pgsql -y
sudo apt install php8.1-mysql -y
sudo apt install php8.1-xml -y
sudo apt install php8.1-xmlrpc -y
sudo apt install php8.1-zip -y
sudo apt install php8.1-sqlite3 -y
#sudo apt install ruby-full -y
sudo apt install sqlite3 -y
sudo apt install apache-netbeans  -y
sudo apt install apache2 -y
sudo apt install audacious     -y  
sudo apt install audacity -y
sudo apt install cheese -y
sudo apt install cmatrix -y
sudo apt install dia -y
#sudo apt install discord -y
sudo apt install docker.io -y
sudo apt install dropbox -y
sudo apt install nemo-dropbox -y
#sudo apt install emby-server -y
sudo apt install filezilla -y
sudo apt install gdebi -y
sudo apt install gimp -y
sudo apt install git -y 
sudo apt install keepassxc -y
sudo apt install kolourpaint -y
sudo apt install winff -y
sudo apt install virtualbox -y
sudo apt install flameshot -y
sudo apt install ksnip -y
sudo apt install retext -y
sudo apt install shotwell -y 
sudo apt install simplescreenrecorder -y
#sudo apt install obs-studio -y
sudo apt install pdfarranger -y            
sudo apt install pdfmod     -y        
sudo apt install pdfchain -y
sudo apt install qpdfview -y
sudo apt install psensor  -y
sudo apt install synapse  -y
sudo apt install vlc -y
sudo apt install neofetch -y
sudo apt install simple-scan -y
sudo apt install openssh-client -y
sudo apt install openssh-server -y
sudo apt install texlive-latex-extra -y
sudo apt --fix-broken install -y

sudo add-apt-repository --yes ppa:sunderme/texstudio
sudo apt update && sudo apt install texstudio -y

sudo add-apt-repository --yes ppa:mordec13/youtubedl-gui
sudo apt update && sudo apt install youtubedl-gui -y

sudo add-apt-repository --yes ppa:obsproject/obs-studio
sudo apt update && sudo apt install obs-studio -y

sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb
sudo apt --fix-broken install -y

sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y
sudo apt list --upgradable

# vscode
#sudo apt install software-properties-common apt-transport-https wget -y
#wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add –
#sudo add-apt-repository --yes "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
#sudo apt install code

# Spotify
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install spotify-client -y

# PostgreSQL.
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt jammy-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt update && sudo apt install postgresql -y 

# PgAdmin4
sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/jammy pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
sudo apt update && sudo apt install pgadmin4-desktop -y 

# Flatpaks
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#sudo flatpak install -y --noninteractive flathub com.obsproject.Studio
sudo flatpak install -y --noninteractive flathub com.github.vkohaupt.vokoscreenNG
sudo flatpak install -y --noninteractive flathub com.github.unrud.VideoDownloader
sudo flatpak install -y --noninteractive flathub com.uploadedlobster.peek
#sudo flatpak install -y --noninteractive flathub com.visualstudio.code
sudo flatpak install -y --noninteractive flathub org.kde.kdenlive
#sudo flatpak install -y --noninteractive flathub com.discordapp.Discord
#sudo flatpak install -y --noninteractive flathub com.spotify.Client
#sudo flatpak install -y --noninteractive flathub org.apache.netbeans

sudo apt update && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y
