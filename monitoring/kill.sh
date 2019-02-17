#!/bin/bash
ps -af | grep -v PID | cut -c 9-15 | xargs kill -9
