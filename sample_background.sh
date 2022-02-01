#!/bin/bash
# This script mimics a sample background script
echo Started
echo $@
echo Processing
for i in {1..7}
  do echo -e ".\c"
  sleep 1
done
echo stderr sample line >&2
echo Finished
