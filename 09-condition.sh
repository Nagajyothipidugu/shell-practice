#!/bin/bash 

# -gt --> greater than
# -ls --> less than 
# -eq --> equal to
# -ne --> Not equal 

NUMBER=$1 

if [ $NUMBER -lt 10 ]
then 
   echo "Number is less than 10"
else 
   echo "Number is not less than 10" 

fi 

