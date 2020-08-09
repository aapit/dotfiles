#!/bin/sh
sudo btrfs balance start -dusage=50 -dlimit=2 -musage=50 -mlimit=4 /home &&
sudo btrfs balance start -dusage=50 -dlimit=2 -musage=50 -mlimit=4 /
