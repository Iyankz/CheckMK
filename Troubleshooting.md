# Troubleshooting Guide

Dokumen ini berisi daftar kendala yang mungkin ditemui selama instalasi atau konfigurasi Checkmk (OMD) beserta langkah-langkah solusinya.

---

## 1. Masalah: "Permission Denied" saat Install Paket .deb

**Penyebab:** User sistem `_apt` (yang digunakan oleh perintah `apt`) tidak memiliki izin untuk membaca file yang berada di dalam direktori home user (`/home/user/`).

**Solusi:**
Pindahkan paket ke direktori publik sementara (`/tmp`) dan berikan izin baca yang cukup sebelum melakukan instalasi.

```bash
# Pindahkan file ke folder /tmp
sudo cp *.deb /tmp/

# Berikan izin baca kepada semua user
sudo chmod 644 /tmp/*.deb

# Jalankan instalasi dari folder /tmp
sudo apt install /tmp/*.deb
```
## 2. Masalah: Web UI Tidak Bisa Diakses (404 Not Found / Timeout)
Solusi:

```bash
# Cek Layanan Apache: Pastikan web server berjalan dengan perintah: 
sudo systemctl status apache2.

#Cek Status Site: Pastikan situs monitoring aktif dengan perintah:
sudo omd status monitoring.

#Cek Firewall (UFW): Jika firewall aktif, izinkan trafik pada port 80 (HTTP):
sudo ufw allow 80/tcp
```

## 3. Masalah: Lupa Password cmkadmin
Solusi: Anda dapat mengganti password administrator melalui baris perintah dengan masuk sebagai user site terlebih dahulu:
```bash
sudo su - monitoring
htpasswd -m ~/etc/htpasswd cmkadmin
```
## 4. Masalah: Konflik Port (Port 80 Sudah Digunakan)
Penyebab: Aplikasi lain (seperti Nginx atau web server lain) sudah menggunakan port 80. Solusi: Ubah port default situs Checkmk (misalnya ke port 8080):
```bash
sudo omd stop monitoring
sudo omd config monitoring set APACHE_TCP_PORT 8080
sudo omd start monitoring
```
## Setelah perubahan ini, akses Web UI melalui: http://ip-server:8080/monitoring/
