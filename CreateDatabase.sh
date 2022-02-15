#!/bin/bash
clear
echo -n "Enter the database name to create: "
read DBName
exitflag=0


while [ $exitflag -eq 0 ];do

if [[ $DBName = *\ * ]]; then
	echo -n "Please enter a valid name without white spaces: "
	read DBName
	continue
fi

if [ -z $DBName ];then
echo -n "Please enter a name: "
read DBName
continue
fi
if [ -d ./Databases/$DBName ];then
	echo -n "DB already exist, Please enter another name: "
	read DBName
	continue
else
	mkdir ./Databases/$DBName/
	echo "Database $DBName created successfully"
	exitflag=1
fi
done
. ./ListView.sh
