#!/bin/bash

for i in {1..100}
do
    echo "$i%"
    make grade CPUS=8 >& /dev/null

    # Check the exit status of the executable
    if [ $? -eq 0 ]; then
        echo "The executable ran successfully with an output of 0."
    else
        echo "The executable did not run successfully."
        exit 1
    fi
done