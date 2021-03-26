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
Soal no 1
## NO2
### 2a
Steven ingin mengapresiasi kinerja karyawannya selama ini dengan mengetahui Row ID dan profit percentage terbesar (jika hasil profit percentage terbesar lebih dari 1, maka ambil Row ID yang paling besar). Karena kamu bingung, Clemong memberikan definisi dari profit percentage, yaitu:

```
Profit Percentage = (Profit ÷ Cost Price) ×100
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

**Penjelasan**
```sh
if($10 == "Albuquerque") {
        if($2 ~ 17) 
        a[$7]++
}
```
Dengan menggunakan if statement pada kolom ke-10 untuk mendapatkan customer yang melakukan transaksi di kota Albuquerque. Lalu dengan menggunakan if (nested if) untuk mendapatkan transaksi pada tahun 2017. Nama-nama customer disimpan pada array a

```sh 
for (b in a) print b
```
Tampilkan customer-customer pada array a secara distinct.
### 2c
TokoShiSop berfokus tiga segment customer, antara lain: Home Office, Customer, dan Corporate. Clemong ingin meningkatkan penjualan pada segmen customer yang paling sedikit. Oleh karena itu, Clemong membutuhkan segment customer dan jumlah transaksinya yang paling sedikit.

**Penjelasan**
```sh 
if($8=="Home Office")
    a++
if($8 == "Corporate")
    b++
if($8 == "Consumer")
    c++
```
Untuk setiap segment customer, didefinisikan serupa. Lalu menghitung seberapa banyaknya segment customer tersebut muncul.

```sh
if(b>a && c>a)
    printf "Tipe segmen customer yang penjualannya paling sedikit adalah Home Office dengan %d transaksi.\n", a
if(a>b && c>b)
    printf "Tipe segmen customer yang penjualannya paling sedikit adalah Corporate dengan %d transaksi.\n", b
if(a>c && b>c)
    printf "Tipe segmen customer yang penjualannya paling sedikit adalah Consumer dengan %d transaksi.\n", c
```
Membandingkan nilai dari setiap segment, lalu menampilkan segment yang paling sedikit.
### 2d
TokoShiSop membagi wilayah bagian (region) penjualan menjadi empat bagian, antara lain: Central, East, South, dan West. Manis ingin mencari wilayah bagian (region) yang memiliki total keuntungan (profit) paling sedikit dan total keuntungan wilayah tersebut.

**Penjelasan**
```sh 
 if(NR!=1)
        sum[$13] += $NF
```
Menjumlahkan dari setiap baris yang ada lalu memasukan ke array Sum. If statement diatas digunakan untuk mengabaikan baris pertama.
```sh 
{
    min = 99999
    for (i in sum) {
        if (sum[i] < min) {
            min = sum[i]
            id = i
        }
    }
}
```
Mendefisikan nilai minimum dan membandingan nilai pada array sum, sehingga mendapatkan nilai minimum yang sesuai dengan permasalahan.
## NO3
### 3a
**Penjelasan**
```sh 
for ((num=1; num<=23; num=num+1))
do
	name="Koleksi_"
	if [ $num -lt 10 ]
	then
		name="${name}0${num}"
	else
		name="${name}${num}"
	fi
	wget -N -a Foto.log --page-requisites "https://loremflickr.com/320/240/kitten" -O "$dir$name"
done
```
Iterasi sebanyakan 23 kali sesuai jumlah gambar yang akan didownload. Di dalam iterasi dibuat variabel nama yang berisi string "Koleksi_" untuk menamai file/gambar yang didownload. Variabel nama tersebut disesuaikan formatnya yakni ditambahin dua digit angka (sesuai iterasi) setelahnya ("Koleksi_01, Koleksi_02, ... Koleksi_23"). Download gambar dari link="https://loremflickr.com/320/240/kitten", dengan fungsi wget dan simpan lognya ke file "Foto.log" dengan parameter -a. Dan jangan lupa namai file/gambar download tersebut sesuai dengan format/variabel nama.
```sh
rdfind -deleteduplicates true "$dir"
```
Hapus atau remove semua file atau gambar yang ada lebih dari satu (duplikat) dengan fungsi rdfind dan parameter -deleteduplicates true "alamat file".
**Kendala atau eror selama pengerjaan:**
- Fungsi wget tidak bisa digunakan dengan pesan eror="Permision denied"
Cara mengatasi dengan memberi fungsi sudo sebelum wget. Link referensi: https://askubuntu.com/questions/55606/getting-permission-denied-error-with-wget
- Sangat susah untuk mendownload gambar untuk tidak duplikasi
Cara penyelesaiannya dengan download semua gambar lalu hapus gambar duplikasi dengan fungs rdfind. Link referensi: https://www.tecmint.com/find-and-delete-duplicate-files-in-linux/.<br/>
### 3b
**Penjelasan**
```sh
dir="`pwd`/"

for ((num=1; num<=23; num=num+1))
do
        name="Koleksi_"
        if [ $num -lt 10 ]
        then
                name="${name}0${num}"
        else
                name="${name}${num}"
        fi
        wget -N -a Foto.log --page-requisites "https://loremflickr.com/320/240/kitten" -O "$dir$name"
done

rdfind -deleteduplicates true "$dir"
```
Copy semua isi dari soal3a.sh (karena untuk awalan sama).
```sh
name_folder="`date +%d-%m-%Y`"
`mkdir "$name_folder"`
`mv Foto.log "$name_folder"`
```
Buat nama folder dengan nama tanggal dengan format DD-MM-YYYY, dengan fungsi date. Buat folder dengan nama di atas dengan fungsi mkdir. Pindahkan file "Foto.log" ke folder baru tersebut dengan fungsi mv.
```sh
for ((num=1; num<=23; num=num+1))
do
        name="Koleksi_"
        if [ $num -lt 10 ]
        then
                name="${name}0${num}"
        else
                name="${name}${num}"
        fi
	`mv "$name" "$name_folder"`
done
```
Iterasi sampai 23 kali untuk memindahkan semua file gambar dengan fungsi mv ke folder di atas. Buat crontab dengan nama "cron3b.tab" untuk mengerjakan script "soal3b.sh", dengan pola= 0 20 1,2,6,8,10,14,15,18,22,26,29,30 * * (sesuai soal).
**Kendala atau eror selama pengerjaan:**
- Crontab tidak bisa berjalan di komputer atau linux saya.

