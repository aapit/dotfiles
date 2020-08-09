#!/bin/sh
sudo btrfs scrub start -B -d -c 2 -n 4 /home &&
sudo btrfs scrub start -B -d -c 2 -n 4 /
