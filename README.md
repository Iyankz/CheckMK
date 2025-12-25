# Checkmk Auto Installer for Ubuntu 24.04 (Noble)

![Checkmk Version](https://img.shields.io/badge/Checkmk-2.4.0p4-green?style=flat-square)
![OS](https://img.shields.io/badge/OS-Ubuntu_24.04-orange?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-blue?style=flat-square)

Skrip otomasi untuk instalasi **Checkmk Raw Edition** pada Ubuntu 24.04 (Noble Numbat). Dirancang untuk memudahkan deployment monitoring site dengan penanganan hak akses otomatis.

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
```

----

## Dibuat dengan ❤️ oleh [Iyankz](https://github.com/Iyankz) & [Gemini AI](https://gemini.google.com/)

* **Iyankz** (Inisiator & Developer)
* **Gemini** (AI Partner & Technical Assistant)

## ⚖️ Lisensi
Proyek ini dilisensikan di bawah **MIT License** - lihat file [LICENSE](LICENSE) untuk detailnya.
