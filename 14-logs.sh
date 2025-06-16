#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
W="\e[37m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $1 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER

echo " Script started at $(date)" &>>$LOG_FILE
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
        echo -e "$R $2 installation failed $N"
        exit 1
    fi
}

dnf list installed mysql  &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo -e " $R Mysql is not installed $N"
    dnf install mysql -y  &>>$LOG_FILE
    VALIDATE $? "mysql"
else
    echo -e " $G Mysql is installed successfully $N"
fi

dnf list installed python3  &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo -e " $R python3 is not installed $N"
    dnf install python3 -y  &>>$LOG_FILE
    VALIDATE $? "python3"
else
    echo " $G python3 is installed successfully $N"
fi

dnf list installed nginx  &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo -e " $R nginx is not installed $N"
    dnf install nginx -y  &>>$LOG_FILE
    VALIDATE $? "nginx"
else
    echo -e " $G nginx is installed successfully $N"
fi