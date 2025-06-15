#!/bin/bash

echo " Name of the scrpit $0"
echo " 1st variable $1"
echo " Number of arguments  passed in the scrpit $#"
echo " All arguments  passed with quotes $@"
echo " All arguments passed in a single line $*"
echo " PID of the current shell $$"
echo " Exit status code of the last executed command $? "
sleep 10 &
echo " PID of the background $!"
echo "PWD $PWD"
echo "User $USER"
echo "Home $HOME"