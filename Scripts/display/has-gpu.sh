#!/bin/bash

VAR=`glxinfo|egrep 'OpenGL renderer'`
if [[ $VAR == *"GeForce"* ]]; then
  echo 1
else 
  echo 0
fi
