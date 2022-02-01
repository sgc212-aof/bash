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
