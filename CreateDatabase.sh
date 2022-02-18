#!/bin/bash
clear
echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
echo -n "Enter the database name to create: "
read DBName
exitflag=0


while [ $exitflag -eq 0 ];do

if [[ $DBName = *\ * ]]; then
	echo -e "\e[32m>< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
	echo -ne "\e[32m Please enter a valid name without white spaces: \e[39m"
	read DBName
	continue
fi

if [ -z $DBName ];then
echo -e "\e[32m>< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
echo -ne "\e[32m Please enter a name: \e[39m"
read DBName
continue
fi
if [ -d ./Databases/$DBName ];then
	echo -e "\e[32m >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
	echo -n "\e[32m DB already exist, Please enter another name: \e[39m"
	read DBName
	continue
else
	mkdir ./Databases/$DBName/
	echo -e "\e[31m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo -e "\e[31m           Database $DBName created successfully"
	echo -e "\e[31m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\e[39m"
	echo -e "\e[32m<><><><><><><><><><>press enter to continue<><><><><><><><><>\e[39m"
	exitflag=1
fi
done
exit
