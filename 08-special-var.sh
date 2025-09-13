#!/bin/bash


echo "All variables passed to the script :: $@"
echo "Number of variables passed:: $#"
echo "Name of the current-script :: $0" 
echo "Present working directory :: $PWD" 
echo "user running this script :: $USER"
echo "Home directory of the user :: $HOME"
echo "PID of the script :: $$"
sleep 10 & 
echo "PID of the last command in the background :: $!" 
