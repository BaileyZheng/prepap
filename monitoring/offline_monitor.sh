#!/bin/sh

export THIS_PID=$$
cd ..
PREPAP_PATH=`pwd`
cd monitoring
EVENT_FILE_CONFIG=$PREPAP_PATH/monitoring/conf
ABNORMAL_DATA_PATH=$PREPAP_PATH/dataset/rawdata/abnormal
QUICKHPC_PATH=$PREPAP_PATH/tools/quickhpc/quickhpc
ATTACK_PROGRAM_FILE=$PREPAP_PATH/monitoring/attack_path
INTERVAL=$1

while read line 
do	
	if [[ ${line:0:1} == '#' ]]
	then
		continue
	else
		PNAME=`echo ${line} | cut -d \  -f 1`
		PNAME=${PNAME##*\/}
		echo $PNAME
#		if [ -f $ABNORMAL_DATA_PATH/qhpc_${PNAME}_${INTERVAL}.txt ]
#		then
#			continue
#		fi
		# 运行程序
		${PREPAP_PATH}/${line} &
		# 获取运行程序的PID	
		PID=`ps -ef | grep $PNAME | grep -v grep | cut -c 9-15 `
		echo $PID
		if [ -z $PID ]
		then
			bash kill.sh
		fi
		# 监视事件信息
		$QUICKHPC_PATH -a $PID -i $INTERVAL -c $EVENT_FILE_CONFIG > $ABNORMAL_DATA_PATH/${PNAME}_$INTERVAL.csv
		wait
	fi
done < $ATTACK_PROGRAM_FILE
