#!/bin/bash 

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
   echo "ERROR:: Please run this script with root access" 
   exit 1 # give other than 0 upto 127
else 
   echo "You are running with root access "
fi  

VALIDATE(){
    if [ $1 -eq 0 ] 
    then 
     echo "$2 installation is success..."
    else 
     echo "$2 installation is failure"
     exit 1

    fi
    }

dnf list installed mysql 
if [ $? -ne 0 ]
then 
   echo "Mysql is not installed...Going to install.."
   dnf install mysql -y 
   VALIDATE $? "mysql" 
else 
   echo "Mysql is installed..Nothing to do.." 
fi 

dnf list installed nginx
if [ $? -ne 0 ]
then 
   echo "nginx is not installed...Going to install.."
   dnf install nginx -y 
   VALIDATE $? "nginx" 
else 
   echo "nginx is installed..Nothing to do.." 
fi 

dnf list installed python3
if [ $? -ne 0 ]
then 
   echo "python3 is not installed...Going to install.."
   dnf install python3 -y 
   VALIDATE $? "python3" 
else 
   echo "python3 is installed..Nothing to do.." 
fi 

