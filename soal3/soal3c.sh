#!/bin/bash
dir="`pwd`/"

#tanggal="`date +%d`"
tanggal=30
nama_folder="`date +%d-%m-%Y`"

if [ $(($tanggal % 2)) -eq 1 ]
then
	url="https://loremflickr.com/320/240/bunny"
	nama_folder="Kelinci_$nama_folder"
else
	url="https://loremflickr.com/320/240/kitten"
	nama_folder="Kucing_$nama_folder"
fi

for ((num=1; num<=23; num=num+1))
do
        name="Koleksi_"
        if [ $num -lt 10 ]
        then
                name="${name}0${num}"
        else
                name="${name}${num}"
        fi
        wget -a Foto.log "$url" -O "$dir$name"
done

nama_rem="results.txt"

rdfind -deleteduplicates true "$dir"
`rm "$dir$nama_rem"`
`mkdir "$nama_folder"`
`mv Foto.log "$nama_folder"`
name_file="Koleksi"
`mv $name_file* "$nama_folder"`
