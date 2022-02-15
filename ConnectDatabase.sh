#!/bin/bash
clear
echo -n "Please enter a name of a database to connect to: " 
read dbName

exitflag=0

while [ $exitflag -eq 0 ];do

if [ -z $dbName ];then
	echo -n "Please enter a name: "
	read dbName
	continue
fi
if [ -d ./Databases/$dbName ];then
	connectDB=$dbName
	cd ./Databases/$dbName
	echo "Connected"
	echo $dbName > "./tmp"
	exitflag=1
else
	echo -n "No such Database found, try another name: "
	read dbName
fi
done
#cd ./Databases/$dbName
./../../dbConnectedList.sh
#cd ./Databases/$dbName
