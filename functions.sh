#!/bin/bash

USERID=$(id -u)

CHECK(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 ... Failed"
        exit 1
    else
        echo "$2 ... Suceess"
    fi
}

if [ $USERID -ne 0 ]
then 
    echo "Error:: You need sudo permission"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
    dnf install mysql -y
    CHECK $? "Installing Mysql"
else
    echo "mysql is already installed"
fi

dnf list installed git 

if [ $? -ne 0 ]
then 
    dnf install git -y
    CHECK $? "Installing Git"
else
    echo "Git already installed"
fi