#!/usr/bin/env bash

UBUNTU_NAME="$(cat /etc/upstream-release/lsb-release | grep 'DISTRIB_CODENAME' |  cut -d '=' -f 2)"
# PostgreSQL
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(UBUNTU_NAME)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
# sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt jammy-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt update && sudo apt install postgresql -y 

# pgAdmin4
sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(UBUNTU_NAME) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
# sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/jammy pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
sudo apt update && sudo apt install pgadmin4-desktop -y 

# DOWNLOAD_FOLDER="$HOME/Downloads/softwares"
# EXTENSIONS_FOLDER="$HOME/.local/share/cinnamon/extensions/"
# mkdir "$DOWNLOAD_FOLDER"

# URL_GTILE_EXTENSION="https://cinnamon-spices.linuxmint.com/files/extensions/gTile@shuairan.zip?time=1683484780"
# NAME_GTILE_EXTENSION="${DOWNLOAD_FOLDER}/gTile@shuairan.zip"
# wget -cO $NAME_GTILE_EXTENSION "$URL_GTILE_EXTENSION"     -P "$DOWNLOAD_FOLDER"

# sudo apt install unzip -y
# unzip $NAME_GTILE_EXTENSION -d $EXTENSIONS_FOLDER

# DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"
# mkdir "$DIRETORIO_DOWNLOADS"

# URL_JDK="https://download.oracle.com/java/20/latest/jdk-20_linux-x64_bin.deb"
# wget -c "$URL_JDK"              -P "$DIRETORIO_DOWNLOADS" 

# URL_VSCODE="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
# NAME_VSCODE="${DIRETORIO_DOWNLOADS}/vscode.deb"
# wget -cO $NAME_VSCODE "$URL_VSCODE" -P "$DIRETORIO_DOWNLOADS"

# URL_DISCORD="https://discordapp.com/api/download?platform=linux&format=deb"
# NAME_DISCORD="${DIRETORIO_DOWNLOADS}/discord.deb"
# wget -cO $NAME_DISCORD "$URL_DISCORD"            -P "$DIRETORIO_DOWNLOADS"




