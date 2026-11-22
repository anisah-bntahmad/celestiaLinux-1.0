# Celestia 1.0 — Custom Linux Distribution (Astronomi & Sains)

**Celestia 1.0** adalah distribusi sistem operasi Linux berbasis **Ubuntu Desktop 26.04 LTS (Resolute Raccoon)** arsitektur 64-bit (`amd64`) yang dikembangkan melalui metode *remastering* menggunakan **Cubic (Custom Ubuntu ISO Creator)**.

## Tema Pengembangan
**Astronomi, Astrofisika, dan Observasi Antariksa** — menyediakan lingkungan kerja siap pakai bagi mahasiswa sains, peneliti, serta pengamat langit di Indonesia.

## Ringkasan Kustomisasi
* **Identitas Sistem:** Perubahan nama dan deskripsi rilis pada `/usr/lib/os-release`, `/etc/lsb-release`, dan `/etc/issue` menjadi **Celestia 1.0**.
* **Identitas Visual:** Kustomisasi *wallpaper* desktop bertema luar angkasa, ikon peluncur menu aplikasi GNOME Shell, serta logo tengah dan logo teks bawah pada *boot splash* Plymouth (`bgrt`).
* **Penghapusan Paket Bawaan:** `thunderbird*`, `libreoffice*`, `rhythmbox`, `transmission-*`, `gnome-mahjongg`, `remmina`.
* **Penambahan Paket Astronomi & Sains:** `gpredict`, `stellarium`, `python3-astropy`, `sunclock`, `gnuplot`, `geany`, `marble`, `kstars`, `saods9`, `xplanet`.
* **Konfigurasi Sistem:** Zona waktu otomatis `Asia/Jakarta` (WIB), *locale* `id_ID.UTF-8`, dan penguncian resolusi GRUB `1920x1080`.

## Anggota Kelompok
1. **ARYOBIMO MIPADELA JUNE (2604130076)** — Desainer Aset Visual & Antarmuka
2. **KHAIRUL HABIB NUR MUKHLIS (2604130138)** — Pengembang Sistem (*Remastering Engineer*)
3. **MUHAMMAD ZAIN ALI MU’AFA (2604130118)** — Studi Literatur & Penyusun Laporan Awal
4. **ANISAH(2604130167)** — Pengujian Sistem, Video Demonstrasi & Dokumentasi Teknis
