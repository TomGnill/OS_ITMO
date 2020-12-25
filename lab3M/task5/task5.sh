#!/bin/bash

mkfifo pipe
sh handler.sh&./generator.sh
rm pipe
