#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

CHECK(){
    if [$1 -ne 0 ]
    then 
        echo -e "$2 ... $R Failed $N"
        exit 1
    else 
        echo -e "$2 ... $G Success $N"
    fi
}

echo "script started executing at : $TIMESTAMP" &>>$LOG_FILE_NAME

if [ USERID -ne 0 ]
then 
    echo "Error:: You need Sudo permission"
    exit 1
fi

dnf list installed mysql &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then 
    dnf install mysql -y &>>$LOG_FILE_NAME
    CHECK $? "Installing MySql"
else
    echo -e "MySql already... $Y installed $N"
fi

dnf list installed git &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then
    dnf install git -y &>>$LOG_FILE_NAME
    CHECK $? "Installing Git"
else
    echo -e "Git Already.... $Y installed $N"
fi 