#!/bin/bash
clear
echo -n "Please enter the database you want to drop:  "
read dbName

echo "*------------------------------------------------------------*"
if [ -d ./Databases/$dbName ];then
	rm -r ./Databases/$dbName
	echo "       Database dropped"
else
	echo "no such database found"
fi
echo "*-----------------------------------------------------------*"

. ./ListView.sh
