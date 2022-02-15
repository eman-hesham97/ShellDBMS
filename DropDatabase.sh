#!/bin/bash
clear
echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
echo -n "Please enter the database you want to drop:  "
read dbName


if [ -d ./Databases/$dbName ];then
	rm -r ./Databases/$dbName
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "                       Database dropped"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
else
	echo "no such database found"
	echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
fi


. ./ListView.sh
