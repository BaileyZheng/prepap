#!/bin/sh

cd ..
PREPAP_PATH=`pwd`
cd monitoring
ONLINE_MONITOR_H=$PREPAP_PATH/monitoring/online_monitor.h

pidnum=`cat /proc/sys/kernel/pid_max`
let pidnum=$pidnum+1
sed -i "/define MAXLENGTH/c #define MAXLENGTH $pidnum" $ONLINE_MONITOR_H
