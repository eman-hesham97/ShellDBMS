#!/bin/bash
typeset -i numFields;
typeset -i recordnumber;
typeset -i num;
flag2=false
flag=true
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "                       Database MENU"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
select opt2 in 'CREATE TABLE' 'LIST TABLES' 'DROP TABLE' 'SELECT FROM TABLE' 'INSERT INTO TABLE' 'DELETE FROM TABLE' 'BACK' 
do
 case $opt2 in
    'CREATE TABLE')
		clear
		echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
		read -p "Please enter a string table name : " tableName   
        if [ -z "$tableName" ]
        then 
            echo "This field is required!"
        elif [[ $tableName =~ ^[a-zA-Z]*$ ]]
         then
            tableNameMeta=".${tableName}metadata"
            if [ -f "$tableNameMeta" ]
            then
                    echo "table already exist, press enter to continue"
		    echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
            else 
                read -p "Enter the Primary field then press enter: " field 
                if [ -z "$field" ]
                then 
                    echo "This field is required!" 
                    break
                elif [[ $field =~ ^[a-zA-Z]*$ ]]
                then
                    flag2=true
                    numFields=0
                    num=0;
                    touch $tableName 
                    touch $tableNameMeta
                    echo -n $field >> $tableNameMeta
                    numFields=$numFields+1
                    fieldsarray[$num]=$field
                    read -p "Enter the fields of the table then press enter: " field  
                    if [ -z "$field" ]
                    then 
                        echo "This field is required!" 
                        break
                    elif [[ $field =~ ^[a-zA-Z]*$ ]]
                    then
                     flag2=true
                        while [[ "$field" ]]
                        do
                            fieldsarray[$num+1]=$field
                            numFields=$numFields+1
                            echo -n ':'$field >> $tableNameMeta
                            num+=1
                            read -p "Enter the fields of the table then press enter: " field
                        done
                            clear
                    else    echo "must containes characters only"
                    fi
                fi
                echo ''>> $tableNameMeta
                for((i=1 ;i<=$numFields ;i++))
                    do
                    echo "Select the datatype of field ${fieldsarray[$i-1]} then press enter: "
		    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                    select opt3 in 'Integer' 'Varchar' 
                    do
                        case $opt3 in
                        'Integer') 
                            dataType=Integer
                            if [ "$i" == "$numFields" ]
                            then
                                echo -n $dataType >> $tableNameMeta
                            else
                                echo -n $dataType':' >> $tableNameMeta
                            fi    
                                break
                            ;;
                        'Varchar')
                            dataType=Varchar
                            if [ "$i" == "$numFields" ]
                            then
                                echo -n $dataType >> $tableNameMeta
                            else
                                echo -n $dataType':' >> $tableNameMeta
                            fi 
                                break
                            ;;
                       
                        esac
                    done
                done  
            if [ "$flag2" = true ]
            then 
            clear            
            echo "Table $tableName is successfully created, press enter to continue"
	    echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
            else
              rm  $tableName
              rm  ".${tableName}metadata"
              echo "error in creating table $tableName, press enter to continue"
	      echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
             fi
           
            fi 
           else
             echo "must containes characters only"  
        fi
        
        ;;
    'LIST TABLES')
		clear
		echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
		echo "                      List of Tables" 
		echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        ls
        ;;
    'DROP TABLE')
		clear
		echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
		read -p "Enter the table name you want to delete : " tableName
        if [ -z "$tableName" ]
        then
            echo "This field is required!"
        else
            if [ -f "$tableName" ]
                then 
                rm -i $tableName
                rm -i ".${tableName}metadata"
		echo "Table deleted successfully, press enter to continue"
		echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
                if [ -f "$tableName" ] || [ -f ".${tableName}metadata" ] 
                then
                    echo "Failed to delete table, press enter to continue"
		    echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
                fi
                else  
                    echo "Table doesn't exist, press enter to continue"
		    echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
            fi  
        fi
        ;;
    'SELECT FROM TABLE')
		clear
		echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
		echo "                        Select Menu"
		echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
		select pt in 'SELECT ALL RECORDS' 'SELECT SINGLE RECORD' 'BACK'
            do
                case $pt in
                'SELECT ALL RECORDS')
                read -p "Enter the table name that you want to select from  " tableName 
                    if [ -z "$tableName" ]
                    then
                        echo "This field is required." 
                    else
                        if [ -f "$tableName" ]
                        then 
                            if [ -z "$tableName" ]
                            then 
                                echo "Table $tableName is empty, press enter to continue"
				echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
                                exit
                            else
			    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                            echo "              All records from table $tableName"
			    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                            cat $tableName
                            fi
                        else
                        echo "$tableName table is not exist, press enter to continue"
			echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
                        fi 
                    fi
                ;;
                
                'SELECT SINGLE RECORD')
                read -p "Enter the table name that you want to select from  " tableName 
                if [ -z "$tableName" ]
                then
                    echo "This field is required!"
                else
                    if [ -f "$tableName" ]
                    then
                        if [ -z "$tableName" ]
                        then 
                            echo "$tableName Table is empty, press enter to continue"
			    echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
                            exit
                        else
                            recordnumber=$(tail -n 1 $tableName|cut -d: -f1) 
                            # echo $recordnumber
                            read -p "Enter the primary key that you want to select " pk                      
                            if [ -z "$pk" ]
                            then
                                echo "This field is required!"
                            else
                                if [ $pk -le $recordnumber ]
                                then
                                        NR=$(awk 'BEGIN{FS=":"}{if ( $1 == "'$pk'" ) print NR}' $tableName 2>>/dev/null)
                                        if [[ $NR == "" ]]; 
                                        then
                                            echo "record doesn't exist, press enter to continue"
					    echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><" 
                                        else
					    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                                            echo "      Record with primary key $pk from table $tableName"
					    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                                            echo $(awk 'BEGIN{FS=":";}{if ( NR == '$NR' ) print $0 }' $tableName 2>>/dev/null)
                                        fi
                                else
                                    echo "please enter a valid primary key"
				    echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><" 
                                fi
                            fi
                        fi
                    else
                        echo "$tableName table doesn't exist, press enter to continue" 
			echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><" 
                    fi
                fi
                ;;
                'BACK')
                    ./../../ListView.sh
                ;;
                *)  
                    echo "Please Select A Valid Option!" 
		    echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
                ;;
                esac
            done
        ;;
		


    'INSERT INTO TABLE')
		clear
		echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
		read -p "Enter name of table to insert data " tableName  
        if [ -z "$tableName" ]
        then 
            echo "This field is required!"
        else
            if [ -f "$tableName" ]
            then
                numFields=$(awk -F: '{numFields = NF}END { print numFields } '<".${tableName}metadata")
                for((i=1 ;i<$numFields;i++))
                do
                    # echo $flag
                    read -p "Enter the $(head -n 1 ".${tableName}metadata"|cut -d: -f$i) " data  
                    echo "$(tail -n 1 ".${tableName}metadata"|cut -d: -f$i) " 
                    
                    # flag=true
                    case $(tail -n 1 ".${tableName}metadata"|cut -d: -f$i)  in
                    'Varchar')
                        [[ $data =~ ^[a-zA-Z]*$ ]] &&  flag=true || i=$i-1 flag=false
                     ;;
                    'Integer')
                        [[ $data =~ ^[0-9]+$ ]] && flag=true || i=$i-1 flag=false
                     ;;
                    *)
                        echo "Data entered, press enter to continue"  
			echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><" 
                 ;;
                  esac
          

                    if [ -z "$data" ]
                    then
                        echo "This field is required!"
                    if [ "$flag" = true ]
                    then
                        i=$i-1
                    fi
                    else
                        if [ "$flag" = false ]
                        then
                        continue
                        else
                            if [ "$i" == "$numFields" ]
                            then
                            echo -n $data >> $tableName
                            else
                            echo -n $data':' >> $tableName
                            fi
                        fi
                    fi
                done 
                echo ''>> $tableName
            else
                echo "$tableName table doesn't exist, press enter to continue" 
		echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><" 
            fi
        fi
        ;;
    'DELETE FROM TABLE');;
    'BACK') 
        ./../../ListView.sh
	;;
    *) clear
	echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
        echo "              Please Select A Valid Option!" 
	echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><";;
    esac 
done
