#!/bin/bash

file='./Laporan-TokoShiSop.tsv'
output='./hasil.txt'

# a. Steven ingin mengapresiasi kinerja karyawannya selama ini dengan mengetahui Row ID dan profit percentage terbesar (jika hasil profit percentage terbesar lebih dari 1, maka ambil Row ID yang paling besar). Karena kamu bingung, Clemong memberikan definisi dari profit percentage, yaitu:
# awk -F '\t' 'BEGIN {

# }'


# b nama customer pada transaksi tahun 2017 di Albuquerque.
# cust_name[7]
# order-date[2]
# pada tahun 2017 antara lain:"
awk -F '\t' 'BEGIN {
   print "Daftar nama customer di Albuquerque pada tahun 2017 antara lain:"
} {
    if($10 == "Albuquerque") {
        if($2 ~ 17) 
           a[$7]++
    }
} END {
    for (b in a) print b
}' $file >> $output

# c.	TokoShiSop berfokus tiga segment customer, antara lain: Home Office, Customer, dan Corporate. Clemong ingin meningkatkan penjualan pada segmen customer yang paling sedikit. Oleh karena itu, Clemong membutuhkan segment customer dan jumlah transaksinya yang paling sedikit.
# segment[8]


# d.	TokoShiSop membagi wilayah bagian (region) penjualan menjadi empat bagian, antara lain: Central, East, South, dan West. Manis ingin mencari wilayah bagian (region) yang memiliki total keuntungan (profit) paling sedikit dan total keuntungan wilayah tersebut.
awk -F '\t' 'BEGIN {
    printf "\n"
}{
    a[$13]++;
    asum[$13] += $NF
} END {
    for (i in asum) print a[i], asum[i] 
   
}' $file >> $output
