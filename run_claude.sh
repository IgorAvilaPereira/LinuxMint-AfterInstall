#!/usr/bin/env bash
# ═══════════════════════════════════════════════════════════════
#  setup.sh — Pós-instalação Linux Mint / Ubuntu
#  Uso: chmod +x setup.sh && sudo ./setup.sh
# ═══════════════════════════════════════════════════════════════
set -euo pipefail          # aborta em erro, variável vazia ou pipe falho
IFS=$'\n\t'

# ── Verifica root ─────────────────────────────────────────────
if [[ $EUID -ne 0 ]]; then
    echo "Execute como root:  sudo $0"; exit 1
fi

REAL_USER="${SUDO_USER:-$USER}"
HOME_DIR=$(getent passwd "$REAL_USER" | cut -d: -f6)
DOWNLOAD_DIR="$HOME_DIR/Downloads/softwares"
CODENAME=$(lsb_release -cs)          # noble | jammy | vera | etc.
ARCH=$(dpkg --print-architecture)    # amd64 | arm64

mkdir -p "$DOWNLOAD_DIR"

log()  { echo -e "\n\033[1;34m▶ $*\033[0m"; }
ok()   { echo -e "\033[0;32m  ✓ $*\033[0m"; }
warn() { echo -e "\033[1;33m  ⚠ $*\033[0m"; }

# ── 1. Remover locks antigos com segurança ───────────────────
log "Liberando locks do apt"
# Só remove se o processo que criou o lock não existir mais
if fuser /var/lib/dpkg/lock-frontend &>/dev/null; then
    warn "apt está em uso por outro processo — aguardando..."
    fuser -w /var/lib/dpkg/lock-frontend
else
    rm -f /var/lib/dpkg/lock-frontend /var/cache/apt/archives/lock
fi
ok "Locks liberados"

# ── 2. Atualização do sistema ────────────────────────────────
log "Atualizando sistema"
apt-get update -qq
apt-get dist-upgrade -y
apt-get autoclean -y
apt-get autoremove -y
ok "Sistema atualizado"

# ── 3. Pacotes apt essenciais (sem duplicatas) ───────────────
log "Instalando pacotes base"
apt-get install -y \
    bash curl wget git jq unzip \
    zenity software-properties-common apt-transport-https \
    ca-certificates gnupg lsb-release

# ── 4. Flatpak ───────────────────────────────────────────────
log "Configurando Flatpak"
apt-get install -y flatpak
flatpak remote-add --if-not-exists flathub \
    https://flathub.org/repo/flathub.flatpakrepo
ok "Flatpak OK"

# ── 5. Ambientes de desktop ──────────────────────────────────
log "Instalando mint-meta-xfce + plugins"
apt-get install -y \
    mint-meta-xfce \
    thunar-archive-plugin thunar-dropbox-plugin \
    xfce4-power-manager xfce4-pulseaudio-plugin

# ── 6. Codecs e multimídia ───────────────────────────────────
log "Instalando codecs e multimídia"
apt-get install -y \
    mint-meta-codecs \
    ffmpeg \
    gstreamer1.0-plugins-ugly \
    v4l-utils v4l2-ctl \
    mplayer vlc \
    audacious audacity cheese winff soundconverter \
    simplescreenrecorder mkvtoolnix

# ── 7. Java ──────────────────────────────────────────────────
log "Instalando Java"
apt-get install -y \
    openjdk-18-jdk \
    openjdk-21-jdk

# ── 8. Python ────────────────────────────────────────────────
log "Instalando Python"
apt-get install -y \
    python3-full python3-pip python-is-python3 \
    python3.12-full

# pip via pipx (não usa sudo pip3 — quebra ambientes em Python ≥ 3.11)
log "Instalando pipx e pacotes Python"
apt-get install -y pipx
sudo -u "$REAL_USER" pipx ensurepath
sudo -u "$REAL_USER" pipx install flask
sudo -u "$REAL_USER" pipx install flet
sudo -u "$REAL_USER" pipx install gdown
sudo -u "$REAL_USER" pipx install selenium
sudo -u "$REAL_USER" pipx install pyinstaller
sudo -u "$REAL_USER" pipx install pyautogui
sudo -u "$REAL_USER" pipx install hyfetch

# Pacotes globais de desenvolvimento (ainda aceitáveis via apt)
apt-get install -y python3-flask python3-sqlalchemy

# ── 9. PHP ───────────────────────────────────────────────────
log "Instalando PHP 8.1"
apt-get install -y \
    php8.1 php8.1-gd php8.1-pgsql php8.1-mysql \
    php8.1-xml php8.1-xmlrpc php8.1-zip php8.1-sqlite3

# ── 10. Ruby ─────────────────────────────────────────────────
log "Instalando Ruby"
apt-get install -y ruby-full bwidget

# ── 11. Bancos de dados ──────────────────────────────────────
log "Instalando bancos de dados"
apt-get install -y redis-server sqlite3

# ── 12. Desenvolvimento ──────────────────────────────────────
log "Instalando ferramentas de dev"
apt-get install -y apache2 docker.io libpq-dev

# ── 13. Diagramas e gráficos ────────────────────────────────
log "Instalando ferramentas gráficas"
apt-get install -y \
    dia plantuml graphviz \
    ksnip flameshot shotwell simple-scan

# ── 14. PDF ──────────────────────────────────────────────────
log "Instalando ferramentas PDF"
apt-get install -y pdfarranger pdfmod pdfchain

# ── 15. Outros utilitários ───────────────────────────────────
log "Instalando utilitários"
apt-get install -y \
    dropbox nemo-dropbox nemo-image-converter nemo-terminal \
    caja caja-dropbox \
    keepassxc virtualbox virtualbox-ext-pack \
    virtualbox-guest-additions-iso \
    retext cmatrix neofetch \
    synapse filezilla \
    hplip hplip-gui \
    stacer ranger \
    speedtest-cli btop feh httpie unrar \
    openssh-client openssh-server

# ── 16. LaTeX ────────────────────────────────────────────────
log "Instalando LaTeX"
apt-get install -y texlive-latex-extra

# ── 17. Dependências de .deb externos ───────────────────────
log "Instalando dependências de .deb"
apt-get install -y \
    libgconf-2-4 libc++1 libu2f-udev libc6

# ── 18. PPAs com signed-by (método moderno) ──────────────────
log "Adicionando PPAs"

# indicator-sound-switcher
add-apt-repository -y ppa:yktooo/ppa

# texstudio
add-apt-repository -y ppa:sunderme/texstudio

# obs-studio
add-apt-repository -y ppa:obsproject/obs-studio

# vscode — signed-by moderno (apt-key está depreciado desde Ubuntu 22.04)
wget -qO- https://packages.microsoft.com/keys/microsoft.asc \
    | gpg --dearmor \
    | tee /usr/share/keyrings/microsoft.gpg > /dev/null
echo "deb [arch=$ARCH signed-by=/usr/share/keyrings/microsoft.gpg] \
https://packages.microsoft.com/repos/vscode stable main" \
    > /etc/apt/sources.list.d/vscode.list

# dbeaver
add-apt-repository -y ppa:serge-rider/dbeaver-ce

apt-get update -qq
apt-get install -y \
    indicator-sound-switcher \
    texstudio \
    obs-studio \
    code \
    dbeaver-ce
ok "PPAs instalados"

# ── 19. Cinnamon extensions / applets ───────────────────────
log "Instalando extensões Cinnamon"
EXTENSIONS_DIR="$HOME_DIR/.local/share/cinnamon/extensions"
APPLETS_DIR="$HOME_DIR/.local/share/cinnamon/applets"
mkdir -p "$EXTENSIONS_DIR" "$APPLETS_DIR"

GTILE_URL="https://cinnamon-spices.linuxmint.com/files/extensions/gTile@shuairan.zip"
MYLAUNCHER_URL="https://cinnamon-spices.linuxmint.com/files/applets/mylauncher@markbokil.com.zip"
GTILE_ZIP="$DOWNLOAD_DIR/gTile.zip"
MYLAUNCHER_ZIP="$DOWNLOAD_DIR/mylauncher.zip"

wget -qO "$GTILE_ZIP"      "$GTILE_URL"
wget -qO "$MYLAUNCHER_ZIP" "$MYLAUNCHER_URL"
unzip -qo "$GTILE_ZIP"      -d "$EXTENSIONS_DIR"
unzip -qo "$MYLAUNCHER_ZIP" -d "$APPLETS_DIR"
chown -R "$REAL_USER:$REAL_USER" "$EXTENSIONS_DIR" "$APPLETS_DIR"
ok "Extensões extraídas"

# ── 20. Downloads de .deb externos ──────────────────────────
log "Baixando .deb externos"

# Mantém versões mais recentes via URL sem número fixo onde possível
declare -A DEBS=(
    [google-chrome]="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
    [drawio]="https://github.com/jgraph/drawio-desktop/releases/download/v23.1.5/drawio-amd64-23.1.5.deb"
    [dbeaver]="https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb"
    [beekeeper]="https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v4.0.3/beekeeper-studio_4.0.3_amd64.deb"
    [mini-video-me]="https://github.com/maykbrito/mini-video-me/releases/download/v4.0.2/mini-video-me_4.0.2_amd64.deb"
    [balena-etcher]="https://github.com/balena-io/etcher/releases/download/v1.19.25/balena-etcher_1.19.25_amd64.deb"
    [iriunwebcam]="https://iriun.gitlab.io/iriunwebcam-2.8.1.deb"
    [warsaw]="https://cloud.gastecnologia.com.br/cef/warsaw/install/GBPCEFwr64.deb"
    [insync]="https://cdn.insynchq.com/builds/linux/insync_3.8.5.50499-jammy_amd64.deb"
    [insync-nemo]="https://cdn.insynchq.com/builds/linux/insync-nemo_3.7.9.50368_all.deb"
    [insync-icons]="http://apt.insync.io/ubuntu/pool/contrib/i/insync-emblem-icons/insync-emblem-icons_3.4.2.40983_all.deb"
    [mega]="https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megasync-xUbuntu_22.04_amd64.deb"
    [mega-nemo]="https://mega.nz/linux/repo/xUbuntu_22.04/amd64/nemo-megasync-xUbuntu_22.04_amd64.deb"
    [netbeans]="https://github.com/Friends-of-Apache-NetBeans/netbeans-installers/releases/download/v27-build1/apache-netbeans_27-1_amd64.deb"
    [jdk]="https://download.oracle.com/java/25/latest/jdk-25_linux-x64_bin.deb"
    [pdf-studio]="https://download.qoppa.com/pdfstudioviewer/PDFStudioViewer_linux64.deb"
    [emby]="https://github.com/MediaBrowser/Emby.Releases/releases/download/4.8.8.0/emby-server-deb_4.8.8.0_amd64.deb"
)

# URLs com nome de arquivo definido pelo usuário
wget -qcO "$DOWNLOAD_DIR/discord.deb"  "https://discordapp.com/api/download?platform=linux&format=deb"
wget -qcO "$DOWNLOAD_DIR/insomnia.deb" "https://updates.insomnia.rest/downloads/ubuntu/latest?app=com.insomnia.app&source=website"
wget -qcO "$DOWNLOAD_DIR/postman.tar.gz" "https://dl.pstmn.io/download/latest/linux_64"

for name in "${!DEBS[@]}"; do
    wget -qc "${DEBS[$name]}" -P "$DOWNLOAD_DIR" && ok "$name baixado" || warn "$name falhou — continuando"
done

# ── 21. Instalar todos os .deb baixados ──────────────────────
log "Instalando .deb externos"
dpkg -i "$DOWNLOAD_DIR"/*.deb || true   # dpkg pode falhar por deps; apt resolve abaixo
apt-get install -f -y
apt-get --fix-broken install -y
ok ".deb instalados"

# ── 22. PostgreSQL + pgAdmin4 ────────────────────────────────
log "Instalando PostgreSQL 16 + pgAdmin4"
apt-get install -y postgresql-16

# pgAdmin4 — usa codename dinâmico
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub \
    | gpg --dearmor \
    | tee /usr/share/keyrings/pgadmin.gpg > /dev/null

echo "deb [signed-by=/usr/share/keyrings/pgadmin.gpg] \
https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$CODENAME pgadmin4 main" \
    > /etc/apt/sources.list.d/pgadmin4.list

apt-get update -qq
apt-get install -y pgadmin4
/usr/pgadmin4/bin/setup-web.sh || warn "setup-web falhou — execute manualmente"
ok "PostgreSQL + pgAdmin4 OK"

# ── 23. Spotify ──────────────────────────────────────────────
log "Instalando Spotify"
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg \
    | gpg --dearmor \
    | tee /usr/share/keyrings/spotify.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/spotify.gpg] http://repository.spotify.com stable non-free" \
    > /etc/apt/sources.list.d/spotify.list
apt-get update -qq
apt-get install -y spotify-client
ok "Spotify OK"

# ── 24. Brave ────────────────────────────────────────────────
log "Instalando Brave"
curl -fsS https://dl.brave.com/install.sh | sh
ok "Brave OK"

# ── 25. Flatpak apps ─────────────────────────────────────────
log "Instalando apps Flatpak"
FLATPAK_APPS=(
    com.github.vkohaupt.vokoscreenNG
    com.github.unrud.VideoDownloader
    com.uploadedlobster.peek
    org.kde.kdenlive
    io.github.flattool.Warehouse
    org.kde.kolourpaint
    io.github.adrienverge.PhotoCollage
    it.mijorus.gearlever
    org.gnome.gitlab.YaLTeR.VideoTrimmer
    com.rtosta.zapzap
    com.dec05eba.gpu_screen_recorder
    org.gnome.gitlab.somas.Apostrophe
    org.gaphor.Gaphor
    me.iepure.devtoolbox
    com.adrienplazas.Metronome
    io.gitlab.gregorni.Letterpress
    org.localsend.localsend_app
    io.gitlab.adhami3310.Footage
    hu.irl.cameractrls
)
for app in "${FLATPAK_APPS[@]}"; do
    flatpak install -y --noninteractive flathub "$app" \
        && ok "$app" || warn "$app falhou — continuando"
done

# ── 26. Snap (opcional — Linux Mint bloqueia por padrão) ─────
log "Habilitar Snap? (Linux Mint remove o suporte por padrão)"
read -r -p "  Deseja habilitar snapd? [s/N] " RESP
if [[ "${RESP,,}" == "s" ]]; then
    NOSNAP="$HOME_DIR/Documents/nosnap.backup"
    [[ -f /etc/apt/preferences.d/nosnap.pref ]] && \
        mv /etc/apt/preferences.d/nosnap.pref "$NOSNAP"
    apt-get update -qq
    apt-get install -y snapd
    ok "snapd instalado"
else
    warn "snap pulado"
fi

# ── 27. Limpeza final ────────────────────────────────────────
log "Limpeza final"
apt-get update -qq
apt-get dist-upgrade -y
flatpak update -y
apt-get autoclean -y
apt-get autoremove -y
# reinicia nemo para aplicar insync (opcional)
sudo -u "$REAL_USER" nemo -q 2>/dev/null || true

echo -e "\n\033[1;32m══════════════════════════════════════"
echo    "  Setup concluído com sucesso! 🎉"
echo -e "══════════════════════════════════════\033[0m\n"
