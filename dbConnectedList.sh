#!/bin/bash
echo "Database MENU : "
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
select opt2 in 'CREATE TABLE' 'LIST TABLES' 'DROP TABLE' 'SELECT FROM TABLE' 'INSERT INTO TABLE' 'DELETE FROM TABLE' 'BACK' 
do
 case $opt2 in
    'CREATE TABLE')
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
            else
              rm  $tableName
              rm  ".${tableName}metadata"
              echo "error in creating table $tableName, press enter to continue"
             fi
           
            fi 
           else
             echo "must containes characters only"  
        fi
        
        ;;
    'LIST TABLES')
		clear
		echo "List of Tables\n" 
		echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
        ls
        ;;
    'DROP TABLE')
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
                if [ -f "$tableName" ] || [ -f ".${tableName}metadata" ] 
                then
                    echo "1 Failed to delete table, press enter to continue"
                #else
                    #echo "2 Failed to delete table, press enter to continue"
                fi
                else  
                    echo "Table doesn't exist, press enter to continue"
            fi  
        fi
        ;;
    'SELECT FROM TABLE');;
    'INSERT INTO TABLE');;
    'DELETE FROM TABLE');;
    'BACK') 
        ./../../ListView.sh
	;;
    *) 
        echo "Please Select A Valid Option!" ;;
    esac 
done
