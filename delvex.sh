#!/bin/sh

# We will read single argument
if [ "$#" == 0 ]
then
	echo "Kernel Name: `uname`"
	echo "Kernel Version: `uname -r`"
	echo "Date: `date +%d`/`date +%m`/`date +%y`"
	echo "OS `cat /etc/os-release | head -1`"
	echo "last reboot info: "
	last reboot | head -2 | awk '{print "   " $5" "$6" "$7" "$8" "$9" "$10}'
elif [ "$1" == "time" ]
then
	date +%T
elif [ "$1" == "user" ]
then
 	users
elif [[ "$1" =~ ^[0-9]+$ ]]
then
	count=$1
	while [ $count != 0 ]
	do
		echo "Hello Delvex"
		sleep 1
		((count--))
	done
elif [[ "$1" == "windows" ]]
then
	shutdown now
fi


