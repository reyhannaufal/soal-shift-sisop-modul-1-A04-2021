#!/bin/bash
dir="`pwd`/"

for ((num=1; num<=23; num=num+1))
do
	wget -a Foto.log "https://loremflickr.com/320/240/kitten" "$dir"
done

rdfind -deleteduplicates true "$dir"
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

nama_rem="results.txt"
`rm "$dir$nama_rem"`
