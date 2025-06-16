#!/bin/bash

USERID=$(id -u)

if [ $USERID -eq 0 ]
then
    echo " Running with root user"
else
    echo " Running with normal user "
    exit 1

fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo "$2 is sucessfully installed"
    else
        echo "$2 mysql is installation failed"
        exit 1
}

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "Mysql is not installed"
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo " Mysql is installed sucessfully"

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo " python3 is installed sucessfully"


dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo " nginx is installed sucessfully"