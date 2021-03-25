# Laporan Soal Shift Modul 1

### Kelompok A04
- Ihsannur Rahman Qalbi 05111940000090
- Muhamad Fikri Sunandar 05111940000135
- Reyhan Naufal Rahman 05111940000171

No 3a.
Screenshoot code:
Cara pengerjaan:
1. Iterasi sebanyakan 23 kali sesuai jumlah gambar yang akan didownload.
2. Di dalam iterasi dibuat variabel nama yang berisi string "Koleksi_" untuk menamai file/gambar yang didownload.
3. Variabel nama tersebut disesuaikan formatnya yakni ditambahin dua digit angka (sesuai iterasi) setelahnya ("Koleksi_01, Koleksi_02, ... Koleksi_23").
4. Download gambar dari link="https://loremflickr.com/320/240/kitten", dengan fungsi wget dan simpan lognya ke file "Foto.log" dengan parameter -a. Dan jangan lupa namai file/gambar download tersebut sesuai dengan format/variabel nama.
5. Hapus atau remove semua file atau gambar yang ada lebih dari satu (duplikat) dengan fungsi rdfind dan parameter -deleteduplicates true "alamat file".
Kendala atau eror selama pengerjaan:
- Fungsi wget tidak bisa digunakan dengan pesan eror="Permision denied"
Cara mengatasi dengan memberi fungsi sudo sebelum wget. Link referensi: https://askubuntu.com/questions/55606/getting-permission-denied-error-with-wget
- Sangat susah untuk mendownload gambar untuk tidak duplikasi
Cara penyelesaiannya dengan download semua gambar lalu hapus gambar duplikasi dengan fungs rdfind. Link referensi: https://www.tecmint.com/find-and-delete-duplicate-files-in-linux/

No 3b.
