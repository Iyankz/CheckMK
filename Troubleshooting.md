# Troubleshooting Guide



Berikut adalah daftar kendala yang mungkin ditemui dan cara mengatasinya.



### 1. Masalah: "Permission Denied" saat install paket .deb

**Penyebab:** User sistem `_apt` tidak bisa membaca file di folder home user.

**Solusi:** Skrip sudah menangani ini dengan memindahkan file ke `/tmp` dan menjalankan `chmod 644`. Jika masih gagal, jalankan secara manual:

```bash

sudo cp *.deb /tmp/

sudo chmod 644 /tmp/*.deb

sudo apt install /tmp/*.deb

 Masalah: Web UI tidak bisa dibuka (404 Not Found / Timeout)

Solusi:



Pastikan Apache berjalan: sudo systemctl status apache2.

Periksa apakah situs OMD berjalan: sudo omd status monitoring.

Cek Firewall (UFW): sudo ufw allow 80/tcp.

3. Masalah: Lupa Password cmkadmin

Solusi: Anda dapat mengganti password admin melalui command line sebagai user site:



Bash



sudo su - monitoring

htpasswd -m ~/etc/htpasswd cmkadmin

4. Masalah: Port 80 sudah digunakan aplikasi lain

Solusi: Anda dapat mengubah port site Checkmk:



Bash



sudo omd stop monitoring

sudo omd config monitoring set APACHE_TCP_PORT 8080

sudo omd start monitoring



buat dalam 1 file Troubleshooting.md
