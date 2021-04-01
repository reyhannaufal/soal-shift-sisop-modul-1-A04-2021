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
### 1a
Mengambil line yang terdapat keyword "INFO" dan "ERROR"
### 1b
```sh
grep -i -o -P '(?<=error).* ' `pwd`/syslog.log
```
Mengambil line dengan keyword ERROR tanpa memasukkan keywoard dan kata sebelumnya
```sh
 sort | uniq -c | sort -nr
```
Sort line yang diambil agar bisa di count melalui uniq, kemudian do sort kembali berdasarkan count descending 
```sh
sed -E 's/^ *([0-9]||[0-9][0-9])  (.+)/\2\1/'
```
Swap posisi count dan deskripsi error
### 1c
```sh
arr=( $(grep -i -o -P '(?<=\().*(?=\))' `pwd`/syslog.log | sort | uniq) )
```
Membuat array yang berisikan semua username
```sh
for x in ${arr[@]} ; 
do
	errorc=0
	infoc=0
	errorc=$(grep -o -c "ERROR.*${x})" syslog.log)
	infoc=$(grep -o -c "INFO.*${x})" syslog.log)
	#total=$((total+errorc+infoc))

	echo "${x} Error = ${errorc}  Info = ${infoc}"
done
```
Looping untuk mengconcate string username dengan hasil count kemudian mencetak string tersebut
### 1d dan 1e
Menulis output yang didapat dari 1b dan 1c ke dalam csv

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
	wget -a Foto.log "https://loremflickr.com/320/240/kitten" "$dir"
done
```
Iterasi sebanyakan 23 kali sesuai jumlah gambar yang akan didownload. Download gambar dari link="https://loremflickr.com/320/240/kitten", dengan fungsi wget dan simpan lognya ke file "Foto.log" dengan parameter -a. Lalu langsung simpen gambar ke directory yang diinginkan.
```sh
rdfind -deleteduplicates true "$dir"
```
Hapus atau remove semua file atau gambar yang ada lebih dari satu (duplikat) dengan fungsi rdfind dan parameter -deleteduplicates true "alamat file".
```sh
num=0

for file_d in $dir"kitten"*
do
	let "num+=1"
	name="Koleksi_"
        if [ $num -lt 10 ]
        then
                name="${name}0${num}"
        else
                name="${name}${num}"
        fi
	`mv "$file_d" "$name"`
done
```
Iterasi semua gambar yang telah didownload dengan wild card kitten*. Di dalam iterasi dibuat variabel nama yang berisi string "Koleksi_" untuk merename file/gambar yang didownload tadi dengan command (mv). Variabel nama tersebut disesuaikan formatnya yakni ditambahin dua digit angka (sesuai iterasi) setelahnya ("Koleksi_01, Koleksi_02, ...").  Dan jangan lupa namai file/gambar download tersebut sesuai dengan format/variabel name.
```sh
nama_rem="results.txt"
`rm "$dir$nama_rem"`
```
Hapus file "results.txt" karena mengandung log hasil pengahapusan file yang duplikat.

**Kendala atau eror selama pengerjaan:**
- Fungsi wget tidak bisa digunakan dengan pesan eror="Permision denied"
Cara mengatasi dengan memberi fungsi sudo sebelum wget. Link referensi: https://askubuntu.com/questions/55606/getting-permission-denied-error-with-wget
- Sangat susah untuk mendownload gambar untuk tidak duplikasi
Cara penyelesaiannya dengan download semua gambar lalu hapus gambar duplikasi dengan fungs rdfind. Link referensi: https://www.tecmint.com/find-and-delete-duplicate-files-in-linux/.<br/>
### 3b
**Penjelasan**
```sh
program="soal3a.sh"
"`bash $dir$program`"
```
Jalankan script soal3a.sh (karena untuk awalan sama).
```sh
name_folder="`date +%d-%m-%Y`"
`mkdir "$name_folder"`
`mv Foto.log "$name_folder"`
```
Buat nama folder dengan nama tanggal dengan format DD-MM-YYYY, dengan fungsi date. Buat folder dengan nama di atas dengan fungsi mkdir. Pindahkan file "Foto.log" ke folder baru tersebut dengan fungsi mv.
```sh
name_file="Koleksi"
`mv $name_file* "$name_folder"`
```
Pindah semua file gambar dengan wild card 'Koleksi*' disertai dengan fungsi mv ke folder yang telah dibuat di atas. 
```sh
0 20 1-31/7,2-31/4 * * /bin/bash /home/mufis/PS/Pratikum_01/soal3/soal3b.sh
```
Buat crontab dengan nama "cron3b.tab" untuk mengerjakan script "soal3b.sh", dengan pola= 0 20 1-31/7,2-31/4 * * (sesuai soal).

**Kendala atau eror selama pengerjaan:**
- Crontab tidak bisa berjalan di komputer atau linux saya.

### 3c
**Penjelasan**
```sh
nama_folder="`date +%d-%m-%Y`"

A="2021-01-01"
intrvl_hari=$(( ($(date +%s) - $(date -d $A +%s)) / 86400 ))
```
Membuat variabel "nama_folder" dengan fungsi 'date' untuk menyimpan nama folder yang akan dipakai nantinya. Membuat variabel "A" untuk sebagai titik awal suatu tanggal. Dengan titik awal "A" sehingga bisa digunakan untuk menentukan kapan mendownload gambar kelinci atau kucing (karena harus bergantian berdasarkan hari). Interval hari (hari sekarang-titik awal "A") disimpan di variabel "intrvl_hari".
```sh
if [ $(($intrvl_hari % 2)) -eq 1 ]
then
	url="https://loremflickr.com/320/240/bunny"
	nama_folder="Kelinci_$nama_folder"
	nama_for="bunny"
else
	url="https://loremflickr.com/320/240/bunny"
	nama_folder="Kelinci_$nama_folder"
	nama_for="bunny"
fi
```
Karena harus bergantian secara hari file yang harus didownload (gambar kelinci atau kucing), pakai fungsi "if" untuk memberi kondisi dengan parameter "intrvl_hari" yang telah dibuat tadi lalu dimod 2. Jika ganjil maka download kelinci dan nama folder "Kelinci_(tanggal saat itu)". Selain itu, gambar kucing yang akan didownload.
```sh
for ((num=1; num<=23; num=num+1))
do
        wget -a Foto.log "$url" "$dir"
done
```
Lakukan iterasi 23 untuk mendowload file gambar/kelinci sesuai hari saat itu.
```sh
nama_rem="results.txt"
rdfind -deleteduplicates true "$dir"
`rm "$dir$nama_rem"`
```
Hapus file yang berduplikat. Hapus file "results.txt" karena mengandung hasil pengahapusan file yang duplikat.
```sh
num=0

for file_d in $dir$nama_for*
do
        let "num+=1"
        name="Koleksi_"
        if [ $num -lt 10 ]
        then
                name="${name}0${num}"
        else
                name="${name}${num}"
        fi
        `mv "$file_d" "$dir$name"`
done
```
Iterasi semua gambar yang telah didownload dengan wild card '$namafor*' (sesuai gambar yg didownload (bunny/kitten)). Di dalam iterasi dibuat variabel nama yang berisi string "Koleksi_" untuk merename file/gambar yang didownload tadi dengan command (mv). Variabel nama tersebut disesuaikan formatnya yakni ditambahin dua digit angka (sesuai iterasi) setelahnya ("Koleksi_01, Koleksi_02, ...").  Dan jangan lupa namai file/gambar download tersebut sesuai dengan format/variabel name.
```sh
`mkdir "$nama_folder"`
`mv Foto.log "$nama_folder"`
name_file="Koleksi"
`mv $name_file* "$nama_folder"`
```
Buat folder baru dengan nama yang telah disediakan di variabel "nama_folder". Pindahkan file tadi ke dalam folder yang telah dibuat. Pindahkan file 'Foto.log' dan semua gambar tadi ke folder baru.

**Kendala atau eror selama pengerjaan:**
- Tidak ditemukan eror atau kendala yang berarti saat pengerjaan no3c

### 3d
**Penjelasan**
```sh
dir="`pwd`/"
```
Melakukan perintah 'pwd' untuk mengetahui directory dari script dan menyimpannya di variabel "dir".
```sh
program="soal3c.sh"
"`bash $dir$program`"
```
Jalankan program script "soal3c.sh". Dengan perintah 'bash'.
```sh
pass="`date +%m%d%Y`"
"`zip -r --password $pass Koleksi.zip */`"
```
Buat password yang berisi tanggal pada saat script dijalankan dengan perintah 'date' dan simpan di variabel "pass". Salin semua folder yang berisi file dari script "soal3c.sh" ke dalam folder zip dengan bantuan wild card "*/" dengan password yang sudah dibuat tadi. Dengan perintah 'zip'.
```sh
"`rm -r $dir*/`"
```
Hapus semua folder yang telah dicopy ke zip.

Kendala atau eror selama pengerjaan:
- Mengalami kebingungan untuk memindah type folder di linux. Dan nemu solusinya dengan wildcard "*/". Link referensi: https://unix.stackexchange.com/questions/68489/command-to-zip-multiple-directories-into-individual-zip-files

### 3e
**Penjelasan**
```sh
0 7 * * 1-5 cd /home/mufis/PS/Pratikum_01/soal3 && zip -r --password "`date +%m%d%Y`" Koleksi.zip */ ; rm -r */
```
Membuat crontab dengan 2 pola waktu. Yang pertama untuk menzip folder, dengan pola senin-jumat jam 7 pagi. Pada pola pertama diisi dengan perintah buka directory yang dimaksud dengan perintah 'cd' lalu zip folder dengan perintah 'zip' serta password tanggal pada hari itu dengan perintah 'date', masukan ke file zip "Koleksi.zip". Setelah itu hapus semua folder dengan perintah 'rm' dan wildcard "*/".
```sh
0 18 * * 1-5 cd /home/mufis/PS/Pratikum_01/soal3 && unzip -P "`date +%m%d%Y`" Koleksi.zip ; rm -r *.zip
```
Yang kedua unzip folder dengan pola senin-jumat jam 18. Pada pola kedua diisi dengan perintah membuka directory yang dimaksud dengan perintah "cd" lalu unzip file "Koleksi.zip" dengan perintah "unzip" dengan password pada tanggal atau hari kejadian dengan perintah "date". Srelah itu hapus semua file zip dengan perintah "rm" dan wildcard "*.zip".

Kendala atau eror selama pengerjaan:
- Tidak ditemukan eror atau kendala yang berarti saat pengerjaan no3e
