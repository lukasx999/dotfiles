#!/usr/bin/env bash


input=$(./voice2text.sh)
echo $input

tgpt "$input"
