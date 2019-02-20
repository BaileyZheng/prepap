#!/bin/bash
interval_set=(3 10 20 30 50 60 70 80 90 100 120 150 180 200 220 250 280 300 320 350 380 400 420 450 480 500 600 700 800 900 1000)
for((i=0;i<${#interval_set[@]};i++)) do
	./offline_monitor.sh ${interval_set[i]}
done;
