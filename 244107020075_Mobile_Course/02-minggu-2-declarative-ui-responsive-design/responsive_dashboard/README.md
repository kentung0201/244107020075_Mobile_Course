# AI Prompt Challenge — Academic Overview

## 1. Tujuan

Challenge ini bertujuan untuk mengevaluasi implementasi dashboard akademik menggunakan AI sebagai alat pembanding dan pemeriksa solusi teknis.

AI digunakan untuk:
- Membandingkan alternatif tata letak Flutter.
- Memahami penggunaan Expanded dan constraints.
- Melakukan verifikasi terhadap rekomendasi layout.
- Mengevaluasi responsivitas dan aksesibilitas aplikasi.

## 2. Prompt Desain

**Prompt:**

"Bandingkan dua tata letak dashboard akademik untuk Flutter: versi GridView dan versi LayoutBuilder + Column. Jelaskan trade-off responsif dan aksesibilitasnya."

**Hasil penting:**

GridView lebih sederhana untuk menampilkan kumpulan kartu dengan struktur seragam. Jumlah kolom dapat ditentukan menggunakan crossAxisCount.

LayoutBuilder + Column memberikan kontrol lebih besar terhadap susunan komponen, tetapi membutuhkan kode tambahan untuk mengatur setiap baris dan kolom.

**Keputusan:**

Menggunakan GridView karena dashboard memiliki empat kartu informasi dengan struktur seragam dan membutuhkan layout satu kolom pada layar sempit serta dua kolom pada layar lebar.

## 3. Prompt Penguatan Konsep

**Prompt:**

"Jelaskan kapan penggunaan Expanded justru menyebabkan overflow di dalam Row, beri contoh kode yang gagal dan perbaikannya."

**Hasil penting:**

Expanded membutuhkan ruang yang terbatas untuk menentukan ukuran widget anaknya.

Penggunaan Expanded dalam Row yang berada di dalam horizontal SingleChildScrollView dapat menyebabkan error karena constraints horizontal tidak terbatas.

**Keputusan:**

Menggunakan Expanded pada Row yang memiliki batas lebar jelas. Untuk konten horizontal yang tidak memiliki batas lebar, menggunakan SizedBox atau constraints yang sesuai.

## 4. Verification Prompt

**Prompt:**

"Periksa kembali rekomendasi layout di atas: apakah tetap responsif di bawah 600px, apakah mengurangi aksesibilitas, dan apakah ada widget yang tidak tersedia di Flutter stabil saat ini?"

**Hasil verifikasi:**

- Breakpoint 700 px menghasilkan satu kolom di bawah 700 px.
- Breakpoint 700 px menghasilkan dua kolom mulai dari 700 px.
- GridView, LayoutBuilder, Expanded, Column, Row, Container, Semantics, dan CupertinoSwitch tersedia dalam Flutter.
- Semantics membantu screen reader memahami informasi dashboard.
- Ukuran kartu tetap perlu diuji dengan pengaturan ukuran teks yang lebih besar.

## 5. Keputusan Akhir

Implementasi akhir tetap menggunakan GridView dengan LayoutBuilder.

Alasan:
1. Struktur kode lebih sederhana.
2. Mudah mengatur jumlah kolom berdasarkan ukuran layar.
3. Mendukung scrolling.
4. Tidak menghilangkan aksesibilitas selama Semantics diterapkan dengan benar.
5. Sesuai dengan kebutuhan dashboard akademik yang memiliki empat kartu informasi.

## 6. Bukti Verifikasi

### Screenshot layar sempit

Simpan hasil screenshot dengan nama:

`screenshots/academic_overview_mobile.png`

Menunjukkan dashboard dengan satu kolom.

### Screenshot layar lebar

Simpan hasil screenshot dengan nama:

`screenshots/academic_overview_desktop.png`

Menunjukkan dashboard dengan dua kolom.

### Pengujian

Perintah yang digunakan:

```bash
flutter analyze
flutter test
flutter run -d chrome
```

Checklist pengujian:

- [ ] Aplikasi berhasil dijalankan.
- [ ] Tidak terdapat error saat melakukan analisis kode.
- [ ] Dashboard menampilkan satu kolom pada layar sempit.
- [ ] Dashboard menampilkan dua kolom pada layar lebar.
- [ ] Light theme dan dark theme berfungsi.
- [ ] Semantics dapat dibaca oleh screen reader.
- [ ] Tidak terjadi overflow pada ukuran layar kecil.
- [ ] Screenshot mobile tersedia.
- [ ] Screenshot desktop tersedia.

**Catatan:** Hasil pengujian aktual dan screenshot harus diisi setelah aplikasi dijalankan dan diperiksa.

## 7. Kesimpulan

AI Prompt Challenge membantu mengevaluasi keputusan desain dan implementasi Flutter secara kritis.

Hasil perbandingan menunjukkan bahwa GridView sesuai untuk dashboard dengan kumpulan kartu seragam, sedangkan LayoutBuilder + Column lebih fleksibel untuk susunan yang membutuhkan kontrol khusus.

Rekomendasi AI tidak langsung digunakan tanpa pemeriksaan. Setiap keputusan perlu diuji melalui aplikasi dan diverifikasi berdasarkan dokumentasi Flutter.
