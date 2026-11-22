#!/bin/bash
# Skrip Konfigurasi Remastering Celestia 1.0 (Ubuntu 26.04 LTS Base)
# Dijalankan di dalam lingkungan chroot Cubic

# 1. Kustomisasi Identitas Distribusi
cat << 'EOF' > /usr/lib/os-release
PRETTY_NAME="Celestia 1.0"
NAME="Celestia"
VERSION_ID="1.0"
VERSION="1.0 (Resolute)"
VERSION_CODENAME=resolute
ID=celestia
ID_LIKE=ubuntu
HOME_URL="https://ubuntu.com"
EOF

cat << 'EOF' > /etc/lsb-release
DISTRIB_ID=Celestia
DISTRIB_RELEASE=1.0
DISTRIB_CODENAME=resolute
DISTRIB_DESCRIPTION="Celestia 1.0"
EOF

echo "Celestia linux 1.0 \n \l" > /etc/issue

# 2. Pembaruan Repositori & Penghapusan Paket Bawaan (6 Kelompok Paket)
apt-get update
apt-get purge -y thunderbird* libreoffice* rhythmbox transmission-* gnome-mahjongg remmina
apt-get autoremove --purge -y

# 3. Instalasi Paket Tema Astronomi dan Sains (10 Paket)
apt-get install -y gpredict stellarium python3-astropy sunclock \
    gnuplot geany marble kstars saods9 xplanet
apt-get clean

# 4. Kustomisasi Aset Visual Desktop, Ikon, dan Boot Splash Plymouth
# (Pastikan aset gambar sudah disalin ke direktori /tmp/ sebelum menjalankan perintah ini)
cp /tmp/wallpaper-celestia.png /usr/share/backgrounds/warty-final-ubuntu.png
cp /tmp/view-app-grid-symbolic.svg /usr/share/icons/hicolor/scalable/actions/
gtk-update-icon-cache /usr/share/icons/hicolor/
glib-compile-resources /usr/share/gnome-shell/theme/gnome-shell-theme.gresource.xml

cp /tmp/celestia-logo.png /usr/share/plymouth/themes/bgrt/
cp /tmp/watermark.png /usr/share/plymouth/themes/bgrt/watermark.png
update-alternatives --set default.plymouth /usr/share/plymouth/themes/bgrt/bgrt.plymouth

# 5. Konfigurasi Regional Indonesia, GRUB, dan Initramfs
ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
dpkg-reconfigure -f noninteractive tzdata
locale-gen id_ID.UTF-8
update-locale LANG=id_ID.UTF-8

sed -i 's/^#GRUB_GFXMODE=.*/GRUB_GFXMODE=1920x1080/' /etc/default/grub
echo "GRUB_GFXPAYLOAD_LINUX=keep" >> /etc/default/grub
update-grub
update-initramfs -u -k all
