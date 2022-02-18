#!/bin/bash
typeset -i numFields;
typeset -i recordnumber;
typeset -i num;
createFlag=false
flag=true
echo -e "\e[33m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "                       Database MENU"
echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\e[39m"
select dbChoice in 'Create Table' 'List All Tables' 'Drop Table' 'Select From Table' 'Insert Into Table' 'Delete From Table' 'Exit' 
do
 case $dbChoice in
    'Create Table')
		clear
		echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
		read -p "Please enter a string table name : " tableName   
        if [ -z "$tableName" ]
        then 
            echo -e "\e[31m This field is required!\e[39m"
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
                    echo -e "\e[31m This field is required!\e[39m" 
                    break
                elif [[ $field =~ ^[a-zA-Z]*$ ]]
                then
                    createFlag=true
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
                        echo -e "\e[31m This field is required!\e[39m" 
                        break
                    elif [[ $field =~ ^[a-zA-Z]*$ ]]
                    then
                     createFlag=true
                        while [[ "$field" ]]
                        do
                            fieldsarray[$num+1]=$field
                            numFields=$numFields+1
                            echo -n ':'$field >> $tableNameMeta
                            num+=1
                            read -p "Enter the fields of the table then press enter: " field
                        done
                            clear
                    else    echo -e "\e[31m must containes characters only\e[39m"
                    fi
                fi
                echo ''>> $tableNameMeta
                for((i=1 ;i<=$numFields ;i++))
                    do
                    echo "Select the datatype of field ${fieldsarray[$i-1]} then press enter: "
		    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                    select typeChoice in 'Integer' 'Varchar' 
                    do
                        case $typeChoice in
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
            if [ "$createFlag" = true ]
            then 
            clear            
            echo  -e "\e[94m Table $tableName is successfully created, press enter to continue"
	    echo  -e " >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><\e[39m"
            else
              rm  $tableName
              rm  ".${tableName}metadata"
              echo  -e "\e[31m error in creating table $tableName, press enter to continue"
	      echo -e " >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><\e[39m"
             fi
           
            fi 
           else
             echo -e "\e[31m must containes characters only\e[39m"  
        fi
        
        ;;
    'List All Tables')
		clear
		echo -e "\e[33m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
		echo -e "                      List of Tables" 
		echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\e[39m"
        ls
        echo -e "\e[94m press enter to continue\e[39m"
        ;;
    'Drop Table')
		clear
		echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
		read -p "Enter the table name you want to delete : " tableName
        if [ -z "$tableName" ]
        then
            echo -e "\e[31m This field is required!\e[39m"
        else
            if [ -f "$tableName" ]
                then 
                rm -i $tableName
                rm -i ".${tableName}metadata"
		echo -e "\e[94m Table deleted successfully, press enter to continue"
		echo -e "\e >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><\e[39m"
                if [ -f "$tableName" ] || [ -f ".${tableName}metadata" ] 
                then
                    echo -e "\e[31m Failed to delete table, press enter to continue"
		    echo -e " >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><\e[39m"
                fi
                else  
                    echo -e "\e[31m Table doesn't exist, press enter to continue"
		    echo -e " >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><\e[39m"
            fi  
        fi
        ;;
    'Select From Table')
		clear
		echo -e "\e[33m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
		echo -e "                        Select Menu"
		echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\e[39m"
		select pt in 'Select All Records In Table' 'Select One Record From Table' 'Exit'
            do
                case $pt in
                'Select All Records In Table')
                read -p "Enter the table name that you want to select from  " tableName 
                    if [ -z "$tableName" ]
                    then
                        echo -e "\e[31m This field is required.\e[39m" 
                    else
                        if [ -f "$tableName" ]
                        then 
                            if [ -z "$tableName" ]
                            then 
                                echo -e "\e[31m Table $tableName is empty, press enter to continue"
				echo -e " >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><\e[39m"
                                exit
                            else
			    echo -e "\e[94m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                            echo -e "              All records from table $tableName"
			    echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\e[39m"
                            cat $tableName
                            fi
                        else
                        echo -e "\e[31m $tableName table doesn't exist, press enter to continue"
			echo -e " >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><\e[39m"
                        fi 
                    fi
                ;;
                
                'Select One Record From Table')
                read -p "Enter the table name that you want to select from  " tableName 
                if [ -z "$tableName" ]
                then
                    echo -e "\e[31m This field is required!\e[39m"
                else
                    if [ -f "$tableName" ]
                    then
                        if [ -z "$tableName" ]
                        then 
                            echo -e "\e[31m $tableName Table is empty, press enter to continue"
			    echo -e " >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><\e[39m"
                            exit
                        else
                            recordnumber=$(tail -n 1 $tableName|cut -d: -f1) 
                            
                            read -p "Enter the primary key that you want to select " pk                      
                            if [ -z "$pk" ]
                            then
                                echo -e "\e[31m This field is required!\e[39m"
                            else
                                if [ $pk -le $recordnumber ]
                                then
                                        NR=$(awk 'BEGIN{FS=":"}{if ( $1 == "'$pk'" ) print NR}' $tableName 2>>/dev/null)
                                        if [[ $NR == "" ]]; 
                                        then
                                            echo -e "\e[31m record doesn't exist, press enter to continue"
					    echo -e " >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><\e[39m" 
                                        else
					    echo -e "\e[94m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                                            echo -e "      Record with primary key $pk from table $tableName"
					    echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\e[39m"
                                            echo $(awk 'BEGIN{FS=":";}{if ( NR == '$NR' ) print $0 }' $tableName 2>>/dev/null)
                                        fi
                                else
                                    echo -e "\e[31m please enter a valid primary key"
				    echo -e " >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><\e[39m" 
                                fi
                            fi
                        fi
                    else
                        echo -e "\e[31m $tableName table doesn't exist, press enter to continue" 
			echo -e " >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><\e[39m" 
                    fi
                fi
                ;;
                'Exit')
                    exit
                ;;
                *)  
                    echo -e "\e[31m Please Select A Valid Option!" 
		    echo -e " >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><\e[39m"
                ;;
                esac
            done
        ;;
		


    'Insert Into Table')
		clear
		echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
		read -p "Enter name of table to insert data " tableName  
        if [ -z "$tableName" ]
        then 
            echo -e "\e[31m This field is required!\e[39m"
        else
            if [ -f "$tableName" ]
            then
                numFields=$(awk -F: '{numFields = NF}END { print numFields } '<".${tableName}metadata")
                for((i=1 ;i<=$numFields;i++))
                do
                    
                    read -p "Enter the $(head -n 1 ".${tableName}metadata"|cut -d: -f$i) " data  
                    echo "$(tail -n 1 ".${tableName}metadata"|cut -d: -f$i) " 
                    
                    
                    case $(tail -n 1 ".${tableName}metadata"|cut -d: -f$i)  in
                    'Varchar')
                        [[ $data =~ ^[a-zA-Z]*$ ]] &&  flag=true || i=$i-1 flag=false
                     ;;
                    'Integer')
                        [[ $data =~ ^[0-9]+$ ]] && flag=true || i=$i-1 flag=false
                     ;;
                    *)
                        echo -e "\e[94m Data entered, press enter to continue"  
			echo -e " >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><\e[39m" 
                 ;;
                  esac
          

                    if [ -z "$data" ]
                    then
                        echo -e "\e[31m This field is required!\e[39m"
                    if [ "$flag" = true ]
                    then
                        i=$i-1
                    fi
                    else
			if [ "$flag" = false ]
                        then
                        continue
			fi
			if [[ $i == 1 ]] ; 
			   then
				x=`cut -f1 -d: $tableName | grep "^$data$"`
				if [[ $x = $data ]] ;
			   	  then flag=false
			   	  echo -e "\e[31m this pk already exist\e[39m"
			  	  exit
				fi
			fi
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
                echo -e "\e[31m $tableName table doesn't exist, press enter to continue" 
		echo -e " >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><\e[39m" 
            fi
        fi
        ;;
    'Delete From Table')
		clear
		echo -e "\e[33m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
		echo -e "                        Delete Menu"
		echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\e[39m"
		select del in 'Delete All Records' 'Delete One Record' 'Exit'
            do
                case $del in
                'Delete All Records')
		clear
		echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
                read -p "Enter the table name to delete from " tableName 
                if [ -z "$tableName" ]
                then
                    echo -e "\e[31m This field is required!\e[39m"
                else
                    if [ -f "$tableName" ]
                    then 
                        if [ -z "$tableName" ]
                        then 
                            echo -e "\e[31m $tableName is empty, press enter to continue"
			    echo -e " >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><\e[39m" 
                        else
                        sed -i '/^/d' $tableName
                        echo -e "\e[94m All records in table $tableName are successfully deleted, press enter to continue"
			echo -e ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><\e[39m" 
                        fi
                    else
                    echo -e "\e[31m $tableName table doesn't exist, press enter to continue"
		    echo -e " >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><\e[39m" 
                    fi 
                fi
                ;;
                 
                'Delete One Record')
		clear
		echo ">< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
                read -p "Enter name of table to delete from " tableName
                if [ -z "$tableName" ]
                then
                    echo -e "\e[31m This field is required!\e[39m"
                else
                    if [ -f "$tableName" ]
                    then
                        if [ -z "$tableName" ]
                        then
                            echo -e "\e[31m $tableName is empty, press enter to continue"
			    echo -e " >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><\e[39m" 
                        else
                            read -p "Enter primary key of the record you want to delete : " pk 
                            if [ -z "$pk" ]
                            then
                                echo -e "\e[31m This field is required!\e[39m"
                            else
                                recordnumber=$(tail -n 1 $tableName|cut -d: -f1) 
                                if [ $pk -le $recordnumber ]
                                then
                                       NR=$(awk 'BEGIN{FS=":"}{if ( $1 == "'$pk'" ) print NR}' $tableName 2>>/dev/null)
                                        if [[ $NR == "" ]]; 
                                        then
                                            echo -e "\e[31m Record doesn't exist, press enter to continue"
					    echo -e " >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><\e[39m" 
                                        else
                                            sed -i ''$NR'd' $tableName 2>>/dev/null
                                            echo -e "\e[94m The record with is successfully deleted, press enter to continue"
					    echo -e " >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><\e[39m" 
                                        fi
                                else
                                    echo -e "\e[31m Record isn't found, press enter to continue"
				    echo -e " >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><\e[39m" 
                                fi
                            fi
                        fi
                    else
                        echo -e "\e[31m Table doesn't exist, press enter to continue"  
			echo -e " >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><\e[39m" 
                    fi
                fi
                ;;
                'Exit')
                    exit
                ;;
                *)  
                    echo -e "\e[31m Please Select A Valid Option!" 
		    echo -e " >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><\e[39m"
                ;;
            esac
            done                
        ;;


    'Exit') 
    echo -e "\e[31m press ctrl+z to exit \e[39m"
        exit
	;;
    *) clear
	echo -e "\e[31m >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><"
        echo -e "              Please Select A Valid Option!" 
	echo -e " >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< ><\e[39m";;
    esac 
done
