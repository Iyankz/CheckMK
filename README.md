# Checkmk Auto Installer for Ubuntu 24.04 (Noble)

![Checkmk Version](https://img.shields.io/badge/Checkmk-2.4.0p4-green?style=flat-square)
![OS](https://img.shields.io/badge/OS-Ubuntu_24.04-orange?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-blue?style=flat-square)

Skrip otomasi untuk instalasi **Checkmk Raw Edition** pada Ubuntu 24.04 (Noble Numbat). Dirancang untuk memudahkan deployment monitoring site dengan penanganan hak akses otomatis.
## ✍️ Penyusun & Kolaborasi
Skrip ini dikembangkan melalui kolaborasi antara:
* **Iyankz** (Inisiator & Developer)
* **Gemini** (AI Partner & Technical Assistant)

> **Kejujuran Intelektual:** Skrip ini disusun sebagai bagian dari proses belajar saya (Iyankz) dalam mendalami administrasi sistem Linux. Pengembangan ini dibantu oleh teknologi AI (Gemini) untuk memastikan kode yang dihasilkan mengikuti standar praktik terbaik.

---

## 🚀 Fitur Utama
* **Auto Root Elevation:** Menggunakan `sudo -i` otomatis untuk hak akses penuh.
* **Sandi Box & Permission Fix:** Solusi error `Permission denied` user `_apt` via direktori `/tmp`.
* **Automated Site Creation:** Membuat dan menjalankan monitoring site OMD secara instan.
* **Curl Optimized:** Mendukung eksekusi cepat satu baris perintah.

---

## 🛠️ Cara Penggunaan

### 1. Eksekusi Langsung via Curl
Gunakan perintah ini untuk instalasi instan tanpa menyimpan file:
```bash
curl -sSL https://raw.githubusercontent.com/Iyankz/CheckMK/refs/heads/main/checkmk.sh | sudo bash
