<img src="https://github.com/danuwrdna/technicalTestAccurateFlutterDeveloperDrajatDanuWardana/assets/90078732/af87a2ca-590f-4ea2-a63c-55726cd6b0f5" alt="splash screen" width="200" height="300">

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
  <img src="https://github.com/danuwrdna/technicalTestAccurateFlutterDeveloperDrajatDanuWardana/assets/90078732/6f7b1e8e-454f-48c8-a6f3-5548cc5c188d" alt="halaman utama user" width="200" height="300">
  
  Saat halaman utama klik icon search dan icon berubah menjadi text field di bawah ini
<img src="https://github.com/danuwrdna/technicalTestAccurateFlutterDeveloperDrajatDanuWardana/assets/90078732/548472cc-82a4-4cfb-9f95-78b8ccb623a9" alt="halaman search user" width="200" height="300">

dan klik text fieldnya dan keyboard otomatis muncul dan pencarian sudah bisa di lakukan
- Untuk mengurutkan nama user
  Klik saja icon A-Z yang ada di atas maka nanti akan mengurut sesuai abjad jika A maka yang di urut dari A jika Z maka yang di urut dari Z
- Untuk memfilter user berdasarkan kota
  Klik saja icon di samping kanan A-Z, nanti akan muncul halaman pilihan kota seperti di bawah ini
 <img src="https://github.com/danuwrdna/technicalTestAccurateFlutterDeveloperDrajatDanuWardana/assets/90078732/27bdca90-c728-4521-996d-e47f2d68e514" alt="halaman filter user" width="200" height="300">
 
 Pilih kota apa maka nanti data yang akan di tampilkan adalah user dari kota yang di pilih
- Untuk menambah data user
  Klik icon + nanti halaman akan berubah seperti di bawah ini
<img src="https://github.com/danuwrdna/technicalTestAccurateFlutterDeveloperDrajatDanuWardana/assets/90078732/a56de12a-3ca1-4027-8638-2d2fa07a1513" alt="halaman add user" width="200" height="300">

Tinggal di isi saja, form tidak boleh kosong harus di isi semua, jika memaksakan untuk submit maka akan tampil snackbar di bawah layar, jika data sucess atau gagal maka akan ada notifikasi, jika data berhasil disimpan tunggu notif menghilang selama 3 detik dan akan kembali ke layar utama setelah itu wajib sekali untuk mengklik icon refresh untuk melihat data yang baru di tambahkan.
