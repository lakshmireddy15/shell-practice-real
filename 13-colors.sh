#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
W=\e[37m"
N=\e[0m"


if [ $USERID -eq 0 ]
then
    echo -e " $G Running with root user $N"
else
    echo -e " $R Running with normal user $N"
    exit 1

fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "$Y $2 is sucessfully installed $N"
    else
        echo " $W $2 mysql is installation failed $N"
        exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo -e " $R Mysql is not installed $N"
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo -e " $G Mysql is installed sucessfully $N"
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo -e " $R python3 is not installed $N"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo " $G python3 is installed sucessfully $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo -e " $R nginx is not installed $N"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e " $G nginx is installed sucessfully $N"
fi