#!/bin/bash

monitoring_params() {
	timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
	date_only=$(date +"%Y-%m-%d")

	filename="monitoring_${date_only}_${timestamp}.csv"

	while true
	do
		current_date_only=$(date +"%Y-%m-%d")

		if [[ ! -f "monitoring_${current_date_only}_${timestamp}.csv" ]] 
		then
			date_only="$current_date_only"
			timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
			filename="monitoring_${date_only}_${timestamp}.csv"
			echo "Time,Disk Usage" > "$filename"
		fi
		disk_usage=$(df -h | grep /dev/sda2 | awk '{print $4}')
		echo "$(date +"%H:%M:%S"),$disk_usage" >> "$filename"
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

