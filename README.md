# football_shop

**Tugas VII**
 1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
 jawab: widget tree adalah struktur hierarki bagaimana tampilan ui flutter dibentuk setiap elemen disebut dengan widget dan di dalam widget(parent) bisa memiliki widget lain sebagai anaknya. 
 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
 jawab: MaterialApp sebagai pembungkus aplikasi flutter, Scaffold sebagai kerangka dasar halaman, AppBar sebagai bagaian atas layar yang dapat berisi judul aplikasi atau tombol menu, Column berfungsi untuk menyusun widget secara vertikal, GridView.count berfungsi menyusun widget dalam bentuk grid, Padding berfungsi sebagai pemberi jarak antar widget dan tepinya, Center berfungsi meletakkan widget di tengah layar, text untuk menampilkan teks, icon untuk menampilkan icon, Material sebagai pembungkus widgetagar bisa punya efek material, inkWell berfungsi memberikan efek ketika widget diklik, SnackBar berfungsi memberikan notifikasi kecil di bawah layar.
 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
 jawab: MaterialApp adalah widget utama yang menjadi pintu masuk (entry point) aplikasi Flutter. Berfungsi menyediakan Tema, Navigasi, Judul & konfigurasi global, dan Homepage. Widget ini sering dijadikan sebagai root karena dia adalah fondasi utama aplikasi flutter dan dia yang mengatur tema global untuk seluruh aplikasi.
 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
 jawab: StatelessWidget artinya isi dari widgetnya tidak dapat diubah setelah dijalankan sedangkan StatefulWidget adalah widget yang punya “state” (keadaan) yang bisa disimpan di memori dan berubah saat aplikasi berjalan. Pilih StatelessWidget ketika tampilannya tidak akan berubah dari awal sampai akhir, tidak ada data yang diperbaharui saat aplikasi berjalan, atau tidak ada interaksi yang mengubah tampilan. Sebaliknya pilih StatefulWidget kalau mau ada interaksi dengan pengguna yang menyebabkan adanya perubahan data.
 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
 jawab: BuildContext itu ibarat alamat rumah di dalam sebuah komplek nah ini penting supaya flutter tau di mana posisi widgetnya. Penggunaannya di metode build sebagai parameter yang menunjukkan posisi widget di dalam pohon widget.
 6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
 jawab: hot reload menyegarkan tampilan UI tanpa kehilangan state (data saat ini) sedangkan hot restart menjalankan ulang aplikasi dari awal sehingga data di memori hilang.

**Tugas VIII**

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
jawab: kita tahu bahwa riwayat page yang dikunjungi oleh user disimpan di dalam sebuah page. navigator.push() menambahkan page yang baru di buka ke atas stack tanpa menghapus page saat ini di dalam stack. Sedangkan navigator.pushReplacement() itu menghapus page saat ini dari stack. navigator.push() sebaiknya digunakan ketika user meilhat detail produk karena user bisa back ke page sebelumnya yakni list of produk. Sedangkan untuk navigator.pushReplacement() digunakan setelah user mengisi form(menambahkan produk), user diarahkan ke homepage bukan ke form (page sebelumnya). 

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
jawab: saya menggunakan scaffold sebagai kerangka utama bangunan yang membungkus widget widget lain kemudian appbar untuk judul halaman dan drawer untuk navigasi samping. Nah scaffold menjamin struktur di setiap page selalu sama -> setiap page mempunyai header yang seragam (warna sama, font sama, posisi sama) dan Navigasi ke halaman lain selalu lewat cara yang sama, tidak berubah-ubah.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
jawab: padding digunakan untuk memberi jarak antar widget supaya tidak terlalu menempel contoh penggunaannya di form atau tombol tombol di halaman utama (supaya lebih enak untuk dilihat dan tidak bercampur), SingleChildScrollView digunakan supaya dapat menscroll suatu konten di halaman terlalu panjang tanpa ini sebagian form bisa saja tertutup atau muncul error overflow, dan ListView secara otomatis sudah scrollable dan cocok jika ada banyak elemen yang urut ke bawah contohnya pada drawer.
4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
jawab: kita bisa mengatur ThemeData pada MaterialApp sehingga warna utama (primary) dan warna aksen (secondary) mengikuti identitas brand Football Shop atau sesuai colour palette yang kita buat. Setelah itu widget - widget lain dapat langsung mengambil warna warna tersebut tanpa perlu mengatur ulang.