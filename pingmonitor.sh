#!/bin/bash

ip=$1
state=0

echo "time,ip,state"

while true
do
    ping -c 1 $ip > /dev/null
    if [ $? -eq 0 ]; then
        if [ $state -eq 0 ]; then
            state=1
            echo "$(date +%T),$ip,up"
        fi
    else
        if [ $state -eq 1 ]; then
            state=0
            echo "$(date +%T),$ip,down"
        fi
    fi
    sleep 1
done
