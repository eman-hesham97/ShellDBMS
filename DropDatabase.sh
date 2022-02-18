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
	echo "<><><><><><><><><><>press enter to continue<><><><><><><><><>"
else
	echo "no such database found"
	echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
	echo "<><><><><><><><><><>press enter to continue<><><><><><><><><>"
fi

exit
