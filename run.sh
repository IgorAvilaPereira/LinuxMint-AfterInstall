#!/usr/bin/env bash

# UBUNTU_NAME="$(cat /etc/upstream-release/lsb-release | grep 'DISTRIB_CODENAME' |  cut -d '=' -f 2)"

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

sudo apt update 
sudo apt list --upgradable
sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y

# destkops enviroments
sudo apt install mint-meta-xfce -y
# sudo apt install mint-meta-mate -y

# extensions and applets cinamoon
EXTENSIONS_FOLDER="$HOME/.local/share/cinnamon/extensions/"
APPLETS_FOLDER="$HOME/.local/share/cinnamon/applets/"

DOWNLOAD_FOLDER="$HOME/Downloads/softwares"
mkdir "$DOWNLOAD_FOLDER"

# url's deb's program
URL_IRIUNWEBCAM="https://iriun.gitlab.io/iriunwebcam-2.8.1.deb"

URL_INSOMNIA="https://updates.insomnia.rest/downloads/ubuntu/latest?&app=com.insomnia.app&source=website"
NAME_INSOMNIA="${DOWNLOAD_FOLDER}/insomnia.deb"

URL_POSTMAN="https://dl.pstmn.io/download/latest/linux_64"
NAME_POSTMAN="${DOWNLOAD_FOLDER}/postman-linux-x64.tar.gz"

URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

URL_INSYNC="https://cdn.insynchq.com/builds/linux/insync_3.8.5.50499-jammy_amd64.deb"
URL_INSYNC_NEMO="https://cdn.insynchq.com/builds/linux/insync-nemo_3.7.9.50368_all.deb"
URL_INSYNC_ICONS="http://apt.insync.io/ubuntu/pool/contrib/i/insync-emblem-icons/insync-emblem-icons_3.4.2.40983_all.deb"

URL_VSCODE="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
NAME_VSCODE="${DOWNLOAD_FOLDER}/vscode.deb"

URL_MEGA="https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megasync-xUbuntu_22.04_amd64.deb"
URL_MEGA_NEMO="https://mega.nz/linux/repo/xUbuntu_22.04/amd64/nemo-megasync-xUbuntu_22.04_amd64.deb"

URL_DRAWIO="https://github.com/jgraph/drawio-desktop/releases/download/v23.1.5/drawio-amd64-23.1.5.deb"

URL_JDK="https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb"

URL_DISCORD="https://discordapp.com/api/download?platform=linux&format=deb"
NAME_DISCORD="${DOWNLOAD_FOLDER}/discord.deb"

URL_NETBEANS="https://dlcdn.apache.org/netbeans/netbeans-installers/23/apache-netbeans_23-1_all.deb"

URL_CODIUM="https://github.com/VSCodium/vscodium/releases/download/1.77.3.23102/codium_1.77.3.23102_amd64.deb"

URL_PDF_STUDIO_VIEWER="https://download.qoppa.com/pdfstudioviewer/PDFStudioViewer_linux64.deb"

URL_EMBY_SERVER="https://github.com/MediaBrowser/Emby.Releases/releases/download/4.8.8.0/emby-server-deb_4.8.8.0_amd64.deb"

URL_DBEAVER="https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb"

URL_BEEKEPPER="https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v4.0.3/beekeeper-studio_4.0.3_amd64.deb"

URL_SIMPLE_SIGNER="https://github.com/schorschii/Simple-Signer/releases/download/v1.5.0/simple-signer.deb"

URL_MINI_VIDEO_ME="https://github.com/maykbrito/mini-video-me/releases/download/v4.0.2/mini-video-me_4.0.2_amd64.deb"
URL_BALENA="https://github.com/balena-io/etcher/releases/download/v1.19.25/balena-etcher_1.19.25_amd64.deb"

# download deb's program
#wget -c "$URL_CODIUM"                       -P "$DOWNLOAD_FOLDER"
wget -c "$URL_MINI_VIDEO_ME"                 -P "$DOWNLOAD_FOLDER"
wget -c "$URL_BALENA"                        -P "$DOWNLOAD_FOLDER"
wget -c "$URL_DRAWIO"                        -P "$DOWNLOAD_FOLDER"
wget -c "$URL_DBEAVER"                       -P "$DOWNLOAD_FOLDER" 
wget -c "$URL_BEEKEPPER"                     -P "$DOWNLOAD_FOLDER" 
# wget -c "$URL_SIMPLE_SIGNER"               -P "$DOWNLOAD_FOLDER"
# wget -cO $NAME_VSCODE "$URL_VSCODE"        -P "$DOWNLOAD_FOLDER"
wget -c "$URL_GOOGLE_CHROME"                 -P "$DOWNLOAD_FOLDER"
wget -c "$URL_IRIUNWEBCAM"                   -P "$DOWNLOAD_FOLDER"
wget -c "$URL_INSYNC"                        -P "$DOWNLOAD_FOLDER"
wget -c "$URL_INSYNC_ICONS"                  -P "$DOWNLOAD_FOLDER"
wget -c "$URL_INSYNC_NEMO"                   -P "$DOWNLOAD_FOLDER"
wget -c "$URL_MEGA"                          -P "$DOWNLOAD_FOLDER"
wget -c "$URL_MEGA_NEMO"                     -P "$DOWNLOAD_FOLDER"
wget -c "$URL_NETBEANS"                      -P "$DOWNLOAD_FOLDER" 
wget -c "$URL_JDK"                           -P "$DOWNLOAD_FOLDER" 
wget -c "$URL_PDF_STUDIO_VIEWER"             -P "$DOWNLOAD_FOLDER" 
wget -c "$URL_EMBY_SERVER"                   -P "$DOWNLOAD_FOLDER" 
wget -cO $NAME_DISCORD "$URL_DISCORD"        -P "$DOWNLOAD_FOLDER"
wget -cO $NAME_INSOMNIA "$URL_INSOMNIA"      -P "$DOWNLOAD_FOLDER"
wget -cO $NAME_POSTMAN "$URL_POSTMAN"        -P "$DOWNLOAD_FOLDER"

# manager window to cinamoon
URL_GTILE_EXTENSION="https://cinnamon-spices.linuxmint.com/files/extensions/gTile@shuairan.zip?time=1683484780"
NAME_GTILE_EXTENSION="${DOWNLOAD_FOLDER}/gTile@shuairan.zip"
URL_MYLAUNCHER_APPLET="https://cinnamon-spices.linuxmint.com/files/applets/mylauncher@markbokil.com.zip?time=1683739498"
NAME_MYLAUNCHER_APPLET="${DOWNLOAD_FOLDER}/mylauncher@markbokil.com.zip"


wget -cO $NAME_GTILE_EXTENSION "$URL_GTILE_EXTENSION"         -P "$DOWNLOAD_FOLDER"
wget -cO $NAME_MYLAUNCHER_APPLET "$URL_MYLAUNCHER_APPLET"     -P "$DOWNLOAD_FOLDER"
# extract gTile extension and My Launch applet
sudo apt install unzip -y
unzip $NAME_GTILE_EXTENSION -d $EXTENSIONS_FOLDER
unzip $NAME_MYLAUNCHER_APPLET -d $APPLETS_FOLDER

# echo 'ImportMacAdress=python3 /home/iapereira/git/scripts-coordenacao/mac_selenium.py
# GenerateEvaluationSheetToStudents=python3 /home/iapereira/git/GenerateEvaluationSheetToStudents/app.py 
# PDF Annots=python3 /home/iapereira/git/pdfannots-tkinter-app/main.py
# Youtube Downloader=python3 /home/iapereira/git/youtube-download/main.py
# Latex From Figures=java -jar /home/iapereira/git/LatexPresentationFromFigures/dist/LatexPresentationFromFigures.jar
# Distribuição da Carga Horária=firefox  /home/iapereira/git/DistribuicaoDeDisciplinas/carga_horaria.html' >> "${APPLETS_FOLDER}mylauncher@markbokil.com/mylauncher.properties"

# other desktop enviroment (for poor pc)
# sudo apt install xfce4 -y
# extract here in thunar
sudo apt install thunar-archive-plugin -y
# dropbox for thunar
sudo apt install thunar-dropbox-plugin -y
# power manager applet for xfce4
sudo apt install xfce4-power-manager -y
sudo apt install xfce4-pulseaudio-plugin -y

# apt's programs (installed from ubuntu/mint repositories)
sudo apt install curl -y

# codecs
sudo apt install mint-meta-codecs  -y
sudo apt install ffmpeg -y
sudo apt install gstreamer1.0-plugins-ugly -y

#  java
sudo apt install openjdk-21-jdk -y
sudo apt install openjdk-21-jre -y

# python
sudo apt install python3.12-full -y
sudo apt install python3-pip -y
sudo apt install python-is-python3 -y

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
sudo pip3 install stdiomask
sudo pip3 install hyfetch

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
sudo apt install jekyll -y

# databases
sudo apt install redis-server -y
sudo apt install sqlite3 -y

# others developer programs
sudo apt install apache2 -y
sudo apt install docker.io -y
sudo apt install git -y 
# mkdir "$HOME/git"

# audio/video
sudo apt install audacious     -y  
sudo apt install audacity -y
sudo apt install cheese -y
sudo apt install winff -y
sudo apt install soundconverter -y
sudo apt install v4l-utils -y
sudo apt install v4l2-ctl -y
sudo apt install ffmpeg -y
sudo apt install mplayer -y
sudo apt install simplescreenrecorder -y
# sudo apt install vokoscreen-ng -y
sudo apt install gstreamer1.0-plugins-ugly -y
sudo apt install vlc -y
# sudo apt install v4l-utils -y
# sudo apt install ffmpeg -y
# sudo apt install mplayer -y
sudo apt install mkvtoolnix -y

# diagrams/graphics
sudo apt install dia -y
# sudo apt install dia2code -y
sudo apt install plantuml -y
# sudo apt install kolourpaint -y
sudo apt install ksnip -y
sudo apt install flameshot -y 
sudo apt install shotwell -y 
sudo apt install simple-scan -y
sudo apt install graphviz -y

# pdf 
sudo apt install pdfarranger -y            
sudo apt install pdfmod     -y        
sudo apt install pdfchain -y
# sudo apt install qpdfview -y
# sudo apt install mupdf mupdf-tools -y

# others
sudo apt install dropbox -y
sudo apt install nemo-dropbox -y
sudo apt install nemo-image-converter -y
sudo apt install nemo-terminal -y
sudo apt install caja -y
sudo apt install caja-dropbox -y
sudo apt install keepassxc -y
sudo apt install virtualbox -y
sudo apt install virtualbox-ext-pack -y 
sudo apt install virtualbox-guest-additions-iso -y
# sudo apt install gnome-boxes -y
sudo apt install retext -y
sudo apt install cmatrix -y
# the repository has been archived 
# sudo apt install neofetch -y
# sudo apt install gdebi -y
# sudo apt install gdebi-gtk -y
# sudo apt install gimp -y
# sudo apt install psensor  -y
sudo apt install synapse  -y
sudo apt install filezilla -y
sudo apt install hplip -y 
sudo apt install hplip-gui -y 
sudo apt install stacer -y
sudo apt install ranger -y
sudo apt install speedtest-cli  -y
sudo apt install btop  -y
sudo apt install feh -y
sudo apt install httpie -y 
sudo apt install syncthing -y 
sudo apt install syncthing-gtk -y 
sudo apt install unrar -y 

# ssh
sudo apt install openssh-client -y
sudo apt install openssh-server -y

# latex
sudo apt install texlive-latex-extra -y
# sudo apt install jabref 

# dependencies of deb's program/ppa'a
sudo apt install libgconf-2-4 -y
sudo apt install libc++1 -y
sudo apt install libu2f-udev -y
sudo apt install libc6 -y
sudo apt install libpq-dev -y

sudo apt install -f -y
sudo apt --fix-broken install -y

# ppa's
sudo apt-add-repository --yes ppa:yktooo/ppa
sudo apt update && sudo apt install indicator-sound-switcher -y

sudo add-apt-repository --yes ppa:sunderme/texstudio
sudo apt update && sudo apt install texstudio -y

sudo add-apt-repository --yes ppa:obsproject/obs-studio
sudo apt update && sudo apt install obs-studio -y

sudo add-apt-repository --yes ppa:serge-rider/dbeaver-ce
sudo apt update && sudo apt install dbeaver-ce -y

sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository --yes "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update && sudo apt install code -y

sudo apt update 
sudo apt list --upgradable
sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y

sudo apt install curl  -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser  -y

# maybe to try sudo apt install ./$DOWNLOAD_FOLDER/*.deb -y ??
sudo dpkg -i $DOWNLOAD_FOLDER/*.deb
sudo apt install -f -y
sudo apt --fix-broken install -y
# because insync (optional)
nemo -q

sudo apt update 
sudo apt list --upgradable
sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y

# specials

# Spotify 
#curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
#echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
#sudo apt-get update && sudo apt-get install spotify-client -y


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

# ruby gems dependencies
#sudo apt install libpq-dev -y
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
sudo flatpak install -y --noninteractive flathub io.github.flattool.Warehouse
sudo flatpak install -y --noninteractive flathub org.kde.kolourpaint
sudo flatpak install -y --noninteractive flathub org.localsend.localsend_app
sudo flatpak install -y --noninteractive flathub io.github.adrienverge.PhotoCollage
sudo flatpak install -y --noninteractive flathub it.mijorus.gearlever
sudo flatpak install -y --noninteractive flathub org.gnome.gitlab.YaLTeR.VideoTrimmer
sudo flatpak install -y --noninteractive flathub org.localsend.localsend_app
sudo flatpak install -y --noninteractive flathub com.rtosta.zapzap

# sudo flatpak install -y --noninteractive flathub me.iepure.devtoolbox

# if you want to install mendeley
# sudo flatpak install -y --noninteractive com.elsevier.MendeleyDesktop



sudo apt update 
sudo apt list --upgradable
sudo apt dist-upgrade -y
sudo flatpak update
sudo apt autoclean
sudo apt autoremove -y
