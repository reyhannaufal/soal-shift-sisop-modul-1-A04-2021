#!/bin/bash
dir="`pwd`/"

program="soal3c.sh"
"`bash $dir$program`"


pass="`date +%m%d%Y`"

"`zip -r --password $pass Koleksi.zip */`"
"`rm -r $dir*/`"


