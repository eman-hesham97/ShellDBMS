#!/bin/bash
echo "Database MENU : "
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
                    echo "table already exist."
            else 
                read -p "Enter the Primary field : " field 
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
                    read -p "Enter the fields of the table : " field  
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
                    select opt3 in 'Integer' 'Varchar' 'Password' 'Date' 'Email' 
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
                        'Password')
                            dataType=Password
                            if [ "$i" == "$numFields" ]
                            then
                                echo -n $dataType >> $tableNameMeta
                            else
                                echo -n $dataType':' >> $tableNameMeta
                            fi 
                                break
                            ;;
                        'Date')
                            dataType=Date
                            if [ "$i" == "$numFields" ]
                            then
                                echo -n $dataType >> $tableNameMeta
                            else
                                echo -n $dataType':' >> $tableNameMeta
                            fi 
                                break
                            ;;
                        'Email')
                            dataType=Email
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
            echo "TABLE $tableName is successfully created."
            else
              rm  $tableName
              rm  ".${tableName}metadata"
              clear
              echo "TABLE $tableName  doesn't be created."
             fi
           
            fi 
           else
             clear
             echo "must containes characters only"  
        fi
        
        ;;
    'LIST TABLES')
		echo "ALL EXISTED TABLES : " 
        clear
        ls
        ;;
    'DROP TABLE');;
    'SELECT FROM TABLE');;
    'INSERT INTO TABLE');;
    'DELETE FROM TABLE');;
    'BACK') 
        echo "YOU ARE BACK TO THE MAIN MENU!"
        break 
        ;;
    *) 
        echo "Please Select A Valid Option!" ;;
    esac 
done
