#!/bin/bash
export PATH=/Users/vladislavkozulin/opt/GNAT/2020/bin:$PATH
gnatmake run.adb rozwiazanie.adb
echo "RUN"
time ./run