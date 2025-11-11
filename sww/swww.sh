#!/bin/bash

# Start swww if not already running
pgrep -x swww >/dev/null || swww init

# Define wallpapers
wallpapers=(
  ~/.dotfiles/sww/rainworld2.png
  ~/.dotfiles/sww/mountains1.jpg
  ~/.dotfiles/sww/city.jpg
  ~/.dotfiles/sww/hardasslinux.png
)

# Infinite loop
while true; do
  for wp in "${wallpapers[@]}"; do
    swww img "$wp" --transition-type any --transition-duration 1
    sleep 600 # Wait 10 minutes
  done
done
