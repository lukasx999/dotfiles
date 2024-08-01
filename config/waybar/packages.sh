#!/usr/bin/env bash

packages=$(pacman -Qu | wc -l)

echo $packages
