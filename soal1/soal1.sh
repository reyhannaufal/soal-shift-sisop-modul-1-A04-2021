#!/bin/bash

echo "A."
#grep -e -c "ERROR" -e  "INFO" `pwd`/syslog.log

grep -o -e "ERROR.*)" -e "INFO.*)" `pwd`/syslog.log
echo
echo "B."
grep -i -o -P '(?<=error).* ' `pwd`/syslog.log | sort | uniq -c | sort -nr |sed -E 's/^ *([0-9]||[0-9][0-9])  (.+)/\2\1/'

echo
echo "C. "
arr=( $(grep -i -o -P '(?<=\().*(?=\))' `pwd`/syslog.log |sort|uniq) )

for x in ${arr[@]} ; 
do
	errorc=0
	infoc=0
	errorc=$(grep -o -c "ERROR.*${x})" syslog.log)
	infoc=$(grep -o -c "INFO.*${x})" syslog.log)
	#total=$((total+errorc+infoc))

	echo "${x} Error = ${errorc}  Info = ${infoc}"
done

echo
#echo "D"

echo Error,Count > `pwd`/error_message.csv
grep -i -o -P '(?<=error).* ' `pwd`/syslog.log | sort | uniq -c | sort -nr|sed -E 's/^ *([0-9]||[0-9][0-9])  (.+)/\2,\1/' >> `pwd`/error_message.csv

echo
#echo "E. "
echo Username,INFO,ERROR > `pwd`/user_statistics.csv
for x in ${arr[@]} ; 
do
	errorc=$(grep -o -c "ERROR.*${x})" syslog.log)
	infoc=$(grep -o -c "INFO.*${x})" syslog.log)
	echo "${x},${infoc},${errorc}" >> `pwd`/user_statistics.csv
done
