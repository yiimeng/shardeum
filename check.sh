#!/bin/bash

while :
do
    docker exec shardeum-dashboard operator-cli status | grep -E "stopped|state: null"
    if [ $? -eq 0 ]
    then
        echo $(date)
        echo "START SHARDEUM"
        docker exec shardeum-dashboard operator-cli stop && docker exec shardeum-dashboard operator-cli start 
    fi
    sleep 1m
done
