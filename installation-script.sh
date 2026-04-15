#!/bin/bash 
USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR:: you must need sudo permission"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
    dnf install mysql -y 
    if [ $? -ne 0 ]
    then 
        echo "Installation mysql...failed"
        exit 1
    else
        echo "Installation success"
    fi
else
    echo "MYSQL is already installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then 
    dnf install git -y
    if [ $? -ne 0 ]
    then 
        echo "Installation git ...failed"
        exit 1
    else
        echo "installation git ... Suceess"
    fi
else 
    echo "Git already installed"
fi