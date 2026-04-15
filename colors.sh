#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

CHECK(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ... $R Failed"
        exit 1
    else
        echo -e "$2 ... $G Sucess"
    fi
}

if [ $USERID -ne 0 ]
then 
    echo "Error:: you need sudo permission"
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
    dnf instll mysql -y
    CHECK $? "Installating mysql"
else
    echo -e "mysql already... $Y installed $N"
fi

dnf list installed git
if [ $? -ne 0 ]
then 
    dnf install git -y
    CHECK $? "Installing Git"
else
    echo -e "Git already.... $Y installed"
fi