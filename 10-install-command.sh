#!/bin/bash


# id -u ----> If we will get 0 means root otherwise normal user

USERID=$(id -u)

if [ $USERID -eq 0 ]
then
    echo " Running with root user"
else
    echo " Running with normal user "
    exit 1

fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "Mysql is not installed"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "Mysql is sucessfully installed"
    else
        echo "Mysql is installation failed"
    fi
else
    echo " Mysql is already installed"
    exit 0

fi


