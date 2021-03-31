#!/bin/bash
dir="`pwd`/"

nama_folder="`date +%d-%m-%Y`"

A="2021-01-01"
intrvl_hari=$(( ($(date +%s) - $(date -d $A +%s)) / 86400 ))

if [ $(($intrvl_hari % 2)) -eq 1 ]
then
	url="https://loremflickr.com/320/240/bunny"
	nama_folder="Kelinci_$nama_folder"
	nama_for="bunny"
else
	url="https://loremflickr.com/320/240/kitten"
	nama_folder="Kucing_$nama_folder"
	nama_for="kitten"
fi

for ((num=1; num<=23; num=num+1))
do
        wget -a Foto.log "$url" "$dir"
done

nama_rem="results.txt"

rdfind -deleteduplicates true "$dir"
`rm "$dir$nama_rem"`

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

`mkdir "$nama_folder"`
`mv Foto.log "$nama_folder"`
name_file="Koleksi"
`mv $name_file* "$nama_folder"`
