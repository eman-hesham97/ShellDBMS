#!/bin/bash
clear
echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
echo -n "Please enter the database you want to drop:  "
read dbName


if [ -d ./Databases/$dbName ];then
	rm -r ./Databases/$dbName
	echo -e "\e[31m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo -e "\e[31m                       Database dropped"
	echo -e "\e[31m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\e[39m"
	echo -e "\e[32m<><><><><><><><><><>press enter to continue<><><><><><><><><>\e[39m"
else
	echo "no such database found"
	echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
	echo -e "\e[32m<><><><><><><><><><>press enter to continue<><><><><><><><><>\e[39m"
fi

exit
