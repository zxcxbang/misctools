#!/bin/bash
while true; do
    cpu_usage=$(top -b -n 1 | awk '/^%Cpu/{print $2}')

    echo "current cpu_usage: " $cpu_usage
    if (( $(echo "$cpu_usage < 20.0" | bc -l) )); then
        echo "start stress"
        #stress --cpu 2  --vm 1 --vm-bytes 128M --timeout 10s
        stress --cpu 2 --timeout 10s
    fi
    wget https://downloads.raspberrypi.org/imager/imager_latest_amd64.deb

    sleep 1
done
