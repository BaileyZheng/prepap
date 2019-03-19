#!/bin/bash
while true
do
	cat ~/.bash_history >> ~/prepap/dataset/normal/commands_collected.txt
	sleep 3600
done
