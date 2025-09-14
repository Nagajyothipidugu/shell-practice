#!/bin/bash 

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m" 
 
LOGS_FOLDER=/var/log/shellscript-logs
SCRIPT_NAME=$(echo $0 |cut -d "." -f1 )
LOG_FILE=$LOGS_FOLDER/$SCRIPT_NAME

mkdir -p $LOGS_FOLDER 
echo "script started executing at :: $(date)" &>>$LOG_FILE

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
   echo -e "$R ERROR:: Please run this script with root access $N" &>>$LOG_FILE
   exit 1 # give other than 0 upto 127
else 
   echo -e "$G You are running with root access  $N" &>>$LOG_FILE
fi  


VALIDATE(){
    if [ $1 -eq 0 ] 
    then 
     echo -e " $G $2 installation is success... $N" &>>$LOG_FILE
    else 
     echo -e " $R $2 installation is failure $N"  &>>$LOG_FILE
     exit 1

    fi
    }

dnf list installed mysql  &>>$LOG_FILE
if [ $? -ne 0 ]
then 
   echo -e " $R Mysql is not installed...Going to install.. $N" &>>$LOG_FILE
   dnf install mysql -y  &>>$LOG_FILE
   VALIDATE $? "mysql" 
else 
   echo -e " $Y Mysql is installed..Nothing to do.. $N"  &>>$LOG_FILE 
fi 

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]
then 
   echo "nginx is not installed...Going to install.." &>>$LOG_FILE
   dnf install nginx -y  &>>$LOG_FILE
   VALIDATE $? "nginx" 
else 
   echo -e "$Y nginx is installed..Nothing to do.. $N"  &>>$LOG_FILE
fi 

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]
then 
   echo "python3 is not installed...Going to install.." &>>$LOG_FILE
   dnf install python3 -y  &>>$LOG_FILE
   VALIDATE $? "python3" 
else 
   echo -e "$Y python3 is installed..Nothing to do.. $N"  &>>$LOG_FILE
fi 