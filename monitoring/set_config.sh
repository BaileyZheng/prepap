#!/bin/sh

cd ..
PREPAP_PATH=`pwd`
cd monitoring
ONLINE_MONITOR_H=$PREPAP_PATH/monitoring/online_monitor.h

pidnum=`cat /proc/sys/kernel/pid_max`
let pidnum=$pidnum+1
sed -i "/define MAXLENGTH/c #define MAXLENGTH $pidnum" $ONLINE_MONITOR_H
count=1
while [[ $pidnum != 0 ]]
do
	let pidnum=$pidnum/2
	let count=$count*2
done;
let count=$count-1
sed -i "/define QUEUELENGTH/c #define QUEUELENGTH $count" $ONLINE_MONITOR_H

