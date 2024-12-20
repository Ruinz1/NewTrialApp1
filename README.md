# New-TrialApp

## Tentang Aplikasi

BWA-TrialApp1 adalah aplikasi percobaan yang dirancang untuk membantu pengguna memahami dan menguji fitur-fitur dasar dari framework Laravel. Aplikasi ini menyediakan antarmuka yang sederhana dan fungsionalitas dasar untuk memulai pengembangan web dengan Laravel.

## Cara Instalasi

Ikuti langkah-langkah berikut untuk menginstal aplikasi ini di lingkungan lokal Anda:

1. **Kloning Repository**
   ```bash
   git clone https://github.com/username/New-TrialApp.git
   cd New-TrialApp
   ```

2. **Instalasi Dependensi**
   Pastikan Anda memiliki Composer terinstal di sistem Anda. Jalankan perintah berikut untuk menginstal semua dependensi PHP yang diperlukan:
   ```bash
   composer install
   ```

3. **Konfigurasi Lingkungan**
   Salin file `.env.example` menjadi `.env` dan sesuaikan konfigurasi database Anda:
   ```bash
   cp .env.example .env
   ```

4. **Generate Application Key**
   Jalankan perintah berikut untuk menghasilkan kunci aplikasi:
   ```bash
   php artisan key:generate
   ```

5. **Migrasi Database**
   Jalankan migrasi untuk membuat tabel database yang diperlukan:
   ```bash
   php artisan migrate
   ```

6. **Menjalankan Server**
   Jalankan server pengembangan lokal:
   ```bash
   php artisan serve
   ```

7. **Akses Aplikasi**
   Buka browser Anda dan akses `http://localhost:8000` untuk melihat aplikasi berjalan.

## Kontribusi

Kami menyambut kontribusi dari siapa pun yang tertarik untuk meningkatkan aplikasi ini. Silakan lihat panduan kontribusi di [dokumentasi Laravel](https://laravel.com/docs/contributions).

## Lisensi

Aplikasi ini adalah perangkat lunak sumber terbuka yang dilisensikan di bawah [lisensi MIT](https://opensource.org/licenses/MIT).