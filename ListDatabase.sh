#!/bin/bash

clear
echo "*---------------------------------*"
for i in `ls ~/Shell/Databases`
do
if [[ -d ./Databases ]]
then
	echo $i
fi
done
echo "*---------------------------------*"
. ./ListView.sh
