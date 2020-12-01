#!/bin/bash

first=$1
second=$2
third=$3

if [ -z "$3" ]; then
   third=0
fi

sum=$(($first + $second + $third))
if [ "$sum" == "2020" ]; then
    echo "$1 + $2 = $sum"
    if [ "$third" == "0" ]; then third=1; fi
    multi=$(($first * $second * $third))
    echo "$1 * $2 = $multi"
    exit 0
fi
exit 1
