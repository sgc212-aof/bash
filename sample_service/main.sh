#!/bin/bash
# Main script for calling the service invoker script

# Remove the log file before calling the service
rm -f log.txt
./sample_service_invoke.sh BJK GS FB
# Watch every second both the log file and ps -ef output
watch -n 1 -d "tail log.txt;echo '\n';ps -ef"
