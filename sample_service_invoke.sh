#!/bin/bash
LOG_PATH=log.txt
CONSOLIDATE_ALL_LOGS=false
DEV_NULL=/dev/null
START_SCRIPT=./sample_background.sh

if [ "$CONSOLIDATE_ALL_LOGS" = "true" ]; then
  PID=`$START_SCRIPT "$@" > $LOG_PATH 2>&1 & echo $!`
  echo logging to file
else
  PID=`$START_SCRIPT "$@" > $DEV_NULL 2>&1 & echo $!`
  echo logging to /dev/null
fi
