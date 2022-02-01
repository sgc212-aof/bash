#!/bin/bash
# You can test this whole script in an online bash editor e.g. https://replit.com/languages/bash

cat << 'EOF' > sample_background.sh
#!/bin/bash
echo Started
# Simply print all the input arguments
echo $@
echo Processing
for i in {1..7}
do
  echo -e '.\c'
  sleep 1
done
# Just mimic stderr printing
echo stderr sample line >&2
echo Finished
EOF

chmod u+x sample_background.sh

cat << 'EOF' > sample_service_invoke.sh
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
EOF

chmod u+x sample_service_invoke.sh

# Remove the log file before calling the service
rm -f log.txt
./sample_service_invoke.sh BJK GS FB
watch -n 1 -d "tail log.txt;echo '\n';ps -ef"
