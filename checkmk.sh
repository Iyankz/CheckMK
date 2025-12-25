#!/bin/bash

# --- Author: Iyankz & Gemini ---
# --- Variabel ---
CMK_VERSION="2.4.0p4"
CMK_DEB="check-mk-raw-${CMK_VERSION}_0.noble_amd64.deb"
CMK_URL="https://download.checkmk.com/checkmk/${CMK_VERSION}/${CMK_DEB}"
SITE_NAME="monitoring"

# --- 1. Update Sistem ---
echo "Update daftar paket sistem..."
sudo apt update -y

# --- 2. Download Checkmk ---
if [ ! -f "$CMK_DEB" ]; then
    echo "Mengunduh paket Checkmk versi ${CMK_VERSION} oleh Author: Iyankz & Gemini..."
    wget $CMK_URL
else
    echo "Paket ${CMK_DEB} sudah ada, melewati proses download."
fi

# --- 3. Install Checkmk ---
echo "Menginstal Checkmk... (ini mungkin memakan waktu beberapa menit)"
sudo apt install -y ./"$CMK_DEB"

# --- 4. Membuat Situs Monitoring ---
echo "Membuat situs OMD baru dengan nama: $SITE_NAME"
if sudo omd sites | grep -q "$SITE_NAME"; then
    echo "Situs '$SITE_NAME' sudah ada."
else
    sudo omd create "$SITE_NAME"
fi

# --- 5. Menjalankan Checkmk ---
echo "Menjalankan layanan Checkmk..."
sudo omd start "$SITE_NAME"

# --- 6. Menampilkan Informasi Akhir ---
IP_ADDR=$(hostname -I | awk '{print $1}')
echo "--------------------------------------------------------"
echo "Instalasi Selesai!"
echo "Script by: Iyankz & Gemini"
echo "URL Web UI: http://${IP_ADDR}/${SITE_NAME}/"
echo "Username: cmkadmin"
echo "Password: (Lihat pada output 'omd create' di atas)"
echo "--------------------------------------------------------"
