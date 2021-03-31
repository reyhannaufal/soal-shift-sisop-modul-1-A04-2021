#!/bin/bash
dir="`pwd`/"

program="soal3a.sh"
"`bash $dir$program`"

name_folder="`date +%d-%m-%Y`"
`mkdir "$name_folder"`

`mv Foto.log "$name_folder"`
name_file="Koleksi"
`mv $name_file* "$name_folder"`

