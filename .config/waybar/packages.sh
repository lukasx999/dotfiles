#!/usr/bin/env bash

packages=$(pacman -Q | wc -l)

echo $packages
