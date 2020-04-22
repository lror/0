#!/bin/bash

if [ "$1" == "" ]
then 
	echo "USE $0 endereço.do.site"
else
	echo "#####################################"
	echo "#########  BUSCANDO ... #############"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo " "

	wget -c --no-check-certificate "$1" -O "$1" >> "$1".log

	echo " "
	echo "#####################################"
	echo " "
	grep "href" "$1" | cut -d "/" -f3 | grep "\." |cut -d '"' -f1 | grep -v "|" | grep -v "top" | grep -v "<li" | sort -u >> "$1".list

	cat ""$1".list"

	echo " "
	echo "#####################################"
        echo "########  RESOLVENDO ... ############"
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo " "

	for url in $(cat "$1".list);do
		host $url | grep "has addres"
	done
fi
	echo " "
	echo "#####################################"
        echo "##############  ... #################"
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
rm -rf "$1".list "$1".log "$1"


