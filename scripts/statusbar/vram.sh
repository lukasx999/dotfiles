#!/usr/bin/env bash



fetch=$(nvidia-smi | awk 'NR==10 {print $9 $10 $11}')
used=$(echo $fetch | sed "s;M.*;;g")
avail=$(echo $fetch | sed "s;.*/;;g" | sed "s;M.*;;g")


perc=$(( ((used*100))/avail ))
used=$(( used/1000 ))

echo $perc
echo $used

