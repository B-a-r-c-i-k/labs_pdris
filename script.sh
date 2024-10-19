#!/bin/bash

monitoring_params() {
	for ((;;))
	do
		df -h | grep /dev/sda2 | awk '{print $4}' >> a.txt
		sleep 10
	done
}

if [[ $1 == "START" ]] 
then
	monitoring_params &
	echo "Running $!"	
elif [[ $1 == "STATUS" ]]
then
	if [[ $(pgrep -f "./script.sh START") ]]
	then
		echo "Executing"
	else
		echo "Not executing"
	fi
elif [[ $1 == "STOP" ]]
then
	kill $(pgrep -f "./script.sh START")
	echo "Stopped"
else
	echo "Wrong command"
fi

