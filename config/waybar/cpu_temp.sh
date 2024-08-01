#!/usr/bin/env bash

fetch=$(sensors | awk '/Package id 0/ {print $4}' | sed -e "s_^+__g" -e "s_\..__g")


temp=$(echo ${fetch//°C/})
#temp=$(echo $fetch | sed 's_°C$__g')

(( temp <= 40 )) && echo '' $fetch && exit 0
(( temp > 40 )) && (( temp < 60 )) && echo '' $fetch && exit 0
(( temp >= 60 )) && (( temp < 80 )) && echo '' $fetch && exit 0
(( temp >= 80 )) && echo '' $fetch && exit 0
