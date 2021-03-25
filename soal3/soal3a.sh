#!/bin/bash
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
