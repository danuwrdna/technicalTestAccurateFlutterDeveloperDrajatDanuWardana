![splash screen](https://github.com/danuwrdna/technicalTestAccurateFlutterDeveloperDrajatDanuWardana/assets/90078732/af87a2ca-590f-4ea2-a63c-55726cd6b0f5){width=50% height=100}


# Penjelasan
 tentang aplikasi ini
Ini adalah aplikasi untuk melihat, membuat. memfilter, mencari data user dari sebuah end point API, aplikasi ini di buat untuk menjadi satu syarat rekrutment di Accurate.
Adapun beberapa arsitektur, prinsip kode dan teknologi yang di gunakan dalam aplikasi ini :
# Arsitektur
- MVVM ( Model - View - View Model )
  Di dalam folder model berisikan kode untuk mengconvert Api, di dalam folder view berisikan widget dan page, di dalam folder view model berisikan sebuah method untuk 
  fetching data api yang di gunakan di dalam widget
# Prinsip code
- Single responsbility
  Jadi masing - masing method atau void berisi sebuah satu logic dengan sesuai nama voidnya, contoh misalkan void bernama filterDataUser, maka void itu berisikan logic 
  untuk memfilter data user saja tidak boleh yang lain.
# Teknologi atau stack yang digunakan
- HTTP
  Untuk keperluan mendapatkan API atau untuk mempost data aplikasi ke dalam API
- Lottie
  Untuk keperluan penggunaan Lottie animasi di halaman splash screen 
- Page transition
  Untuk keperluan pemindahan atau navigasi halaman secara otomatis tanpa ada tindakan dari user, dengan di berikan jeda waktu
# Mekanisme penggunaan aplikasi
- Untuk mencari User
  
