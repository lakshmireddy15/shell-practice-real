redirections:
< ---> it denotes input
> ----> it denotes output

> ---> It will store only sucess files not failure files
ls -l 1> output.log ----> 1 means sucess output. It will not store ls -l 2> output.log beacsue it i sucess  
error output code is 2 ---> hufhdijir 2> output.log

But here we don't know whether the given code is sucess or not.
In that can need to do '&'

but everytime it is over riding for we need to do >>
ls -l &>> output.log 

logs location  ----> VAR/LOGS

HERE we cannot store all files output in a single file. we need seprate log files  for each file

14.logs.sh.log
14.log.sh 
for getting scrpit namme we need to cut the .sh
echo  14.log.sh |cut -d "." -f1
