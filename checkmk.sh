#!/bin/bash

# --- Author: Iyankz & Gemini ---
# Script ini akan otomatis berpindah ke mode root

if [ "$EUID" -ne 0 ]; then
  echo "Meminta akses root... silakan masukkan password jika diminta."
  exec sudo -i "$0" "$@"
  exit
fi

# --- Variabel ---
CMK_VERSION="2.4.0p4"
CMK_DEB="check-mk-raw-${CMK_VERSION}_0.noble_amd64.deb"
CMK_URL="https://download.checkmk.com/checkmk/${CMK_VERSION}/${CMK_DEB}"
SITE_NAME="monitoring"

echo "--------------------------------------------------------"
echo "Checkmk Installation Script by Iyankz & Gemini"
echo "--------------------------------------------------------"

# --- 1. Update Sistem ---
echo "[1/5] Update daftar paket sistem..."
apt update -y

# --- 2. Download Checkmk ---
if [ ! -f "$CMK_DEB" ]; then
    echo "[2/5] Mengunduh paket Checkmk versi ${CMK_VERSION}..."
    wget $CMK_URL
else
    echo "[2/5] Paket ${CMK_DEB} sudah ada, melewati proses download."
fi

# --- 3. Install Checkmk ---
echo "[3/5] Menginstal Checkmk... (Proses ini membutuhkan waktu)"
apt install -y ./"$CMK_DEB"

# --- 4. Membuat Situs Monitoring ---
echo "[4/5] Membuat situs OMD baru: $SITE_NAME"
if omd sites | grep -q "$SITE_NAME"; then
    echo "Situs '$SITE_NAME' sudah tersedia."
else
    omd create "$SITE_NAME"
fi

# --- 5. Menjalankan Checkmk ---
echo "[5/5] Menjalankan layanan Checkmk..."
omd start "$SITE_NAME"

# --- 6. Menampilkan Informasi Akhir ---
IP_ADDR=$(hostname -I | awk '{print $1}')
echo "--------------------------------------------------------"
echo "INSTALASI SELESAI!"
echo "Author: Iyankz & Gemini"
echo "--------------------------------------------------------"
echo "URL Web UI : http://${IP_ADDR}/${SITE_NAME}/"
echo "Username   : cmkadmin"
echo "Password   : (Cek pada output 'omd create' di atas)"
echo "--------------------------------------------------------"
echo "Gunakan 'su - ${SITE_NAME}' untuk masuk ke lingkungan site."
