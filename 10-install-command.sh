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
if [ $? -eq 0 ]
then
    echo " Mysql is already installed"
    exit 0
else

    echo "Mysql is not installed"
fi


