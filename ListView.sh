#!/bin/bash
#first menu that appear to user
echo -e "\e[36m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "                         Main Menu"
echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
select choice in "Press 1 to create a Database" "Press 2 to list all Databases" "Press 3 to connect to Database" "Press 4 to drop a Database" "Press 5 to exit"
do
case $REPLY in
	1)./CreateDatabase.sh;;
	2)./ListDatabase.sh;;
	3)./ConnectDatabase.sh;;
	4)./DropDatabase.sh;;
	5) exit ;;
	*) echo -e "\e[36m invalid option \e[39m";;
esac
done
