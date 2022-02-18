#!/bin/bash
clear
echo "                         ALL DATABASES"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
for i in `ls ./Databases`
do
if [[ -d ./Databases ]]
then
	echo $i
fi
done
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "<><><><><><><><><><>press enter to continue<><><><><><><><><>"
exit
