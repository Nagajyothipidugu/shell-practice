#!/bin/bash 

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m" 
 
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 |cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql"   "httpd" )

mkdir -p $LOGS_FOLDER 
echo "script started executing at :: $(date)" |tee -a $LOG_FILE

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
   echo -e "$R ERROR:: Please run this script with root access $N" |tee -a $LOG_FILE
   exit 1 # give other than 0 upto 127
else 
   echo -e "$G You are running with root access  $N" |tee -a $LOG_FILE
fi  

VALIDATE(){
    if [ $1 -eq 0 ] 
    then 
     echo -e " $G $2 installation is success... $N" | tee -a $LOG_FILE
    else 
     echo -e " $R $2 installation is failure $N"  | tee -a $LOG_FILE
     exit 1

    fi
    }
#for package in ${PACKAGES[@]}   
for package in $@
do 
   dnf list installed $package  &>>$LOG_FILE
   if [ $? -ne 0 ]
   then 
   echo -e " $R $package is not installed...Going to install.. $N" |tee -a $LOG_FILE
   dnf install $package -y  &>>$LOG_FILE
   VALIDATE $?  "$package" 
   else 
   echo -e " $Y $package is installed..Nothing to do.. $N"  | tee -a $LOG_FILE
   fi 
done

