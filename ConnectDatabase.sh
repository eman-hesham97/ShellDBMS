#!/bin/bash
clear
echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
echo -n "Please enter a name of a database to connect to: " 
read dbName

exitflag=0

while [ $exitflag -eq 0 ];do

if [ -z $dbName ];then
	echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
	echo -n "Please enter a name: "
	read dbName
	continue
fi
if [ -d ./Databases/$dbName ];then
	connectDB=$dbName
	cd ./Databases/$dbName
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "                     Database Connected"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	#echo $dbName > "./tmp"
	exitflag=1
else
	echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
	echo -n "No such Database found, try another name: "
	read dbName
fi
done
./../../dbConnectedList.sh
