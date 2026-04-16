#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FLODER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FLODER/$LOG_FILE-$TIMESTAMP.log"

CHECK(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ...$R failed $N"
        exit 1
    else
        echo -e "$2 ... $G sucess $N"
    fi
}

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then 
        echo "Error:: You must need sudo permission"
        exit 1
    fi
}

echo "script stared executing at : $TIMESTAMP" &>>$LOG_FILE_NAME


for package in $@
do
    dnf list installed $package &>>$LOG_FILE_NAME
    if [ $? -ne 0 ]
    then 
        dnf install $package -y &>>$LOG_FILE_NAME
        CHECK $? "Installing $package"
    else 
        echo -e "$package already ... $Y installed $N"
    fi
done