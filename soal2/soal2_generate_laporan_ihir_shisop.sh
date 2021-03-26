#!/bin/bash

 file='./Laporan-TokoShiSop.tsv'
 output='./hasil.txt'

# a
awk -F '\t' 'BEGIN {
    max = 0
    idmax = 9950
} {
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
    printf "Transaksi terakhir dengan profit precentage terbesar yaitu %d dengan presentasi %.2f", idmax, max
}' $file >> $output

 # b
 awk -F '\t' 'BEGIN {
    print "\n"
    print "Daftar nama customer di Albuquerque pada tahun 2017 antara lain:"
 } {
     if($10 == "Albuquerque") {
         if($2 ~ 17) 
            a[$7]++
     }
 } END {
     for (b in a) print b
 }' $file >> $output

 # c.
 awk -F '\t' 'BEGIN {
     print "\n"
 } {
    if($8=="Home Office")
        a++
    if($8 == "Corporate")
        b++
    if($8 == "Consumer")
        c++
 } END {
    if(b>a && c>a)
        printf "Tipe segmen customer yang penjualannya paling sedikit adalah Home Office dengan %d transaksi.\n", a
    if(a>b && c>b)
       printf "Tipe segmen customer yang penjualannya paling sedikit adalah Corporate dengan %d transaksi.\n", b
    if(a>c && b>c)
        printf "Tipe segmen customer yang penjualannya paling sedikit adalah Consumer dengan %d transaksi.\n", c
 }' $file >> $output


 # d.
 awk -F '\t' 'BEGIN {
     printf "\n"
 }{
     if(NR!=1)
        sum[$13] += $NF
 } END {
     min = 99999
     for (i in sum) {
         if (sum[i] < min) {
             min = sum[i]
             id = i
         }
     }
     printf "Wilayah bagian (region) yang memiliki total keuntungan profit paling sedikit %s dengan total keuntungan %d", id, min
 }' $file >> $output