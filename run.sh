#!/usr/bin/env bash

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

sudo apt update 
sudo apt list --upgradable
sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y

# UBUNTU_NAME="$(cat /etc/upstream-release/lsb-release | grep 'DISTRIB_CODENAME' |  cut -d '=' -f 2)"
EXTENSIONS_FOLDER="$HOME/.local/share/cinnamon/extensions/"
DOWNLOAD_FOLDER="$HOME/Downloads/softwares"
mkdir "$DOWNLOAD_FOLDER"

# url's deb's program
URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_INSYNC="https://cdn.insynchq.com/builds/linux/insync_3.8.5.50499-jammy_amd64.deb"
URL_INSYNC_NEMO="https://cdn.insynchq.com/builds/linux/insync-nemo_3.7.9.50368_all.deb"
URL_INSYNC_ICONS="http://apt.insync.io/ubuntu/pool/contrib/i/insync-emblem-icons/insync-emblem-icons_3.4.2.40983_all.deb"
URL_VSCODE="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
NAME_VSCODE="${DOWNLOAD_FOLDER}/vscode.deb"
URL_MEGA="https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megasync-xUbuntu_22.04_amd64.deb"
URL_MEGA_NEMO="https://mega.nz/linux/repo/xUbuntu_22.04/amd64/nemo-megasync-xUbuntu_22.04_amd64.deb"
URL_DRAWIO="https://github.com/jgraph/drawio-desktop/releases/download/v13.0.3/draw.io-amd64-13.0.3.deb"
URL_JDK="https://download.oracle.com/java/20/latest/jdk-20_linux-x64_bin.deb"
URL_DISCORD="https://discordapp.com/api/download?platform=linux&format=deb"
NAME_DISCORD="${DOWNLOAD_FOLDER}/discord.deb"
URL_NETBEANS="https://dlcdn.apache.org/netbeans/netbeans-installers/17/apache-netbeans_17-1_all.deb"
URL_CODIUM="https://github.com/VSCodium/vscodium/releases/download/1.77.3.23102/codium_1.77.3.23102_amd64.deb"
URL_PDF_STUDIO_VIEWER="https://download.qoppa.com/pdfstudioviewer/PDFStudioViewer_linux64.deb"
URL_EMBY_SERVER="https://github.com/MediaBrowser/Emby.Releases/releases/download/4.7.11.0/emby-server-deb_4.7.11.0_amd64.deb"
URL_DBEAVER="https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb"
URL_SIMPLE_SIGNER="https://github.com/schorschii/Simple-Signer/releases/download/v1.5.0/simple-signer.deb"
URL_GTILE_EXTENSION="https://cinnamon-spices.linuxmint.com/files/extensions/gTile@shuairan.zip?time=1683484780"
NAME_GTILE_EXTENSION="${DOWNLOAD_FOLDER}/gTile@shuairan.zip"

# download deb's program
wget -c "$URL_GOOGLE_CHROME"                -P "$DOWNLOAD_FOLDER"
wget -c "$URL_INSYNC"                       -P "$DOWNLOAD_FOLDER"
wget -c "$URL_INSYNC_ICONS"                 -P "$DOWNLOAD_FOLDER"
wget -c "$URL_INSYNC_NEMO"                  -P "$DOWNLOAD_FOLDER"
wget -c "$URL_MEGA"                         -P "$DOWNLOAD_FOLDER"
wget -c "$URL_MEGA_NEMO"                    -P "$DOWNLOAD_FOLDER"
#wget -c "$URL_DRAWIO"                       -P "$DOWNLOAD_FOLDER"
wget -c "$URL_NETBEANS"                     -P "$DOWNLOAD_FOLDER"
#wget -c "$URL_CODIUM"                       -P "$DOWNLOAD_FOLDER" 
wget -cO $NAME_VSCODE "$URL_VSCODE"         -P "$DOWNLOAD_FOLDER"
wget -cO $NAME_DISCORD "$URL_DISCORD"       -P "$DOWNLOAD_FOLDER"
wget -c "$URL_JDK"                          -P "$DOWNLOAD_FOLDER" 
wget -c "$URL_PDF_STUDIO_VIEWER"            -P "$DOWNLOAD_FOLDER" 
wget -c "$URL_EMBY_SERVER"                  -P "$DOWNLOAD_FOLDER" 
wget -c "$URL_DBEAVER"                      -P "$DOWNLOAD_FOLDER" 
#wget -c "$URL_SIMPLE_SIGNER"                -P "$DOWNLOAD_FOLDER"
wget -cO $NAME_GTILE_EXTENSION "$URL_GTILE_EXTENSION"     -P "$DOWNLOAD_FOLDER"

# extract gTile in extensions cinamoon folder
sudo apt install unzip -y
unzip $NAME_GTILE_EXTENSION -d $EXTENSIONS_FOLDER

# apt's programs (installed from ubuntu/mint repositories)
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
sudo apt install ruby-full -y
#sudo apt install ubuntu-restricted-extras -y
sudo apt install redis-server -y
sudo apt install sqlite3 -y
sudo apt install apache2 -y
sudo apt install audacious     -y  
sudo apt install audacity -y
sudo apt install cheese -y
sudo apt install cmatrix -y
sudo apt install dia -y
sudo apt install docker.io -y
# sudo docker run --name some-mongo -p 27017:27017 -d mongo:latest
# sudo docker run \
# --publish=7474:7474 --publish=7687:7687 \
# --volume=$HOME/neo4j/data:/data \
# --env=NEO4J_AUTH=neo4j/password \
# --name neo4j neo4j
sudo apt install dropbox -y
sudo apt install nemo-dropbox -y
sudo apt install filezilla -y
sudo apt install gdebi -y
sudo apt install gimp -y
sudo apt install git -y 
sudo apt install keepassxc -y
sudo apt install kolourpaint -y
sudo apt install winff -y
sudo apt install virtualbox -y
sudo apt install ksnip -y
sudo apt install retext -y
sudo apt install shotwell -y 
sudo apt install simplescreenrecorder -y
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
# dependencies of deb's program
sudo apt install libgconf-2-4 -y
sudo apt install libc++1 -y
sudo apt install libu2f-udev -y
sudo apt install libc6 -y
sudo apt --fix-broken install -y

# ppa's
sudo add-apt-repository --yes ppa:sunderme/texstudio
sudo apt update && sudo apt install texstudio -y

sudo add-apt-repository --yes ppa:obsproject/obs-studio
sudo apt update && sudo apt install obs-studio -y

sudo apt update 
sudo apt list --upgradable
sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y

# maybe to use sudo apt install -f $DOWNLOAD_FOLDER/*.deb ??
sudo dpkg -i $DOWNLOAD_FOLDER/*.deb
sudo apt install -f -y
sudo apt --fix-broken install -y
# because insync (optional)
# nemo -q

sudo apt update 
sudo apt list --upgradable
sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y

# specials

# Spotify 
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install spotify-client -y

# PostgreSQL
# sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(UBUNTU_NAME)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt jammy-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt update && sudo apt install postgresql -y 

# pgAdmin4
sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
# sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(UBUNTU_NAME) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/jammy pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
sudo apt update && sudo apt install pgadmin4-desktop -y 

# Flatpaks
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# will be install a deb version
#sudo flatpak install -y --noninteractive flathub com.obsproject.Studio
sudo flatpak install -y --noninteractive flathub com.github.vkohaupt.vokoscreenNG
sudo flatpak install -y --noninteractive flathub com.github.unrud.VideoDownloader
sudo flatpak install -y --noninteractive flathub com.uploadedlobster.peek
sudo flatpak install -y --noninteractive flathub org.kde.kdenlive
# will be install a deb version
#sudo flatpak install -y --noninteractive flathub com.discordapp.Discord
# will be install a deb version
#sudo flatpak install -y --noninteractive flathub com.spotify.Client

sudo apt update 
sudo apt list --upgradable
sudo apt dist-upgrade -y
sudo flatpak update
sudo apt autoclean
sudo apt autoremove -y
