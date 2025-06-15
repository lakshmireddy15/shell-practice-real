#!/bin/bash


# id -u ----> If we will get 0 means root otherwise normal user

USERID=$(id -u)

if [ $USERID -eq 0 ]
then
    echo " Running with root user"
else
    echo " Running with normal user "

fi