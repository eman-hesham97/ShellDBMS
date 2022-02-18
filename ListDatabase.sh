#!/bin/bash
clear
echo -e "\e[95m                         ALL DATABASES"
echo -e "\e[95m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
for i in `ls ./Databases`
do
if [[ -d ./Databases ]]
then
	echo $i
fi
done
echo -e "\e[95m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\e[39m"
echo -e "\e[32m<><><><><><><><><><>press enter to continue<><><><><><><><><>\e[39m"
exit
