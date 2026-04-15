#!/bin/bash

MOVIES=("pushpa" "RRR" "Devara") #index starts from 0 size is 3
# Here index is start from 0,1,2,3 like that and list size is 3 listed 3 movie names
echo "First movie: ${MOVIES[0]}"
echo "Third movie: ${MOVIES[2]}"
echo "second movie: ${MOVIES[1]}"

echo "All movies are: ${MOVIES[@]}"  # Here @ means all @=ALL it will print all the movie names  