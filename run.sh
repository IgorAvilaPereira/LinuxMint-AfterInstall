#!/usr/bin/env bash

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

sudo apt update 
sudo apt list --upgradable
sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y

# UBUNTU_NAME="$(cat /etc/upstream-release/lsb-release | grep 'DISTRIB_CODENAME' |  cut -d '=' -f 2)"

# extensions and applets cinamoon
EXTENSIONS_FOLDER="$HOME/.local/share/cinnamon/extensions/"
APPLETS_FOLDER="$HOME/.local/share/cinnamon/applets/"

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
URL_MYLAUNCHER_APPLET="https://cinnamon-spices.linuxmint.com/files/applets/mylauncher@markbokil.com.zip?time=1683739498"
NAME_MYLAUNCHER_APPLET="${DOWNLOAD_FOLDER}/mylauncher@markbokil.com.zip"

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
#wget -c "$URL_DBEAVER"                      -P "$DOWNLOAD_FOLDER" 
#wget -c "$URL_SIMPLE_SIGNER"                -P "$DOWNLOAD_FOLDER"
# manager window to cinamoon
wget -cO $NAME_GTILE_EXTENSION "$URL_GTILE_EXTENSION"     -P "$DOWNLOAD_FOLDER"
# launcher applications
wget -cO $NAME_MYLAUNCHER_APPLET "$URL_MYLAUNCHER_APPLET"     -P "$DOWNLOAD_FOLDER"

# extract gTile extension and My Launch applet
sudo apt install unzip -y
unzip $NAME_GTILE_EXTENSION -d $EXTENSIONS_FOLDER
unzip $NAME_MYLAUNCHER_APPLET -d $APPLETS_FOLDER

#echo '[MS] -----------------
#GenerateEvaluationSheetToStudents=python3 /home/iapereira/git/GenerateEvaluationSheetToStudents/app.py 
#PDF Annots=python3 /home/iapereira/git/pdfannots-tkinter-app/main.py
#Youtube Downloader=python3 /home/iapereira/git/youtube-download/main.py
#[MS] -----------------
#Latex From Figures=java -jar /home/iapereira/git/LatexPresentationFromFigures/dist/LatexPresentationFromFigures.jar
#[MS] -----------------
#Distribuição da Carga Horária=firefox  /home/iapereira/git/DistribuicaoDeDisciplinas/carga_horaria.html' >> "${APPLETS_FOLDER}mylauncher@markbokil.com/mylauncher.properties"

# apt's programs (installed from ubuntu/mint repositories)
sudo apt install curl -y
sudo apt install mint-meta-codecs  -y
sudo apt install ffmpeg -y
sudo apt install gstreamer1.0-plugins-ugly -y
#  java
sudo apt install openjdk-19-jdk -y
sudo apt install openjdk-19-jre -y
# python
sudo apt install python3.11-full -y
sudo apt install python3-pip -y
# pip packages
sudo pip3 install flask
sudo pip3 install psycopg
sudo pip3 install sqlalchemy
sudo pip3 install flask-sqlalchemy
sudo pip3 install flet
sudo pip3 install gdown
sudo pip3 install selenium
sudo pip3 install pytube
sudo pip3 install ezodf
sudo pip3 install pyinstaller
sudo pip3 install SpeechRecognition
sudo pip3 install pdfannots
sudo pip3 install pyautogui pillow mouseinfo
# php
sudo apt install php8.1 -y
sudo apt install php8.1-gd -y
sudo apt install php8.1-pgsql -y
sudo apt install php8.1-mysql -y
sudo apt install php8.1-xml -y
sudo apt install php8.1-xmlrpc -y
sudo apt install php8.1-zip -y
sudo apt install php8.1-sqlite3 -y
#  ruby
sudo apt install ruby-full -y
sudo apt install bwidget -y
# databases
sudo apt install redis-server -y
sudo apt install sqlite3 -y
# servers
sudo apt install apache2 -y
sudo apt install docker.io -y
sudo apt install git -y 
#mkdir "$HOME/git"
# audio
sudo apt install audacious     -y  
sudo apt install audacity -y
# video/webcam
sudo apt install cheese -y
sudo apt install winff -y
# diagrams/graphics
sudo apt install dia -y
sudo apt install plantuml -y
sudo apt install kolourpaint -y
sudo apt install ksnip -y
sudo apt install shotwell -y 
sudo apt install simplescreenrecorder -y
sudo apt install vlc -y
sudo apt install simple-scan -y
# pdf 
sudo apt install pdfarranger -y            
sudo apt install pdfmod     -y        
sudo apt install pdfchain -y
# sudo apt install qpdfview -y
# sudo apt install mupdf mupdf-tools -y
# others
sudo apt install dropbox -y
sudo apt install nemo-dropbox -y
sudo apt install keepassxc -y
sudo apt install virtualbox -y
sudo apt install retext -y
sudo apt install cmatrix -y
sudo apt install neofetch -y
# sudo apt install gdebi -y
# sudo apt install gdebi-gtk -y
# sudo apt install gimp -y
# sudo apt install psensor  -y
# sudo apt install synapse  -y
sudo apt install filezilla -y
sudo apt install openssh-client -y
sudo apt install openssh-server -y
sudo apt install texlive-latex-extra -y
# dependencies of deb's program
sudo apt install libgconf-2-4 -y
sudo apt install libc++1 -y
sudo apt install libu2f-udev -y
sudo apt install libc6 -y
sudo apt install libpq-dev -y

sudo apt install -f -y
sudo apt --fix-broken install -y

# ppa's
sudo add-apt-repository --yes ppa:sunderme/texstudio
sudo apt update && sudo apt install texstudio -y

sudo add-apt-repository --yes ppa:obsproject/obs-studio
sudo apt update && sudo apt install obs-studio -y

sudo add-apt-repository --yes ppa:serge-rider/dbeaver-ce
sudo apt update && sudo apt install dbeaver-ce -y

sudo apt update 
sudo apt list --upgradable
sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y

# maybe to try sudo apt install ./$DOWNLOAD_FOLDER/*.deb -y ??
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

# gem dependencies
#sudo apt install libpq-dev -y
#sudo killall synaptic
#sudo gem install pg
#sudo gem install sinatra

# if you want data mapper for ruby
# sudo apt-get install postgresql-server-dev-all  -y
# sudo gem install dm-postgres-adapter
# sudo gem install data_mapper

# Flatpaks
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install -y --noninteractive flathub com.github.vkohaupt.vokoscreenNG
sudo flatpak install -y --noninteractive flathub com.github.unrud.VideoDownloader
sudo flatpak install -y --noninteractive flathub com.uploadedlobster.peek
sudo flatpak install -y --noninteractive flathub org.kde.kdenlive
# if you want to install mendeley
# sudo flatpak install -y --noninteractive com.elsevier.MendeleyDesktop

sudo apt update 
sudo apt list --upgradable
sudo apt dist-upgrade -y
sudo flatpak update
sudo apt autoclean
sudo apt autoremove -y
