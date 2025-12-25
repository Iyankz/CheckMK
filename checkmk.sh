#!/bin/bash

# --- Author: Iyankz & Gemini ---

# Pastikan script berjalan sebagai root
if [ "$EUID" -ne 0 ]; then
  echo "Meminta akses root... silakan masukkan password."
  exec sudo -i "$0" "$@"
  exit
fi

# --- Variabel ---
CMK_VERSION="2.4.0p4"
CMK_DEB="check-mk-raw-${CMK_VERSION}_0.noble_amd64.deb"
CMK_URL="https://download.checkmk.com/checkmk/${CMK_VERSION}/${CMK_DEB}"
SITE_NAME="monitoring"
TEMP_DIR="/tmp/checkmk_install"

echo "--------------------------------------------------------"
echo "Checkmk Installation Script by Iyankz & Gemini"
echo "--------------------------------------------------------"

# --- 1. Persiapan Folder & Update ---
echo "[1/5] Menyiapkan direktori sementara dan update sistem..."
mkdir -p $TEMP_DIR
cd $TEMP_DIR
apt update -y

# --- 2. Download Checkmk ---
echo "[2/5] Mengunduh paket Checkmk..."
wget -N $CMK_URL

# --- 3. Fix Permission & Install ---
# Memberikan izin baca agar user '_apt' bisa mengakses file
chmod 644 "$CMK_DEB"
echo "[3/5] Menginstal Checkmk..."
apt install -y ./"$CMK_DEB"

# --- 4. Membuat Situs Monitoring ---
echo "[4/5] Membuat situs OMD: $SITE_NAME"
if omd sites | grep -q "$SITE_NAME"; then
    echo "Situs '$SITE_NAME' sudah ada."
else
    omd create "$SITE_NAME"
fi

# --- 5. Menjalankan Checkmk ---
echo "[5/5] Menjalankan layanan..."
omd start "$SITE_NAME"

# --- 6. Output Akhir ---
IP_ADDR=$(hostname -I | awk '{print $1}')
echo "--------------------------------------------------------"
echo "INSTALASI BERHASIL!"
echo "Author: Iyankz & Gemini"
echo "--------------------------------------------------------"
echo "URL Web UI : http://${IP_ADDR}/${SITE_NAME}/"
echo "Username   : cmkadmin"
echo "--------------------------------------------------------"
