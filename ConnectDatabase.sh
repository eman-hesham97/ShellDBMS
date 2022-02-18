#!/bin/bash
clear
echo -e "\e[35m>< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
echo -ne "\e[35mPlease enter a name of a database to connect to: " 
read dbName

exitflag=0

while [[ $exitflag -eq 0 ]]
do

if [[ -z $dbName ]]
then
	echo -e "\e[35m>< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
	echo -ne "\e[35mPlease enter a name: \e[39m"
	read dbName
	continue
fi
if [[ -d ./Databases/$dbName ]]
then
	connectDB=$dbName
	cd ./Databases/$dbName
	echo -e "\e[31m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo -e "\e[31m                     Database Connected"
	echo -e "\e[31m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\e[39m"
	exitflag=1
else
	echo -e "\e[35m>< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
	echo -ne "\e[35mNo such Database found, try another name: \e[39m"
	read dbName
fi
done
./../../dbConnectedList.sh
