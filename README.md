# Laporan Soal Shift Modul 1

### Kelompok A04
- Ihsannur Rahman Qalbi 05111940000090
- Muhamad Fikri Sunandar 05111940000135
- Reyhan Naufal Rahman 05111940000171
### Daftar isi
1. [NO 1](#NO1)
2. [NO 2](#NO2)
3. [NO 3](#NO3)

## NO1
---
Soal no 1
## NO2
----
### 2a
Steven ingin mengapresiasi kinerja karyawannya selama ini dengan mengetahui Row ID dan profit percentage terbesar (jika hasil profit percentage terbesar lebih dari 1, maka ambil Row ID yang paling besar). Karena kamu bingung, Clemong memberikan definisi dari profit percentage, yaitu:

```
PProfit Percentage = (Profit ÷ Cost Price) ×100
```

Cost Price didapatkan dari pengurangan Sales dengan Profit. (Quantity diabaikan).

**Penjelasan**
```sh
awk -F '\t' 'BEGIN {
    max = 0
    idmax = 9950
}
```
menggunakan AWK -f untuk memisahkan kolom-kolom yang ada. Lalu definiskan nilai maximum dan id_maximum.
```sh
 if(NR!=1) {
          pp[$1] += (($21/($18-$21))*100) 
    }
} END {
    for (i in pp){
        if (pp[i] > max && i > idmax) {
            max = pp[i]
            idmax = i
        }
    }
}
```
hitung nilai dari profit percentage dengan kolom 1 sebagai nilai masukan, dan mengabaikan kolom pertama dengan menggunakan NR != 1.

Lalu bandingkan nilai max dan id_max dari setiap iterasi dengan menggunakan if-else statment.
### 2b
Clemong memiliki rencana promosi di Albuquerque menggunakan metode MLM. Oleh karena itu, Clemong membutuhkan daftar nama customer pada transaksi tahun 2017 di Albuquerque.
### 2c
TokoShiSop berfokus tiga segment customer, antara lain: Home Office, Customer, dan Corporate. Clemong ingin meningkatkan penjualan pada segmen customer yang paling sedikit. Oleh karena itu, Clemong membutuhkan segment customer dan jumlah transaksinya yang paling sedikit.
### 2d
TokoShiSop membagi wilayah bagian (region) penjualan menjadi empat bagian, antara lain: Central, East, South, dan West. Manis ingin mencari wilayah bagian (region) yang memiliki total keuntungan (profit) paling sedikit dan total keuntungan wilayah tersebut.

## NO3
---
No 3a.<br/>
Screenshoot code:<br/>
Cara pengerjaan:
1. Iterasi sebanyakan 23 kali sesuai jumlah gambar yang akan didownload.
2. Di dalam iterasi dibuat variabel nama yang berisi string "Koleksi_" untuk menamai file/gambar yang didownload.
3. Variabel nama tersebut disesuaikan formatnya yakni ditambahin dua digit angka (sesuai iterasi) setelahnya ("Koleksi_01, Koleksi_02, ... Koleksi_23").
4. Download gambar dari link="https://loremflickr.com/320/240/kitten", dengan fungsi wget dan simpan lognya ke file "Foto.log" dengan parameter -a. Dan jangan lupa namai file/gambar download tersebut sesuai dengan format/variabel nama.
5. Hapus atau remove semua file atau gambar yang ada lebih dari satu (duplikat) dengan fungsi rdfind dan parameter -deleteduplicates true "alamat file".<br/><br/>
Kendala atau eror selama pengerjaan:
- Fungsi wget tidak bisa digunakan dengan pesan eror="Permision denied"
Cara mengatasi dengan memberi fungsi sudo sebelum wget. Link referensi: https://askubuntu.com/questions/55606/getting-permission-denied-error-with-wget
- Sangat susah untuk mendownload gambar untuk tidak duplikasi
Cara penyelesaiannya dengan download semua gambar lalu hapus gambar duplikasi dengan fungs rdfind. Link referensi: https://www.tecmint.com/find-and-delete-duplicate-files-in-linux/.<br/>

No 3b.
