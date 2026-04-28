# PangkasDB - Prisma Database Builder

Folder ini berisi konfigurasi Prisma ORM untuk mengelola database MySQL PangkasKAKA.

## Cara Penggunaan

1. **Instalasi Dependensi**
   Pastikan Anda berada di root folder project, lalu jalankan:
   ```bash
   npm install
   ```

2. **Konfigurasi Database**
   Buka file `.env` di folder `PangkasDB` dan pastikan `DATABASE_URL` sesuai dengan kredensial MySQL Anda:
   ```env
   DATABASE_URL="mysql://username:password@localhost:3306/pangkaskaka"
   ```

3. **Generate Prisma Client**
   Jalankan perintah berikut untuk menghasilkan client Prisma:
   ```bash
   npx prisma generate --schema=./PangkasDB/prisma/schema.prisma
   ```

4. **Migrasi Database (Optional)**
   Jika Anda ingin melakukan sinkronisasi schema ke database:
   ```bash
   npx prisma db push --schema=./PangkasDB/prisma/schema.prisma
   ```

5. **Akses Database di Backend**
   Backend sudah dikonfigurasi untuk menggunakan instance Prisma di `src/lib/prisma.js`.

---
**Inspirasi Schema:** `Database/pangkaskaka.sql`
