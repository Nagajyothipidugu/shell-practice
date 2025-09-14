#!/bin/bash 
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m" 


USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
   echo -e "$R ERROR:: Please run this script with root access $N" 
   exit 1 # give other than 0 upto 127
else 
   echo -e "$G You are running with root access  $N"
fi  


VALIDATE(){
    if [ $1 -eq 0 ] 
    then 
     echo -e " $G $2 installation is success... $N"
    else 
     echo -e " $R $2 installation is failure $N"
     exit 1

    fi
    }

dnf list installed mysql 
if [ $? -ne 0 ]
then 
   echo -e " $R Mysql is not installed...Going to install.. $N"
   dnf install mysql -y 
   VALIDATE $? "mysql" 
else 
   echo -e " $Y Mysql is installed..Nothing to do.. $N" 
fi 

dnf list installed nginx
if [ $? -ne 0 ]
then 
   echo "nginx is not installed...Going to install.."
   dnf install nginx -y 
   VALIDATE $? "nginx" 
else 
   echo -e "$Y nginx is installed..Nothing to do.. $N" 
fi 

dnf list installed python3
if [ $? -ne 0 ]
then 
   echo "python3 is not installed...Going to install.."
   dnf install python3 -y 
   VALIDATE $? "python3" 
else 
   echo -e "$Y python3 is installed..Nothing to do.. $N" 
fi 
