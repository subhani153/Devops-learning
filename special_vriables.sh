#!/bin/bash

echo "all variables passed: $@"
echo "Number of variables: $#"
echo "script name: $0"
echo "Present working directory: $PWD"
echo "Home directory of current user: $HOME"
echo "which user is running this script: $USER"
echo "Process id of current script: $$"
sleep 60 &
echo "process id of last command in background: $!"