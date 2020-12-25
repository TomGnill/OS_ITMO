#!/bin/bash

./loop.sh&pid0=$!
./loop.sh&pid1=$!
./loop.sh&pid2=$!

renice +10 -p $pid0
